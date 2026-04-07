struct LCT{
    #define def nullptr
    int nul = INF;                 // TODO
    line null;
    struct node{
        line ln;
        node *l, *r;
        node (line a) : ln(a), l(def), r(def) {}
    };
    node *rt = def;
    int L, R;
    void init(int tl, int tr) {
        null.k = 0, null.b = INF;       // TODO
        L = tl, R = tr;
        rt = new node(null);
    }
    int merge(int a, int b) {
        return min(a, b);               // TODO
    }
    int find(node *v, int tl, int tr, int x) {
        if (!v) return nul;
        int tm = (tl + tr) / 2;
        int cur = v->ln.f(x);
        if (x <= tm) return merge(cur, find(v->l, tl, tm, x));
        else return merge(cur, find(v->r, tm+1, tr, x));
    }
    void update(node *&v, int tl, int tr, line a) {
        if (!v) {
            v = new node(a);
            return;
        }
        int tm = (tl + tr) / 2;
        if (v->ln.f(tm) > a.f(tm)) swap(v->ln, a);                  // TODO
        if (tl == tr) return;
        if (v->ln.f(tl) > a.f(tl)) update(v->l, tl, tm, a);         // TODO
        if (v->ln.f(tr) > a.f(tr)) update(v->r, tm+1, tr, a);       // TODO
    }
    int get(int x) {
        return find(rt, L, R, x);
    }
    void upd(line a) {
        update(rt, L, R, a);
    }
};

