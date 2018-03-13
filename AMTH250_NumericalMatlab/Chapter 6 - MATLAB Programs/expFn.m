function expFn(x)
% Comparing built in functions exp(x) and series approximation and prints

    % Automatic calc
    fprintf('Value of built-in exp(x) is %.5f\n', exp(x))
    
    % Manual (series) calc
    % n = arbitrary number of terms
    n = 10;
    fprintf('Approximate exp(x) is %.5f\n', approxExpX(x, n))
end

function approx = approxExpX(x, n)
% Approximates e^x to terms of nth power
    approx = 1; % initialize running sum for first term
    
    for i = 1:n
        approx = approx + (x^i) / factorial(i);
    end
end