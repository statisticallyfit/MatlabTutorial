function dydx_c = centralDeriv(x, y)

    n = length(y); % assume x len = y len
    h = x(2) - x(1); % assume even spaces everywhere
    
    dydx_c = NaN(1,n);
    dydx_c(2:n-1) = (y(3:n) - y(1:n-2)) ./ (2*h);
end