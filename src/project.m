function project()

% you can experiment with the following
% theta and N
% tolerance
% s range
% q_k
% distortion matrix
% p_j

% tolerance is convergance tolerance for each point
tolerance = 0.001;
        
% each element of S is a slope of the curve at the point computed
S = -20:0.1:0;

for theta = 0.1:0.1:0.5
    % pre-allocate the space for 5 curves
    D = zeros(5, length(S));
    R_D = zeros(5, length(S));
    
    for N = 10:10:50
        % print the parameters so we know it's still running
        theta
        N

        % set input probabilities
        p_j = binary_source(theta, N);

        % define distortion matrix
        d_jk = ones(N+1) - eye(N+1);
        
        % define initial output probabilities
        q_k = ones(1, N+1) ./ (N+1);

        % get R(D) curve for this theta and N
        [D(N/10, :), R_D(N/10, :)] = rd(p_j, d_jk, q_k, N+1, N+1, S, tolerance);
    end % N loop
    
    % save numerically computed functions for later
    save(strcat('vars_', num2str(theta), '.mat'), 'D', 'R_D');
end % theta loop

end
