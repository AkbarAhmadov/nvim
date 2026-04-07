struct BIT{
    int n;
    vector <int> t;
    void init(int n1) {
        n = n1;
        t.assign(n+1, 0);   // TODO
    }
    int merge(int a, int b) {
        int c;
        c = a + b;              // TODO
        return c;
    }
    int get(int r) {
        if (r <= 0 || r > n) {
            cerr << "\nERROR: BIT->get(" << r << ");\n";
            exit(0);
        }
        int res = 0;
        while (r > 0) {
            res = merge(res, t[r]);
            r -= (r & (-r));
        }
        return res;
    }
    void upd(int i, int x) {
        if (i <= 0 || i > n) {
            cerr << "\nERROR: BIT->upd(" << i << ", " << x << ");\n";
            exit(0);
        }
        while (i <= n) {
            t[i] = merge(t[i], x);
            i += (i & (-i));
        }
    }
    int get(int l, int r) {
        if (l <= 0 || l > n || r <= 0 || r > n) {
            cerr << "\nERROR: BIT->get(" << l << ", " << r << ");\n";
            exit(0);
        }
        if (l > r) {
            cerr << "\nWARNING: BIT->get(" << l << ", " << r << ");\n";
            return 0;
        }
        if (l == 1) return get(r);
        int L = get(l-1), R = get(r);
        return R - L;           // TODO
    }
};

