function xSol = bisectEpsRoot (f, a, b) % bisection to eps precision

    xL = a; 
    xR = b; 
    
    % Calculating num steps required to find solution with
    % RELATIVE ERROR less than e_machine = 2^-52 given interval. 
    nMax = ceil(log( (abs(b - a)/b) * 2^52) / log(2));
    
    % starting
    xSol = 'No Answer'; 
    fa = f(a);
    estimatedRoots = zeros(1, nMax);
    xNew = 0;
    
    for n = 1: nMax
        xNew = (a + b)/2; 
        fNew = f(xNew);
        
        estimatedRoots(n) = xNew; 
        
        if fa*fNew > 0
            a = xNew; % new interval is [estimate, b]
            fa = fNew;
        else
            b = xNew; % new interval [a, estimate]
        end
        
        % no real need since already have nmax prepared
        if abs(b - a) <= eps*abs(b) % relative error
            xSol = xNew;
            break;
        end
        
    end
        
    fprintf('n = %d, nMax = %d, solution = %.15f\n', n, nMax, xNew)
    
    
    % Plotting
    plotRoot(f, xL, xR);
    plotConvergence([estimatedRoots, xNew]);
    
end