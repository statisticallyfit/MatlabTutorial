function xSol = newtonE(f, fDeriv, x0)

    xSol = 'No Answer'; % initialize
    
    x(1) = x0; 
    isConverged = false;
    nMax = ceil(log( (abs(b - a)/b) * 2^52) / log(2));
     
    for n = 1: nMax
        x(n+1) = x(n) - f(x(n)) / fDeriv(x(n));
        
        %NOTE: that 5e-7 is the same as 0.5e-6 (to 6 decimals)
        % so 0.5*10(-p) = 5*10(-p-1)
        if abs(x(n+1) - x(n)) <= eps * abs(x(n+1))
            xSol = x(n+1); % if we are below tolerance, then we are DONE!
            isConverged = true;
            break
        end
    end
    
    fprintf('n = %d, nMax = %d, solution = %.15f\n', n, nMax, x(n+1))
    
    % Plotting Convergence
    plotConvergence(x);
    
    if isConverged
        d = abs(xSol - x0);
        low = min([x0, xSol]) - d;
        upp = max([x0, xSol]) - d;
        
        plotRoot(f, low, upp);
    end  
    
end