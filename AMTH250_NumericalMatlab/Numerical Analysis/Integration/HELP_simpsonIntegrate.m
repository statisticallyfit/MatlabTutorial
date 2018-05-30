% HELP - doesn't work!


% N = number of subintervals
function area = HELP_simpsonIntegrate(f, a, b, N)
    if rem(N, 2) ~= 0
        fprintf('N = %d must be even\n', N)
        return;
    end
    
    % else continue
    h = (b - a)/N;
    xx = a : h : b;
    
    weights = zeros(0, N);
    weights(1) = 1;
    weights(N+1) = 1;
    
    for i = 2:N
        weights(i) = 3 + (-1)^i;
    end
    
    %disp(f(xx))
    area = (h/3) * sum(weights .* f(xx));
    
end