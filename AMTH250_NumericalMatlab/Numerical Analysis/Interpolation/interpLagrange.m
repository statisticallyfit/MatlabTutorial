% poly = the resulting interpolated polynomial from data xs, ys
% Ls = the intermediate lagrange polynomials (as many as there are data
% points)
function [poly, Ls] = interpLagrange(xs, ys)
    syms x; 
    
    n = length(xs);

    % symbolic vector to hold lagrange polynomials
    Ls = sym('L', [1,n]); 
    
    % MAKING THE LAGRANGE POLYNOMIALS
    for k = 1:n
        L = 1; % declaring the kth lagrange poly that we must build up in the lopo==op.
        for i = 1:n
            if i ~= k % skipping the kth data point if we are on the kth lagrange poly
                L = L*(x - xs(i)) / (xs(k) - xs(i)); % building up L_k
            end
        end
        Ls(k) = expand(L);
    end
    
    % MAKING THE (n-1)th-order polynomial out of the lagrange poly vec
    poly = vpa(sum(ys .* Ls), 10);
    
    
    % plotting the polynomial
    plotPoly(xs, ys, poly);
    % plotting the lagrange polys
    for i = 1:n
        plotPoly(xs, ys, Ls(i))
    end
    
end