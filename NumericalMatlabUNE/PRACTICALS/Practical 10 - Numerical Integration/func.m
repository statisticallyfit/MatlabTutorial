function [f] = func(x)
    n = length(x);
    f = NaN(1, n);
    
    for i = 1:n
        if abs(x(i)) >= 0.001
            f(i) = sin(x(i))/x(i);
        else
            f(i) = 1 - x(i)^2/6;
        end
    end
end