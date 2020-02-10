function example3(J)

% domain
x = 0:0.001:1 - 1/J;

% theoretical curve R(D) = log2(J) - D * log2(J-1) - H(D)
y = log2(J) - x*log2(J-1) + x.*log2(x) + (1-x).*log2(1-x);

% plot the theoretical curve
plot(x, y, 'p', 'linewidth',3);

% tolerance is convergance tolerance for each point
tolerance = 0.0001;
        
% each element of S is a slope of the curve at the point computed
S = -20:0.5:0;

% get the curve from blahut's algorithm
[D, R] = rd(ones(1, J) ./ J, ones(J) - eye(J), ones(1, J) ./ J, J, J, S, tolerance);

% plot numerically generated curve over the theoretical curve
hold on;
plot(D, R, 'r', 'linewidth', 3);

end