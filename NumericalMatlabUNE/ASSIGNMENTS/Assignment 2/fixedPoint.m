% This function finds the root for a specified function f(x), given only
% the fixed point function g(x), within p decimal places. 

% g = iteration function (must be Lipshutz continuous if the fixed
% point method is to converge, meaning it must be true that |g'(x0)| < 1). 
% x0 = value close to real root ,given by the user. 
% p = number of decimals (p) that solution should have correct. 
% RETURN: xSol = final solution
function xSol = fixedPoint(g, x0, p)

    xSol = 'No Answer';
    nMax = 100;
    
    x(1) = x0; % initial vector to hold all the previous root estimates. 
    
    
    % n =  number of iterations needed to reach solution to within p
    % decimals. 
    for n = 1:nMax
    
        x(n+1) = g(x(n)); 
    
        if abs(x(n+1) - x(n)) < abs(x(n))* 10^(-p) % TODO: include factor 0.5???
            xSol = x(n+1);
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