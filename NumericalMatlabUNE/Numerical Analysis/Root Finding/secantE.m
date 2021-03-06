function [xSol, x] = secantE(f, a, b)

% NOTE: this nmax bound is only working for bisection not for secant method
% but just putting it here for comparison sake. 
    nMax = ceil(log( (abs(b - a)/b) * 2^52) / log(2));
    xSol = 'No Answer'; 
    
    x(1) = a;
    x(2) = b; 
    
    for n = 2: nMax
        
        x(n+1) = x(n) - f(x(n)) / ( (f(x(n)) - f(x(n-1))) / (x(n) - x(n-1)) );
        
        if abs(x(n+1) - x(n)) <= eps * abs(x(n+1))
            xSol = x(n+1); % if we are below tolerance, then we are DONE!
            break
        end
    end
    
    fprintf('n = %d, nMax = %d, solution = %.15f\n', n-1, nMax, x(n+1))
    
    % Plotting Convergence
    plotConvergence(x);
    plotRoot(f, min(x), max(x));
end