% Question 2
% n = assumed >= 2. 
% F = the first n elements of the fibonacci sequence.
% Q = the first (n-1) quptients derived
% from consecutive terms of the sequence (F2/F1, F3/F2, ... Fn/F(n-1))

function [F, Q] = fib(n)


% NOTE: as n -> Inf, Fn/(Fn-1) = golden ratio = (1 + sqrt(5))/2

    if n < 2
        error('n must be >= 2.')
    end
    
    % initialize F1 = 1 and F2 = 1 in the F vector.
    F = [1, 1, zeros(1, n -3 + 1)];
    
    % initialize the n - 1 terms of the consecutive quotients vector. 
    Q = zeros(1, n-1);
    
    % Generating the n Fibonacci numbers.
    for ii = 3:n
        F(ii) = F(ii-1) + F(ii-2);
    end
    
    % Generating the quotients from the Fibonacci numbers.
    for ii = 1:(n-1)
        Q(ii) = F(ii + 1) / F(ii); 
    end
        
end