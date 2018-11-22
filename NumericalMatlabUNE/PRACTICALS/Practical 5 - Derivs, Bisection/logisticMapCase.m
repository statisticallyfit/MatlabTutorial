function [xSol, x, g] = logisticMapCase(a)
    
    p = 6;
    x0 = 0.75;
    g = @(x) a*x.*(1-x);
    
    x(1) = x0; % initial vector
    
    for i = 1:100
        x(1) = g(x(1)); % just eat the same value over again 100 times
    end
    
    % now starting fixed point
    nMax = 50;
    for n = 1:nMax
    
        x(n+1) = g(x(n)); 
        
        if abs(x(n+1) - x(n)) < 0.5 * 10^(-p)
            break
        end
    end
    
    xSol = x(n+1);
    fprintf('n = %d, solution = %.*f\n', n, (p+1), xSol)
    
    
    % Plotting Convergence
    %plotConvergence(x(1:n+1))
    %plotCobweb(g, x(1:n+1))
    
end