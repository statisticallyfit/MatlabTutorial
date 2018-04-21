
% Gilat book, page 84 in pdf

% Newton's Method (Newton Raphson) for finding roots

% Requirements: 
% (1) f(x) is continuous and differentiable (once)
% (2) f(x) has a solution near a given point. 

% FORMULA: 
% x(i+1) = x(i) - f(x(i)) / f ' (x(i))


% f = function
% fDeriv = derivative function (of f)
% xInitial = initial estimate of solution
% nMax = max iterations
% p = num correct decimals
% xSol = solution
function xSol = newtonP(f, fDeriv, x0, p)

    xSol = 'No Answer'; % initialize
    
    x(1) = x0; 
    
    %nMax = ceil(log(abs(b - a) * 2 * 10^p) / log(2));
    nMax = 100;
    isConverged = false;
     
    for n = 1: nMax
        x(n+1) = x(n) - f(x(n)) / fDeriv(x(n));
        
        %NOTE: that 5e-7 is the same as 0.5e-6 (to 6 decimals)
        % so 0.5*10(-p) = 5*10(-p-1)
        if abs(x(n+1) - x(n)) < 0.5*10^(-p)
            xSol = x(n+1); % if we are below tolerance, then we are DONE!
            isConverged = true;
            break
        end
    end
    
    fprintf('n = %d, nMax = %d, solution = %.*f\n', n, nMax, (p+1), x(n+1))
    
    % Plotting Convergence
    plotConvergence(x);
    
    %if isConverged
        %d = abs(xSol - x0);
        %isSmall = ceil(d) == 0 || ceil(d) == 1 || ceil(d) == 2;
        
        %if isSmall
        %    low = min([x0, xSol]) - 5*d;
        %    upp = max([x0, xSol]) + 5*d;
        %else
        %    low = min([x0, xSol]) - 2*d;
        %    upp = max([x0, xSol]) + 5*d;
        %end
        
        %plotRoot(f, low, upp);
    %end   
    
end


%%% STOP:
% *when exact solutoin f(x) = 0 is found
% * or by error bounding: 
% (1) estimated relative error is smaller than tolerance.  epsilon
% **** estimated relative error: |(xi+1 - xi) / xi| <= epsilon(error)
% (2) when tolerance in f(x):   |f(xi)| <= delta