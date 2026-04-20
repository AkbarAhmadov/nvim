struct BIT{
    int n;
    vector <int> t;
    void init(int n1) {
        n = n1;
        t.assign(n+2, 0);
    }
    int get(int r) {
        int res=0;
        while (r > 0) {
            res += t[r];
            r -= (r & (-r));
        }
        return res;
    }
    void upd(int i, int x) {
        while (i <= n) {
            t[i] += x;
            i += (i & (-i));
        }
    }
    int get(int l, int r) {
        if (l == 1) return get(r);
        return get(r) - get(l-1);
    }
};
