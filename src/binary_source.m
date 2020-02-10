function p_k = binary_source(theta, N)

p_k = zeros(1, N);
for k = 0:N
    p_k(1, k+1) = nchoosek(N, k) * (theta.^k) * ((1.0-theta).^(N-k));
end

end
