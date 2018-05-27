% p = power for a relative error (p > 0) so if we want to calculate
% the number of steps for relative error of 10^-12, give p = 12. 
% f = function handle to estimate the root of.
% a, b = interval, with a <= b. 
function [xSol, allXs] = bisect(f, a, b, p)

    xL = min([a, b]); 
    xR = max([a, b]); 
    
    % Calculating num steps
    nMax = ceil( log( (abs(b - a)) * 10^p / abs(a) ) / log(2) );
    isConverged = false;
    
    % starting
    xSol = 'No Answer'; 
    fa = f(a);
    allXs = zeros(1, nMax);
    xNew = 0;
    
    for n = 1: nMax
        xNew = (a + b)/2; 
        fNew = f(xNew);
        
        allXs(n) = xNew; 
        
        if fa*fNew > 0
            a = xNew; % new interval is [estimate, b]
            fa = fNew;
        else
            b = xNew; % new interval [a, estimate]
        end
        
        % no real need since already have nmax prepared
        if abs(b - a) <= abs(a * 0.5*10^(-p))
            xSol = xNew;
            isConverged = true;
            break;
        end
        
    end
        
    fprintf('n = %d, nMax = %d, solution = %.*f\n', n, nMax, (p), xNew)
    
    
    % Plotting Convergence
    plotConvergence(allXs);
    if isConverged
        plotRoot(f, xL, xR);
    end  
    
end