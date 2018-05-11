%%% Source of this algorithm comes from Timothy Sauer book, section 3.4 on cubic splines. 

%ai, bi, ci, di = each is a vector of length n - 1 and contain
% the cubic spline coefficients
% splinePolys = the n-1 cubic spline polynomials. 
% xdata, ydata = the input data, where n = length(xdata) = length(ydata)

% NOTE: need n >= 4 otherwise we get rank-deficient b coefs

function splinePolys = notKnotCubicSpline(xData, yData)
    n = length(xData); % should equal length ydata
    xData = sym(xData);
    yData = sym(yData);
    
    % making all calculations symbolic. 
    a = sym(zeros(1, n-1));
    b = sym(zeros(1, n));
    c = sym(zeros(1, n-1));
    d = sym(zeros(1, n));
    
    % setting up the intermediate coefs
    dx(1: n-1) = xData(2:n) - xData(1:n-1);
    dy(1:n-1) = yData(2:n) - yData(1:n-1);
    
    % solve for di's
    d(1:n) = yData(1:n);
    
    % solve the matrix for the bi's
    deltaMat = sym(zeros(n, n));
    coefs = sym(zeros(n, 1));
    
    % not-a-knot spline conditions (note: need n >= 4)
    deltaMat(1, 1:3) = [dx(2),   -(dx(1) + dx(2)),   dx(1)];
    deltaMat(n, n-2:n) = [dx(n-1),   -(dx(n-2) + dx(n-1)),  dx(n-2)];
    
    for i = 2:n-1
        deltaMat(i, i-1:i+1) = [dx(i-1), 2*(dx(i-1) + dx(i)),   dx(i)];
        coefs(i) = 3 * (dy(i) ./ dx(i) - dy(i-1) ./ dx(i-1) );
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
    
    % generate the n-1 order polynomial variables
    xs = sym(zeros(n, 1));
    syms x;
    
    p = 3:-1:0; % the poly powers
    xi = xData(1:n-1);
    Si = transpose(transpose(x - xi) .^ p); % the ith spline without coefficients
    
    % done: each spline is on intervals [x1, x2], [x2, x3], ...[x_n-1, xn]
    cof = transpose([a; b ; c; d]);
    splinePolys = diag(cof * Si); 
    
end