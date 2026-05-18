vector <pair<int, int>> merge_rn(vector <pair<int, int>> v) {
    vector <pair<int, int>> res;
    sort(all(v));
    for (auto &[l, r] : v) {
        if (!res.empty() && l <= res.back().ss) {
            res.back().ss = max(res.back().ss, r);
        }
        else {
            res.pb({l, r});
        }
    }
    return res;
}
