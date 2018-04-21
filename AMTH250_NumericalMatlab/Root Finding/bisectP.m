
% Gilat book, page 81 + mix of lecture notes (lec 10)

% tests: 
% fx = x^3 + x - 1   [0,1]
% fx = 8 - 4.5 * (x - sin(x))   [2,3]
% @(x)exp(x)+x.^4+x-2        
%       bisectRoot(f, 0, 1, 5*10^(-7), 30)

function xSol = bisectP(f, a, b, p)

    xL = a; 
    xR = b; 
    
    % Calculating num steps
    nMax = ceil(log( (abs(b - a)) * 2 * 10^p) / log(2));
    
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
        if abs(b - a) <= 0.5*10^(-p)
            xSol = xNew;
            break;
        end
        
    end
        
    fprintf('n = %d, nMax = %d, solution = %.*f\n', n, nMax, (p+1), xNew)
    
    
    % Plotting Convergence
    if all(~isnan(allXs)) && all(~isinf(allXs))
        plotConvergence(allXs);
        plotCobweb(g, allXs);
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