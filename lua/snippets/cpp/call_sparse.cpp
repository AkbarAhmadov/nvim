struct Sparse{
    int n, LG;
    vector <int> lg;
    vector <vector <int>> st;
    void init(int n1) {
        n = n1;
        LG = ceil(log2(1. * n));
        st.assign(LG+1, vector <int>(n));
        lg.assign(n+1, -1);
        for (int i = 1; i <= n; i++) lg[i] = lg[i/2] + 1;
    }
    int merge(int a, int b) {
        return max(a, b);               // TODO
    }
    void build(vector <int> &v) {
        st[0] = v;
        for (int i = 1; i <= LG; i++) {
            for (int j = 0; j + (1 << i) - 1 < n; j++) {
                st[i][j] = merge(st[i-1][j], st[i-1][j + (1 << (i - 1))]);
            }
        }
    }
    int get(int l, int r) {
        int g = lg[r - l + 1];
        return merge(st[g][l], st[g][r - (1 << g) + 1]);
    }
};
