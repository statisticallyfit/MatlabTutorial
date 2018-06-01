% Trapezoidal rule (iterative)
% a, b = interval over which to integrate f function handle
% ss = previous sum estimates for each interval size N from 2 to 2^16
% s = 
function [ss, hs] = trapezoidIter(f, a, b)

    for j = 1:16 % loop over powers of 2
        N = 2^j;
        h = (b-a)/N;
        
        s = (1/2)*(f(a) + f(b)); %end point weights are 0.5
        
        for n = 1:N-1
            x = a + n*h;
            s = s + f(x); % interior point weights = 1
        end
        s = h*s; 
        
        hs(j) = h;
        ss(j) = s;
        fprintf('Solution with %5i intervals is %13.9f\n', N, s)
        
    end
end