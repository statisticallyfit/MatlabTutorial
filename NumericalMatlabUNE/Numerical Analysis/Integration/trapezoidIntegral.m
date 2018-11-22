function area = trapezoidIntegral(f, a, b, m)
    N = 2^m;
    h = (b-a)/N;

    s = (1/2)*(f(a) + f(b)); %end point weights are 0.5

    for n = 1:N-1
        x = a + n*h;
        s = s + f(x); % interior point weights = 1
    end
    area = h*s; 
end