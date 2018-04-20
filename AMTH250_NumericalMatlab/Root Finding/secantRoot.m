% Gilat book, page 91 in pdf

% Secant Method for finding roots

% Requirements: 

% FORMULA: 
% x(i+1) = x(i) - f(x(i)) /  (f(x(i-1) - f(x(i)) / (x(i-1) - x(i)))


% f = function
% a, b = two points inside which the root lies. (any interval of the root)
% p = num correct decimals (num 0s in front)
% xSol = solution
function xSol = secantRoot(f, a, b, p)
    %fprintf('\niteration     xi (next, or final sol)       xb (estimate)                itol               tol\n');
    
    nMax = 50;
    xSol = 'No Answer'; 
    
    x(1) = a;
    x(2) = b; 
    
    for n = 2: nMax
        
        x(n+1) = x(n) - f(x(n)) / ( (f(x(n)) - f(x(n-1))) / (x(n) - x(n-1)) );
        
        if abs(x(n+1) - x(n)) < 0.5*10^(-p)
            xSol = x(n+1); % if we are below tolerance, then we are DONE!
            break
        end
    end
    
    fprintf('n = %d, solution = %.*f\n', n-1, (p+1), x(n+1))
    
end


%%% STOP:
% *when exact solutoin f(x) = 0 is found
% * or by error bounding: 
% (1) estimated relative error is smaller than tolerance.  epsilon
% **** estimated relative error: |(xi+1 - xi) / xi| <= epsilon(error)
% (2) when tolerance in f(x):   |f(xi)| <= delta


% NOTE: secant method seems to be slower than newton's method since the
% derivative approximation (secant) is less accurate, probably that's why. 