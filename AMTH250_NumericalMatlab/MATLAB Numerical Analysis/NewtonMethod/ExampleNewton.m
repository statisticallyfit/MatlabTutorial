% Examples with Newton's Method

newtonDisplay(@(x) 8 - 4.5*(x - sin(x)), @(x) -4.5*(1-cos(x)), 2, 0.00001, 30)



% Example when newton's method diverges (fails to converge)

% CASE 1: given starting point is far from real zero
newtonDisplay(@(x) 1/x-2, @(x) -1/x^2, 1.4, 0.001, 30)
newtonDisplay(@(x) 1/x-2, @(x) -1/x^2, 0.4, 0.001, 30)

% CASE 2: first or second derivatives have a discontinuity somewhere on
% their domain, or function itself has discontinuity anywhere. 

% CASE 3: first deriv is zero at the solution. 

% but newton's method converges if given initial point is close enough
% to the solution. 
newtonDisplay(@(x) 1/x-2, @(x) -1/x^2, 1.4, 0.00000000001, 30)
newtonDisplay(@(x) 1/x-2, @(x) -1/x^2, 0, 0.00000000001, 30)
newtonDisplay(@(x) 1/x-2, @(x) -1/x^2, 0.4, 0.00000000001, 30)