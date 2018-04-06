% Sauer book, page28

% Program 1.1: Bisection Method
% Computing approximate solution of f(x) = 0
% Input: function handle f; a,b such that f(a)*f(b) <0; and tolerance tol
% Output: Apprxomiate solution xSol

function xSol = bisect(f, a, b, tol)

    if sign(f(a)) * sign(f(b)) >= 0
        error('f(a)f(b) < 0 not satisfied!'); % stops execution
    end
    
    fa = f(a);
    fb = f(b); 
    
    while (b - a)/2 > tol
        c = (a + b)/2;
        fc = f(c);
        
        if fc == 0 % found it!
            a = c;
            b = c; % with this assignment, we are making (b-a)/2 = 0 < tol to break out of while loop
            %break
        end
        
        if sign(fc)*sign(fa) < 0 % then new interval [a,c]
            b = c; 
            fb = fc; 
        else % new interval [c, b]
            a = c; 
            fa = fc; 
        end
    end
    
    % when interval width is less than tolerance, %
    % we have the solution: 
    xSol = (a + b)/2;
    
end