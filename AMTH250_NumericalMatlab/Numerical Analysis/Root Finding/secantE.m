function xSol = secantE(f, a, b)

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
    if all(~isnan(x)) && all(~isinf(x)) 
        plotConvergence(x);
        plotCobweb(g, x);
    end  
end