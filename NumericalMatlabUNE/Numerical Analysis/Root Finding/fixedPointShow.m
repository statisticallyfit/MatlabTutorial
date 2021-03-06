function fixedPointShow(g, x0, p)
    
    x(1) = x0; % initial vector
    xSol = 'No Answer';
    
    nMax = 100;
    
    fprintf('%s %17s\n', 'n', 'x(n)')
    fprintf('%d %20.15f\n', 0, x(1))
    
    for n = 1:nMax
        x(n+1) = g(x(n)); % at end: 51 elements in x if goes until nmax
    
        fprintf('%d %20.15f\n', n, x(n+1))
        
        if abs(x(n+1) - x(n)) <= 0.5*10^(-p)
            xSol = x(n+1);
            break
        end
    end
    
    fprintf('n = %d, nMax = %d, x(n+1) = %.*f\n', n, nMax, p, x(n+1)) 
    disp(['Solution = ', num2str(xSol)])

end