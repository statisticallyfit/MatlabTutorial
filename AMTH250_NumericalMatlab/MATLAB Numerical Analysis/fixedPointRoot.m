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
% a, b = interval around the real root
% tol = max error
% maxIterations = max number of iterations before a solution is found. 
% xSol = final solution
function xSol = fixedPointRoot(g, x0, tol, maxIterations)

    x = zeros(maxIterations + 1, 1); 
    
    x(1) = x0; % initial vector
    
    for i = 1:maxIterations
    
        x(i+1) = g(x(i)); 
       
    end
    
    if i == maxIterations
        fprintf('Solution not obtained in %i iterations.\n', maxIterations)
        xSol = ('No Answer');
    else
        xSol = x(i+1);
    end
    
end