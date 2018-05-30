function dydx_b = backwardDeriv(x, y)

    n = length(y);% assume x len = y len
    h = x(2) - x(1);% assume even spaces everywhere
    
    dydx_b = NaN(1, n);
    dydx_b(2:n) = (y(2:n) - y(1:n-1)) ./ h;
end