
% Assuming length(xs) == length(ys)
function dydx_f = forwardDeriv(x, y)
    n = length(y);% assume x len = y len
    h = x(2) - x(1);% assume even spaces everywhere
    
    dydx_f = NaN(1, n);
    dydx_f(1:n-1) = (y(2:n) - y(1:n-1) ) ./ h;
end

