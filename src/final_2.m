function [D R] = final_2(p)

% X ~ Bernoulli(p)
d = 0:0.001:1;

r = (-p * log2(p) - (1-p) * log2(1-p)) .* (1 - d);

% plot the theoretical curve
plot(d, r, 'p', 'lineWidth',3);

% tolerance is convergance tolerance for each point
tolerance = 0.0001;
        
% each element of S is a slope of the curve at the point computed
S = -20:0.5:0;

% get the curve from blahut's algorithm
[D, R] = rd([1-p p], [0 99999 1; 99999 0 1], ones(1,3)./3, 2, 3, S, tolerance);

% plot numerically generated curve over the theoretical curve
hold on;
plot(D, R, 'r', 'lineWidth',3);

end