
function splines = linearSpline(xs, ys)

    syms x; 
    n = length(xs);
    xs = sym(xs);
    ys = sym(ys);
    
    % calculate the slopes
    m(1: n-1) = (ys(2:n) - ys(1:n-1)) ./ (xs(2:n) - xs(1:n-1));
    
    % calculate the b coefficients
    b(1: n-1) = ( ys(1:n-1) .* xs(2:n) - ys(2:n) .* xs(1:n-1) ) ./ (xs(2:n) - xs(1:n-1));
    
    % make the symbolic polynomials
    Si = [x; 1];
    cof = transpose([m; b]);
    splines = cof * Si;
    
    % done: each spline is on intervals [x1, x2], [x2, x3], ...[x_n-1, xn]
    
end