% Examples: 
% for function xe^(0.5x) + 1.2x - 5 = f(x) use the iteration
% function g(x) = x = 5 / (e^(0.5x) + 1.2) since when given
% the interval a=1, b = 2, the g'(1) and g'(2) have absolute
% value < 1 (lipshutz continuous)

fixedPointRoot(@(x) 5/(exp(0.5*x) + 1.2), 1, 0.0001, 20)

% if we use another g(x) that is not Lipshutz continuous
% then the fixed point method does not converge

fixedPointRoot(@(x) (5 - x*exp(0.5*x)) / 1.2, 1, 0.00001, 30)