struct ImpTree{
    int TL, TR, nxt = 0, null = INF;
    vector <int> t, L, R, lazy;
    void init(int l = 0, int r = INF) {
        TL = l; TR = r;
        t.assign(MAX+2, null);
        L.assign(MAX+2, -1);
        R.assign(MAX+2, -1);
        lazy.assign(MAX+2, -1);
    }
    int merge(int a, int b) {
        return min(a, b);
    }
    void fix(int x) {
        if (L[x] == -1) {
            L[x] = ++nxt;
            t[L[x]] = null;
        }
        if (R[x] == -1) {
            R[x] = ++nxt;
            t[R[x]] = null;
        }
    }
    void push(int v) {
        if (lazy[v] == -1) return;
        fix(v);
        t[L[v]] = t[R[v]] = lazy[v];
        lazy[L[v]] = lazy[R[v]] = lazy[v];
        lazy[v] = -1;
    }
    int find(int v, int tl, int tr, int l, int r) {
        if (l > r) return null;
        if (tl == l && tr == r) return t[v];
        push(v);
        int tm = (tl + tr) / 2;
        int resL = null, resR = null;
        if (L[v] != -1) resL = find(L[v], tl, tm, l, min(r, tm));
        if (R[v] != -1) resR = find(R[v], tm+1, tr, max(l, tm+1), r);
        return merge(resL, resR);
    }
    void update(int v, int tl, int tr, int l, int r, int x) {
        if (l > r) return;
        if (tl == l && tr == r) {
            t[v] = x;
            lazy[v] = x;
            return;
        }
        push(v);
        int tm = (tl + tr) / 2;
        fix(v);
        update(L[v], tl, tm, l, min(r, tm), x);
        update(R[v], tm+1, tr, max(l, tm+1), r, x);
        t[v] = merge(t[L[v]], t[R[v]]);
    }
    int get(int l, int r) {
        return find(1, TL, TR, l, r);
    }
    void upd(int l, int r, int x) {
        update(1, TL, TR, l, r, x);
    }
};
