% Gilat book, page 81 + mix of lecture notes (lec 10)

% tests: 
% fx = x^3 + x - 1   [0,1]
% fx = 8 - 4.5 * (x - sin(x))   [2,3]
% @(x)exp(x)+x.^4+x-2        
%       bisectRoot(f, 0, 1, 5*10^(-7), 30)

function xSol = bisectRoot (f, a, b, p)

    xL = a; 
    xR = b; 
    
    fa = f(a);
    %fb = f(b);
    
    % if you use while (iTol > tol) then it may never stop
    % since iTol may never get <= tol). 
    
    % Calculating num steps
    nMax = ceil(log(abs(b - a) * 2 * 10^p) / log(2)); 
    
    for n = 1: nMax
        xNew = (a + b)/2; 
        estimatedRoots(n) = xNew; 
        
        fNew = f(xNew);
        iTol = (abs(b - a)) / 2;

        fprintf('%3i  %11.6f %11.6f % 11.6f %11.6f %11.6f\n', n,a,b,xNew, fNew, iTol);

        % no break - continuiing the algorithm. 
        if fa*fNew > 0
            a = xNew; % new interval is [estimate, b]
        else
            b = xNew; % new interval [a, estimate]
        end
        
        if abs(b - a) < 0.5 * 10^(-p)
            break;
        end
        % breaking if tolerance is satisfied 
        %if iTol < tol % an approximate solution was found
        %    break;
        %end
        
    end
        
    xSol = xNew;
    fprintf('n = %d, nMax = %d, solution = %.30f\n', n, nMax, xSol)
    
    
    % Plotting
    %plotRoot(f, xSol, xL, xR)
    %plotConvergence([estimatedRoots, xSol], nMax)
    
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