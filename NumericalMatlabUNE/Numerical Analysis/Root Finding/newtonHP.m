% See practical 7 for derivation of h(x)
% h(x) = f / f' and using this method in place of original 
% xn+1 = xn - f(xn) / f'(xn) when f'(root) = 0

% NEW
% xn+1 = xn - f(xn) f'(xn) / (f'(xn)^2 - f(xn)*f''(xn))


% df = f'(x)
% ddf = f''(x)
% f = f(x)
function [xSol, x] = newtonHP(f, df, ddf, x0, p)

    xSol = 'No Answer'; % initialize
    
    x(1) = x0; 
    nMax = 100;
     
    for n = 1: nMax
        x(n+1) = x(n) - ( f(x(n)) * df(x(n)) ) / ( (df(x(n)))^2 - f(x(n)) * ddf(x(n)) );
        
        %NOTE: that 5e-7 is the same as 0.5e-6 (to 6 decimals)
        % so 0.5*10(-p) = 5*10(-p-1)
        if abs(x(n+1) - x(n)) < 0.5*10^(-p)
            xSol = x(n+1); % if we are below tolerance, then we are DONE!
            break
        end
    end
    
    fprintf('n = %d, nMax = %d, solution = %.*f\n', n, nMax, (p), x(n+1))
    
    % Plotting Convergence
    plotConvergence(x);
    %if isConverged
    %    plotRoot(f, min(x), max(x))
    %end
    
end