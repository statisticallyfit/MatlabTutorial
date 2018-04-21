function dydx_c2 = centralSecondDeriv(x, y)

    n = length(y); % assume x len = y len
    h = x(2) - x(1); % assume even spaces everywhere
    
    dydx_c2 = NaN(1, n);
    dydx_c2(2:n-1) = (y(3:n) - 2*y(2:n-1) + y(1:n-2)) ./ (h^2);
end