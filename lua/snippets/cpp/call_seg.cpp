template <typename T>
struct SegTree{
    T null;
    int n;
    vector <T> t;
    void init(int n1, T null1) {
        n = n1;
        null = null1;
        t.assign(4*(n+2), null);          // TODO
    }
    T merge(T a, T b) {
        T c;
        if (a == null) return b;
        if (b == null) return a;
        c = min(a, b);                  // TODO
        return c;
    }
    void build(int v, int tl, int tr, vector <T> &a) {
        if (tl == tr) {
            t[v] = a[tl];
            return;
        }
        int tm = (tl + tr) / 2;
        build(v*2, tl, tm, a);
        build(v*2+1, tm+1, tr, a);
        t[v] = merge(t[v*2], t[v*2+1]);
    }
    T find(int v, int tl, int tr, int l, int r) {
        if (l > r) return null;
        if (tl == l && r == tr) return t[v];
        int tm = (tl + tr) / 2;
        T resL = find(v*2, tl, tm, l, min(r, tm));
        T resR = find(v*2+1, tm+1, tr, max(l, tm+1), r);
        T res = merge(resL, resR);
        return res;
    }
    void update(int v, int tl, int tr, int i, T x) {
        if (tl == tr) {
            t[v] = x;
            return;
        }
        int tm = (tl + tr) / 2;
        if (i <= tm) update(v*2, tl, tm, i, x);
        else update(v*2+1, tm+1, tr, i, x);
        t[v] = merge(t[v*2], t[v*2+1]);
    }
    T get(int l, int r) {
        return find(1, 0, n-1, l, r);
    }
    void upd(int i, T x) {
        update(1, 0, n-1, i, x);
    }
};

