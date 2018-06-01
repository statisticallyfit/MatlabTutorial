function area = simpsonIntegral(f, a, b, m) % m = power for num subintervals
    N = 2^m;
    h = (b-a)/N;
    s = f(a) + f(b); % endpoints weights = 1

    for n = 1:N-1
        x = a + n*h;
        s = s + (3 - (-1)^n) * f(x); 
    end

    area = (h/3) * s; % multiply s by h/3 to complete the formula

    fprintf('Solution with 2^%d = %d intervals, equals %13.9f\n', m, N, area)
end