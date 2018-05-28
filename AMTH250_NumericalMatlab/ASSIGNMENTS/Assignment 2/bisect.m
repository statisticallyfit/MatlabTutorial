% p = power for a relative error (p > 0) so if we want to calculate
% the number of steps for relative error of 10^-12, give p = 12. 
% f = function handle to estimate the root of.
% a, b = interval, with a <= b. 
function [xSol, allXs] = bisect(f, a, b, p)

    xL = min([a, b]); 
    xR = max([a, b]); 
    
    % Set a fixed num steps
    nMax = 100;
    disp(ceil( log(abs(b-a)*10^p/abs(a)) / log(2) ))
    
    % starting
    xSol = 'No Answer'; 
    fa = f(a);
    xNew = 0;
    x = zeros(1, nMax);
    
    for n = 1: nMax
        xNew = (a + b)/2; 
        x(n) = xNew;
        fNew = f(xNew);
        
        if fa*fNew > 0
            a = xNew; % new interval is [estimate, b]
            fa = fNew;
        else
            b = xNew; % new interval [a, estimate]
        end
        
        % TODO: compare if really need the x-list
        fprintf('a = %.5f, x(n-1) = %.5f, b = %.5f, x(n) = %.5f\n', a, x(n-1), b, x(n))
        
        if abs(x(n) - x(n-1)) <= abs(x(n-1) * 10^(-p))
            xSol = xNew;
            break;
        end
        
    end
        
    fprintf('n = %d, nMax = %d, solution = %.*f\n', n, nMax, (p), xNew)
    
end