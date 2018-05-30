% Secant Algorithm for finding root

% f = function handle for which to estimate root.
% a, b = lower and upper bound
% p = the number of correct decimal places in final estimated root. 
function xSol = secant(f, a, b, p)

    nMax = 100;
    xSol = 'No Answer'; 
    
    % Preparing the vector to hold values to calculate the relative error
    % at the end. 
    x(1) = min([a, b]);
    x(2) = max([a, b]); 
    
    
    % n =  number of iterations needed to reach solution to within p
    % decimals. 
    for n = 2: nMax
        
        x(n+1) = x(n) - f(x(n)) / ( (f(x(n)) - f(x(n-1))) / (x(n) - x(n-1)) );
        
        if abs(x(n+1) - x(n)) <= abs(x(n)) * 10^(-p)
            xSol = x(n+1); % if we are below tolerance, then we are DONE
            break
        end
    end
    
    % n = number of iterations needed to reach the xSol. 
    relativeError = abs(x(n+1) - x(n)) / abs(x(n));
    
    % NOTE: showing relative error to p+5 decimals because relative error
    % is supposed to be smaller than p decimals, so allowing room to show
    % some digits that come after the stopping point p. 
    fprintf('n = %d, nMax = %d, solution = %.*f, relativeError = %.*f\n', n, nMax, (p), xSol, (p+5), relativeError)
    
end