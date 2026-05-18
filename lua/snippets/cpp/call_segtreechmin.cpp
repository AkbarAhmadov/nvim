struct SegTree {
    struct node{
        int mx, mx2, cmx, sum, lazy;
    };
    node null;
    int n;
    vector <node> t;
    void init(int n1) {
        n = n1;
        null.mx = null.mx2 = -INF;
        null.lazy = INF;
        null.sum = null.cmx = 0;
        t.assign(4 * (n + 2), null);
    }
    node merge(node a, node b) {
        node c = null;
        if (a.mx == b.mx) {
            c.mx = a.mx;
            c.cmx = a.cmx + b.cmx;
            c.mx2 = max(a.mx2, b.mx2);
        }
        else if (a.mx > b.mx) {
            c = a;
            c.mx2 = max(c.mx2, b.mx);
        }
        else {
            c = b;
            c.mx2 = max(c.mx2, a.mx);
        }
        c.sum = a.sum + b.sum;
        return c;
    }
    void build(int v, int tl, int tr, vector <int> &a) {
        if (tl == tr) {
            t[v].mx = t[v].sum = a[tl];
            t[v].cmx = 1;
            return;
        }
        int tm = (tl + tr) / 2;
        build(v*2, tl, tm, a);
        build(v*2+1, tm+1, tr, a);
        t[v] = merge(t[v*2], t[v*2+1]);
    }
    void fix(int v, int x) {
        if (x >= t[v].mx) return;
        t[v].sum -= (t[v].mx - x) * t[v].cmx;
        t[v].mx = t[v].lazy = x;
    }
    void push(int v) {
        if (t[v].lazy == INF) return;
        fix(v*2, t[v].lazy);
        fix(v*2+1, t[v].lazy);
        t[v].lazy = INF;
    }
    node find(int v, int tl, int tr, int l, int r) {
        if (l > r) return null;
        if (tl == l && tr == r) return t[v];
        push(v);
        int tm = (tl + tr) / 2;
        node resL = find(v*2, tl, tm, l, min(r, tm));
        node resR = find(v*2+1, tm+1, tr, max(l, tm+1), r);
        return merge(resL, resR);
    }
    void update(int v, int tl, int tr, int l, int r, int x) {
        if (l > r || x >= t[v].mx) return;
        if (tl == l && tr == r && x > t[v].mx2) {
            fix(v, x);
            return;
        }
        push(v);
        int tm = (tl + tr) / 2;
        update(v*2, tl, tm, l, min(r, tm), x);
        update(v*2+1, tm+1, tr, max(l, tm+1), r, x);
        t[v] = merge(t[v*2], t[v*2+1]);
    }
    node get(int l, int r) {
        return find(1, 0, n-1, l, r);
    }
    void upd(int l, int r, int x) {
        update(1, 0, n-1, l, r, x);
    }
};
