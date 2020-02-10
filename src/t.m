function I = t()
    Q = [1/2 1/2 0; 0 0 1; 1/4 1/4 1/2];
    p = [1/3 1/3 1/3];
    q = [1/4 1/4 1/2];
    I = 0;
    for j = 1:3
        for k = 1:3
           I = I + p(j) * Q(j, k) * log2(Q(j, k) / q(k) + eps)
           p(j)
           Q(j,k)
           q(k)
        end
    end
end