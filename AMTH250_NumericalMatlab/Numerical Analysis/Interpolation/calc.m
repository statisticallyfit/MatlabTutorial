% poly = interpolated symbolic polynomial
% xInterps = row vec of values to substitute into poly
function [yInterps] = calc(poly, xInterps)
    syms x; 
    yInterps = subs(poly, x, xInterps);
end