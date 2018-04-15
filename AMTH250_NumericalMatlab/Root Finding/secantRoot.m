% Gilat book, page 91 in pdf

% Secant Method for finding roots

% Requirements: 

% FORMULA: 
% x(i+1) = x(i) - f(x(i)) /  (f(x(i-1) - f(x(i)) / (x(i-1) - x(i)))


% f = function
% a, b = two points inside which the root lies. (any interval of the root)
% tol = tolerance
% maxIterations
% xSol = solution
function xSol = secantRoot(f, a, b, tol, maxIterations)
    fprintf('\niteration     xi (next, or final sol)       xb (estimate)                itol               tol\n');
    
    for i = 1: maxIterations
        fb = f(b);
        
        xi = b - fb * (a - b) / (f(a) - fb);
        
        iTol = abs((xi - b)/b); % calculating relative error at xi
        
        fprintf('%3i      %25.16f       %10.16f      %11.16f  %11.16f\n', i, xi, b, iTol, tol);
        
        if iTol < tol
            xSol = xi; % if we are below tolerance, then we are DONE!
            break
        end
        
        % else we continue 
        a = b;
        b = xi; 
    end
    
    if i == maxIterations
        fprintf('Solution not obtained in %i iterations.\n', maxIterations)
        xSol = ('No Answer');
    end
    
end


%%% STOP:
% *when exact solutoin f(x) = 0 is found
% * or by error bounding: 
% (1) estimated relative error is smaller than tolerance.  epsilon
% **** estimated relative error: |(xi+1 - xi) / xi| <= epsilon(error)
% (2) when tolerance in f(x):   |f(xi)| <= delta


% NOTE: secant method seems to be slower than newton's method since the
% derivative approximation (secant) is less accurate, probably that's why. 