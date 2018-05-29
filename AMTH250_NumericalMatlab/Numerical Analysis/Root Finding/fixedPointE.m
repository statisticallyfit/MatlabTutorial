function [xSol, x] = fixedPointE(g, x0)

    xSol = 'No Answer';
    nMax = 300;
    %nMax = ceil(log( (abs(b - a)/b) * 2^52) / log(2));
    
    x(1) = x0; % initial vector
    
    for n = 1:nMax
    
        x(n+1) = g(x(n)); % at end: 51 elements in x if goes until nmax
    
        if abs(x(n+1) - x(n)) <= eps * abs(x(n)) % relative error with eps comparison
            xSol = x(n+1);
            break
        end
    end
    
    fprintf('n = %d, nMax = %d, solution = %.15f\n', n, nMax, x(n+1))
    
    
    % Plotting Convergence
    plotConvergence(x);
    plotCobweb(g, x); 
    
end