% poly = interpolated symbolic polynomial
% xInterps = row vec of values to substitute into poly
function [yInterps] = estimateInterp(poly, xInterps)
    syms x; 
    yInterps = vpa(subs(poly, x, xInterps), 10);
end