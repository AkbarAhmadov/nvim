struct BIT{
    int n;
    vector <int> t;
    void init(int n1) {
        n = n1;
        t.assign(4*(n+2), 0);   // TODO
    }
    int merge(int a, int b) {
        int c;
        c = a + b;              // TODO
        return c;
    }
    int get(int r) {
        if (r <= 0 || r > n) {
            cerr << "\nERROR: BIT->get(" << r << ");\n";
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
        }
        while (i <= n) {
            t[i] = merge(t[i], x);
            i += (i & (-i));
        }
    }
    int get(int l, int r) {
        if (l <= 0 || l > n || r <= 0 || r > n) {
            cerr << "\nERROR: BIT->get(" << l << ", " << r << ");\n";
        }
        if (l == 1) return get(r);
        return get(r) - get(l-1);           // TODO
    }
};

