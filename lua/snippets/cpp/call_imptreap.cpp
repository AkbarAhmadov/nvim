mt19937 rng(time(0));
struct ImpTreap{
    struct node{
        int x, y;
        int sz, sum;
        bool rev;
        node *l, *r;
        node (int a) : x(a), y(rng()), l(nullptr), r(nullptr), sz(1), rev(0), sum(a) {}
    };
    node *root = nullptr;
    int getsz(node *v) {
        if (!v) return 0;
        return v->sz;
    }
    int getsum(node *v) {
        if (!v) return 0;
        return v->sum;
    }
    int getval(node *v, int x) {
        if (v) push(v);
        int lsz = getsz(v->l) + 1;
        if (x == lsz) return v->x;
        if (lsz < x) return getval(v->r, x - lsz);
        else return getval(v->l, x);
    }
    void turn(node *&v) {
        if (!v) return;
        v->rev = !v->rev;
    }
    void upd(node *v) {
        if (!v) return;
        v->sz = getsz(v->l) + getsz(v->r) + 1;
        v->sum = getsum(v->l) + getsum(v->r) + v->x;
    }
    void push(node *&v) {
        if (!v || !v->rev) return;
        swap(v->l, v->r);
        turn(v->l);
        turn(v->r);
        turn(v);
    }
    void split(node *v, node *&l, node *&r, int x) {
        if (!v) {
            l = r = nullptr;
            return;
        }
        push(v);
        int lsz = getsz(v->l) + 1;
        if (lsz <= x) {
            split(v->r, v->r, r, x - lsz);
            l = v;
            upd(l);
        }
        else {
            split(v->l, l, v->l, x);
            r = v;
            upd(r);
        }
    }
    void merge(node *&v, node *l, node *r) {
        if (!l || !r) {
            v = l ? l : r;
            return;
        }
        push(l);
        push(r);
        if (l->y > r->y) {
            merge(l->r, l->r, r);
            v = l;
        }
        else {
            merge(r->l, l, r->l);
            v = r;
        }
        upd(v);
    }
    void insert(node *&v, int i, int x) {
        --i;
        node *l = nullptr, *r = nullptr;
        node *a = new node(x);
        split(v, l, r, i);
        merge(l, l, a);
        merge(v, l, r);
    }
    void erase(node *&v, int i) {
        --i;
        node *l = nullptr, *r = nullptr, *mid = nullptr;
        split(v, l, r, i);
        split(r, mid, r, 1);
        merge(v, l, r);
    }
    void swapseg(node *&v, int l1, int r1, int l2, int r2) {	// l1 <= r1 && l2 <= r2 && r1 < l2
        node *l = nullptr, *r = nullptr, *a = nullptr, *b = nullptr, *mid = nullptr;			// l a mid b r
        split(v, l, r, r2);
        split(l, l, b, l2-1);
        split(l, l, mid, r1);
        split(l, l, a, l1-1);
        // l b mid a r
        merge(l, l, b);
        merge(l, l, mid);
        merge(l, l, a);
        merge(v, l, r);
    }
    void reverseg(node *&v, int l, int r) {
        node *a = nullptr, *b = nullptr, *c = nullptr;
        split(v, b, c, r);
        split(b, a, b, l-1);
        turn(b);
        merge(a, a, b);
        merge(v, a, c);
    }
    int sumseg(node *v, int l, int r) {
        node *a = nullptr, *b = nullptr, *c = nullptr;
        split(v, b, c, r);
        split(b, a, b, l-1);
        int res = b->sum;
        merge(v, a, b);
        merge(v, v, c);
        return res;
    }
    void insert(int i, int x) {
        insert(root, i, x);
    }
    void erase(int i) {
        erase(root, i);
    }
    void swapseg(int l1, int r1, int l2, int r2) {
        swapseg(root, l1, r1, l2, r2);
    }
    void reverseg(int l, int r) {
        reverseg(root, l, r);
    }
    int getval(int i) {
        return getval(root, i);
    }
    int sumseg(int l, int r) {
        return sumseg(root, l, r);
    }
};
{{CURSOR}}
