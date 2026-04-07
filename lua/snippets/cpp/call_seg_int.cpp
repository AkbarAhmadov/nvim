struct SegTree{
    int null;
    int n;
    vector <int> t;
    void init(int n1, int null1) {
        n = n1;
        null = null1;
        t.assign(4*(n+2), null);          // intODO
    }
    int merge(int a, int b) {
        int c;
        if (a == null) return b;
        if (b == null) return a;
        c = min(a, b);                  // intODO
        return c;
    }
    void build(int v, int tl, int tr, vector <int> &a) {
        if (tl == tr) {
            t[v] = a[tl];
            return;
        }
        int tm = (tl + tr) / 2;
        build(v*2, tl, tm, a);
        build(v*2+1, tm+1, tr, a);
        t[v] = merge(t[v*2], t[v*2+1]);
    }
    int find(int v, int tl, int tr, int l, int r) {
        if (l > r) return null;
        if (tl == l && r == tr) return t[v];
        int tm = (tl + tr) / 2;
        int resL = find(v*2, tl, tm, l, min(r, tm));
        int resR = find(v*2+1, tm+1, tr, max(l, tm+1), r);
        int res = merge(resL, resR);
        return res;
    }
    void update(int v, int tl, int tr, int i, int x) {
        if (tl == tr) {
            t[v] = x;
            return;
        }
        int tm = (tl + tr) / 2;
        if (i <= tm) update(v*2, tl, tm, i, x);
        else update(v*2+1, tm+1, tr, i, x);
        t[v] = merge(t[v*2], t[v*2+1]);
    }
    int get(int l, int r) {
        return find(1, 0, n-1, l, r);
    }
    void upd(int i, int x) {
        update(1, 0, n-1, i, x);
    }
};

