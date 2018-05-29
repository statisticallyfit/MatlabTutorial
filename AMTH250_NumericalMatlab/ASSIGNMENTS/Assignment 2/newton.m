% Newton's Method (Newton Raphson) for finding roots

% Requirements: 
% (1) f(x) is continuous and differentiable (once)
% (2) f(x) has a solution near a given point. 

% FORMULA: 
% x(i+1) = x(i) - f(x(i)) / f ' (x(i))

% f = function handle. 
% fDeriv = derivative function handle (of f)
% x0 = initial estimate of solution
% nMax = max iterations (fixed)
% p = number of decimals to which xSol should be correct, based on relative
% error. 
% xSol = solution correct to p decimals. 
function xSol = newton(f, fDeriv, x0, p)

    xSol = 'No Answer'; % initialize
    
    x(1) = x0; 
    nMax = 100;
     
    for n = 1: nMax
        x(n+1) = x(n) - f(x(n)) / fDeriv(x(n));
        
        if abs(x(n+1) - x(n)) <= abs(x(n)) * 10^(-p)
            xSol = x(n+1); % if we are below tolerance, then we are DONE!
            break
        end
    end
    
    % n = number of iterations needed to reach the xSol. 
    relativeError = abs(x(n+1) - x(n)) / abs(x(n)); % note: value n remains after for loop.
    % NOTE: showing relative error to p+5 decimals because relative error
    % is supposed to be smaller than p decimals, so allowing room to show
    % some digits that come after the stopping point p. 
    fprintf('n = %d, nMax = %d, solution = %.*f, relativeError = %.*f\n', n, nMax, (p), xSol, (p+5), relativeError)
   
end