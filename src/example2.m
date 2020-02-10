function example2()

% domain
x = 1:0.001:4/3;

% theoretical curve R(D) = 2/3 * (log_2(2) - H(3/2(D-1)));
alpha = 3/2 * (x-1);
y = 2/3 * (log2(2) + alpha.*log2(alpha) + (1-alpha).*log2(1-alpha));

% plot the theoretical curve
plot(x, y, 'p', 'linewidth',3);

% tolerance is convergance tolerance for each point
tolerance = 0.0001;
        
% each element of S is a slope of the curve at the point computed
S = -20:0.5:0;
    
% get the curve from blahut's algorithm
[D, R] = rd([1/3 1/3 1/3], [1 2; 1 1; 2 1], ones(1, 2) ./ 2, 3, 2, S, tolerance);

% plot numerically generated curve over the theoretical curve
hold on;
plot(D, R, 'r', 'linewidth',3);

end