int compress(vector <int> &v, int s = 1) {
    if (v.empty()) {
        return 0;
    }
    vector <int> v1 = v;
    sort(all(v1));
    v1.erase(unique(all(v1)), v1.end());
    int mx = s;
    for (int &i : v) {
        int k = lower_bound(all(v1), i) - v1.begin() + s;
        i = k;
        mx = max(mx, k);
    }
    return mx;
}
