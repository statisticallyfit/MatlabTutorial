% FIXED POINT METHOD (gilat page 92)

% FORMULA: x(i+1) = g(x(i)), where
% g(x) = the iteration function we must choose, like x + f(x)
% f(x) = true function we are finding the root of. 

% Fixed point can diverge even if initial start point is close to real
% solution. 


% THEOREM: the fixed point method converges if in the neighborhood of the
% fixed point, the derivative of g(x) has an absolute value that is smaller
% than 1 (called Lipschitz continuous if this is true): 
% |g ' (x) | < 1

% HOW TO USE: given the interval x belongs to [a, b] if the |g'(a)| < 1 and
% |g'(b)| < 1 then use the g(x) function (consider different rearragments
% of the f(x) function to get g(x)). 



% g = iteration function (must be Lipshutz continuous if the fixed
% point method is to converge). 
% x0 = value close to real root ,given by the user. 
% pCorrect = number of decimals (p) that solution should have correct. 
% xSol = final solution
% p = number of decimals correct, equivalent to log formula except here
% we have interval only at each step so we must calc numerically. 
function [xSol, x] = fixedPointRoot(g, x0, p)

    % calculated number of iterations
    nMax = round(log(2 * 10^p) / log(2));
    
    x = zeros(1, nMax + 1); 
    
    x(1) = x0; % initial vector
    
    for n = 1:nMax
    
        x(n+1) = g(x(n)); 
        
        if abs(x(n+1) - x(n)) < 0.5 * 10^(-p)
            break
        end
    end
    
    xSol = x(n+1);
    fprintf('n = %d, nMax = %d, solution = %.30f\n', n, nMax, xSol)
    
    
    % Plotting Convergence
    plotConvergence(x, nMax)
    plotCobweb(g, x)
    
end