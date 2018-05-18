% Calculates the least squares fit to a nonlinear equation, given the
% function handles as one vector. 
% fs = the cell array of function handles NOTE: if the function f = @(x) 1 is
% passed, then we fit the ols model with an intercept, but if not const
% function  = 1 is passed, then the ols model has no intercept. 

% NOTE can also use this algorithm for polynomial least squares, instead of
% the derivative approach.So to test: 
% nonlinear(xs, ys, {1, x, x^2}) == polyols(xs, ys, 2)
function olsNonlinear = nonlinearLeastSquares(xData, yData, functions)
    
    if length(xData) ~= length(yData)
        error('Length of data must be equal')
    end % then exit the method
    
    n = length(xData);
    nf = length(functions);
    xData = sym(reshape(xData, [1, n]));
    yData = sym(reshape(yData, [1, n]));
    functions = sym(functions); % now just is a simple sym vector of functions
    
    % make the matrix A by running xData through the functions, and
    % concatenating the columns. 
    syms x; 
    A = sym(zeros(n, nf));
    for i = 1: nf
        A(:, i) = subs(functions(i), x, xData); % assign the data as column.
    end
    
    % Solve the normal equations: AT * A * x = AT * b, where b = ydata
    coefficients = linsolve(transpose(A) * A, transpose(A) * transpose(yData));
    
    % Make the final formula
    olsNonlinear = functions * coefficients;
end