function [yinterp] = Lagrange(x, y, xinterp)

    n = length(x);
    ninterp = length(xinterp);
    
    ell = NaN(n, ninterp);
    
    for j = 1:n
        lp = ones(1, ninterp);
        for i = 1:n
            if i ~= j
                lp = lp .* (xinterp - x(i)) ./ (x(j) - x(i) );
            end
        end
        ell(j, :) = lp; 
    end
    
    yinterp = y * ell;
end