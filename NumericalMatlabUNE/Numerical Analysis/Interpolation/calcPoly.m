% poly = interpolated symbolic polynomial
% xs = row vec of values to substitute into poly
function [yy] = calcPoly(poly, xx)
    syms x; 
    yy = subs(poly, x, xx);
end