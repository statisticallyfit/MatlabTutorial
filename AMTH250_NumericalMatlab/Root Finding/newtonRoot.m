
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
% tol = tolerance
% maxIterations
% xSol = solution
function xSol = newtonRoot(f, fDeriv, xInitial, tol, maxIterations)

    xEst = xInitial; 
    
    fprintf('\niteration     xi (next, or final sol)       x (estimate)                itol               tol\n');
    
    for i = 1: maxIterations
        xi = xEst - f(xEst) / fDeriv(xEst);
        
        iTol = abs((xi - xEst)/xEst); % calculating relative error at xi
        
        fprintf('%3i      %25.16f       %10.16f      %11.16f  %11.16f\n', i, xi, xEst, iTol, tol);
        
        if iTol < tol
            xSol = xi; % if we are below tolerance, then we are DONE!
            break
        end
        % else we continue by setting the xest as previous xi
        xEst = xi;
    end
    
    if i == maxIterations
        fprintf('Solution not obtained in %i iterations.\n', maxIterations)
        xSol = ('No Answer');
    end
    
end


%%% STOP:
% *when exact solutoin f(x) = 0 is found
% * or by error bounding: 
% (1) estimated relative error is smaller than tolerance.  epsilon
% **** estimated relative error: |(xi+1 - xi) / xi| <= epsilon(error)
% (2) when tolerance in f(x):   |f(xi)| <= delta