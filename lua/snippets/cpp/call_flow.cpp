struct edge{
    int a, b, cap;
    edge(int a, int b, int c) : a(a), b(b), cap(c) {}
};

vector <int> g[MAX+2], lev(MAX+2, -1), ptr(MAX+2, 0);
vector <edge> e;

void add(int a, int b, int c) {
    g[a].pb(e.size());
    e.pb({a, b, c});
    g[b].pb(e.size());
    e.pb({b, a, 0});
}

bool bfs(int s, int t) {
    queue <int> q;
    q.push(s);
    lev[s] = 0;
    while (!q.empty()) {
        int u = q.front();
        q.pop();
        for (int &i : g[u]) {
            if (e[i].cap == 0) continue;
            if (lev[e[i].b] != -1) continue;
            lev[e[i].b] = lev[u] + 1;
            q.push(e[i].b);
        }
    }
    return (lev[t] != -1);
}

int dfs(int u, int t, int ans = INF) {
    if (!ans) return 0;
    if (u == t) return ans;
    for (int &i = ptr[u]; i < g[u].size(); i++) {
        int id = g[u][i];
        int to = e[id].b;
        if (lev[to] != lev[u] + 1) continue;
        int k = dfs(to, t, min(ans, e[id].cap));
        if (!k) continue;
        e[id].cap -= k;
        e[id^1].cap += k;
        return k;
    }
    return 0;
}

int flow(int n, int s, int t) {
    int res = 0;
    while (1) {
        for (int i = 1; i <= n; i++) lev[i] = -1, ptr[i] = 0;
        if (!bfs(s, t)) break;
        while (int k = dfs(s, t, INF)) res += k;
    }
    return res;
}
