% This function finds the root of function handle f in interval a, b
% correct to p digits via the bisection method. 
% p = power for a relative error (p > 0) so if we want to calculate
% the number of steps for relative error of 10^-12, give p = 12. 
% f = function handle to estimate the root of.
% a, b = interval, with a <= b. 
% RETURNS: xSol approximate to p decimal places, or 'No Answer' string if
% convergence to the root does not occur within nMax steps. 
function xSol = bisect(f, a, b, p)

    xL = min([a, b]); 
    xR = max([a, b]); 
    
    % Set a fixed num steps
    nMax = 100;
    % We can actually preallocate since we can calculate number of steps
    % beforehand, but only if a or b are not zero since that would find
    % log(0) = infinity. 
    steps = nMax;
    if a ~= 0 && b ~= 0
        steps = ceil( log(abs(xR-xL)*10^p/abs(xL)) / log(2) );
    end
    
    % starting
    xSol = 'No Answer'; 
    fa = f(a);
    xNew = 0;
    
    % Making a list of previous root estimates so that we can calculate the
    % tolerance for each iteraction. 
    x = zeros(1, nMax);
    x(1) = 0;
    
    for n = 1: nMax
        xNew = (a + b)/2; 
        x(n+1) = xNew;
        fNew = f(xNew);
        
        if fa*fNew > 0
            a = xNew; % new interval is [estimate, b]
            fa = fNew;
        else
            b = xNew; % new interval [a, estimate]
        end
        
        %fprintf('a = %.5f, x(n-1) = %.5f, b = %.5f, x(n) = %.5f\n', a, x(n), b, x(n+1))
        
        % relative error must be less than 10^-p. We need this tolerance check here
        % if either a or b = 0 since calculating nMax directly would yield
        % infinite value since log(0) = infinity. 
        if abs(x(n+1) - x(n)) <= abs(x(n) * 10^(-p))
            xSol = xNew; % replaces the 'No Answer' value. 
            break;
        end
        
    end
    
    % The %.*f means print the solution xSol to within p decimal places, as
    % the question asked.
    % n = number of iterations required to reach xSol to within p decimal
    % places. 
    fprintf('n = %d, nMax = %d, steps = %d, solution = %.*f\n', n, nMax, steps,  p,xSol)
    
end