clear all; 

f = @(x) x.^ 2 - log(x) - 2;

% part a) plotting over [0 ,2]
plotRoot(f, 0, 2); 
% Yes there are 2 roots of f in this interval, as shown
% by the red dots. 


% part c) Bisection ---------------------------------------------------
% determining the solution root to have relative error less than 10^-12 and
% with a starting interval of [1, 2]. 
% Input a = 1, b = 2, p = 12, f = function above. 
fprintf('Bisection Estimates: \n')

bisect(f, 1, 2, 12) ;


% part e) Fixed point ---------------------------------------------------

% using g1
fprintf('\nFixed point estimates with g1(x):\n')

g1 = @(x) sqrt(2 + log(x));
fixedPoint(g1, 1.5, 12);

% using g2
fprintf('\nFixed point estimates with g2(x):\n')

g2 = @(x) (2 + log(x)) ./ x;
fixedPoint(g2, 1.5, 12);



% part g) Newton ---------------------------------------------------
fprintf('\nNewton estimates:\n')

fderiv = @(x) 2*x - log(x);
newton(f, fderiv, 1.5, 12);


% part h) Secant ---------------------------------------------------
fprintf('\nSecant estimates:\n')

secant(f, 1, 2, 12);
