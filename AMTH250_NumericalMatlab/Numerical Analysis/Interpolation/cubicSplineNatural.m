%%% Source of this algorithm comes from Timothy Sauer book, section 3.4 on cubic splines. 

%ai, bi, ci, di = each is a vector of length n - 1 and contain
% the cubic spline coefficients
% splinePolys = the n-1 cubic spline polynomials. 
% xdata, ydata = the input data, where n = length(xdata) = length(ydata)
function splinePolys = cubicSplineNatural(xData, yData)
    n = length(xData); % should equal length ydata
    
    % making all calculations symbolic. 
    a = sym(zeros(1, n-1));
    b = sym(zeros(1, n));
    c = sym(zeros(1, n-1));
    d = sym(zeros(1, n));
    
    % setting up the intermediate coefs
    dx(1: n-1) = sym(xData(2:n) - xData(1:n-1));
    dy(1:n-1) = sym( yData(2:n) - yData(1:n-1) );
    
    % solve for di's
    d(1:n) = sym(yData(1:n));
    
    % solve the matrix for the bi's
    deltaMat = sym(zeros(n, n));
    deltaMat(1, 1) = 1;
    deltaMat(n, n) = 1;
    coefs = sym(zeros(n, 1));
    
    for p = 1:length(dx)-1
        deltaMat(p+1, p:p+2) = [dx(p), 2*(dx(p) + dx(p+1)), dx(p+1)];
        coefs(p+1) = 3 * (dy(p+1) ./ dx(p+1) - dy(p) ./ dx(p) );
    end
    
    % get the bi coefficients. 
    b(1:n) = linsolve(deltaMat, coefs);
    
    % solve for ai's
    a(1:n-1) = (b(2:n) - b(1:n-1)) ./ (3* dx(1:n-1));
    
    % solve for ci's
    c(1:n-1) = dy(1:n-1) ./ dx(1:n-1) - (dx(1:n-1) / 3) .* (2*b(1:n-1) + b(2:n));
    
    % shorten the coefs to have only relevant information for the spline
    % equations. 
    b = b(1:end-1);
    d = d(1:end-1);
    
    % the natural cubic spline is
    % Si(x) = di + ci(x - xi) + bi(x - xi)^2 + ai(x - xi)^3 on [xi, x_i+1]
    % for i = 1... n-1
    
    % Make the symbolic list of polynomials. 
    splinePolys = sym(zeros(1, n-1)); % there are n-1 splines for the n data points
    
    % generate the n-1 order polynomial variables
    xs = sym(zeros(n, 1));
    syms x;
    
    p = n:-1:0; % the poly powers
    xi = sym(xData(1:n-1));
    Si = transpose(x - xi) .^ p; % the ith spline without coefficients
    
    % done: each spline is on intervals [x1, x2], [x2, x3], ...[x_n-1, xn]
    splinePolys = transpose(sum(transpose([a; b; c; d]' .* Si))); % last transpose is for prettiness.
    
end