function [ss, hs] = simpsonIter(f, a, b)

    for j = 1:16 % loop over powers of 2 for N subdivisions
        N = 2^j; 
        h = (b-a)/N;
        s = f(a) + f(b); % endpoints weights = 1
        
        for n = 1:N-1
            x = a + n*h;
            % s= sum in the formula for each iteration. 
            s = s + (3 - (-1)^n) * f(x); % interior weights are 4 
            % if n = odd and 2 if n = even. 
        end
        
        s = (h/3) * s; % multiply s by h/3 to complete the formula
        
        hs(j) = h; 
        ss(j) = s;
        
        fprintf('Solution with 2^%d = %d intervals, equals %13.9f\n', j, N, s)
end