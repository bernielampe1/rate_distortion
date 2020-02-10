function [D R] = final_3()

% tolerance is convergance tolerance for each point
tolerance = 0.0001;
        
% each element of S is a slope of the curve at the point computed
S = -20:0.5:0;

% get the curve from blahut's algorithm
[D, R] = rd([1/3 1/3 1/3], [0 0 1; 1 1 0; 1 1 1], ones(1,3)./3, 3, 3, S, tolerance);

% plot numerically generated curve over the theoretical curve
hold on;
plot(D, R, 'r', 'lineWidth',3);

end