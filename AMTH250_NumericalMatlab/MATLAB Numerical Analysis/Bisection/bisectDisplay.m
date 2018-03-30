
% Gilat book, page 81

% tests: fx = x^3 + x - 1   [0,1]
% fx = 8 - 4.5 * (x - sin(x))   [2,3]

function xSol = bisectDisplay (f, a, b, tol, maxIterations)

    fa = f(a);
    fb = f(b);
    
    if fa*fb > 0
        disp('Error: The function has the same sign at points a and b.');
    else
        disp('iteration   a          b     (est) Solution   f(est)    Tolerance');
        
        
        for i = 1: maxIterations
            xEst = (a + b)/2; 
            iTol = (b- a)/2; 
            fEst = f(xEst);
            
            fprintf('%3i  %11.6f %11.6f % 11.6f %11.6f %11.6f\n', i,a,b,xEst, fEst, iTol);
            
            % breaking if final perfect solution is found. 
            if fEst == 0
                fprintf('\nAn exact solution x = %11.6f was found', xEst)
                break
            end
            
            % breaking if tolerance is satisfied
            if iTol < tol % an approximate solution was found
                break
            end
            
            % breaking after maxiterations over
            if i == maxIterations
                fprintf('Solution was not obtained in %i iterations', maxIterations);
                break
            end
            
            % no break - continuiing the algorithm. 
            if fa*fEst < 0
                b = xEst; % new interval is [a, estimate]
            else
                a = xEst; % new interval [estimate, b]
            end
            
           
        end
        
        % when interval width is less than tolerance, we have this
        % approximate or exact solution (or algo could fail to converge,
        xSol = xEst;
        
    end
end

%%% STOP
% (1) when current tolerance (length of interval div by 2 = (b-a)/2) is 
% less than the given tolerance (given by user). 
% (2) or when we get exact f(est) = 0

%%% Additional Notes on bisection Method %%%
% * the method always converges provided a root is trapped in [a,b]
% * the method may fail when the function is tangent to the axis and 
% does not cross the axis at f(x) = 0. 
% * the method converges slowly compared to other methods. 