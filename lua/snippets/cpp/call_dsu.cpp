struct DSU{
    int n, c;
    vector <int> p;
    void init(int n1) {
        n = n1;
        c = n;
        p.assign(n+1, -1);
    }
    int get(int u) {
        if (p[u] < 0) return u;
        return p[u] = get(p[u]);
    }
    bool un(int a, int b) {
        a = get(a);
        b = get(b);
        if (a == b) return 0;
        if (p[a] > p[b]) swap(a, b);
        p[a] += p[b];
        p[b] = a;
        --c;
        return 1;
    }
};
