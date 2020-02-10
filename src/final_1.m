function final_1(p)

% X ~ Bernoulli(p)
n = min(p, 1-p);
x = 0:0.001:n;

% theoretical curve R(D) = H(p) - H(D)
y = - p*log2(p) - (1-p)*log2(1-p) + x.*log2(x) + (1-x).*log2(1-x);

% plot the theoretical curve
plot(x, y, 'p', 'lineWidth',3);

% tolerance is convergance tolerance for each point
tolerance = 0.0001;
        
% each element of S is a slope of the curve at the point computed
S = -20:0.5:0;

% get the curve from blahut's algorithm
[D, R] = rd([p 1-p], [0 1; 1 0], ones(1,2)./2, 2, 2, S, tolerance);

% plot numerically generated curve over the theoretical curve
hold on;
plot(D, R, 'r', 'lineWidth',3);

end