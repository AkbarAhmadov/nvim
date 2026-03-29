struct line{
    int k, b;
    int f(int x) {
        return k * x + b;
    }
    double col(line a) {
        double r1 = a.k - k;
        double r2 = b - a.b;
        return r2 / r1;
    }
};

