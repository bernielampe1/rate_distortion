function [D, R] = rd(p_j, d_jk, q_k_init, J, K, S, tolerance)

% initalize return values
D = zeros(1, length(S));
R = zeros(1, length(S));

for i = 1:length(S)
    % set initial output probabilities
    q_k = q_k_init;
    
    % get slope for this D, R(D) point
    s = S(i);
    
    % compute initial matrix
    A_jk = 2.^(s * d_jk);

    % setup convergence loop
    c_k = zeros(1, K);
    run = 1;
    while(run)
        % compute c_k vector
        for k = 1:K
           acc = 0;
           for j = 1:J
               acc = acc + p_j(j) * (A_jk(j,k) / sum(q_k .* A_jk(j,:)));
           end
           c_k(k) = acc;
        end
        
        
        % compute the new q_k
        q_k = q_k .* c_k;
        
        % compute the upper and lower criteria
        l2_c_k = log2(c_k + eps);
        T_u = sum(q_k .* l2_c_k);
        T_l = max(l2_c_k);
        
        if abs(T_u - T_l) < tolerance
            run = 0;
        end
    end % convergence loop for this s

    % compute channel
    Q_kj = zeros(J, K);
    for j = 1:J
        for k = 1:K
            Q_kj(j, k) = (A_jk(j, k) * q_k(k)) / sum(A_jk(j, :) .* q_k);
        end
    end

    % compute distortion scalar
    D(i) = sum(p_j .* sum(Q_kj .* d_jk, 2)');

    % compute information rate of distortion scalar
    R(i) = s * D(i) - sum(p_j .* log2((A_jk * q_k')'+eps)) - sum(q_k .* log2(c_k+eps));
end % s loop

end % end function
