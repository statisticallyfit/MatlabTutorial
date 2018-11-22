function [yinterp] = Lagrange(x,y,xinterp)
%LAGRANGE [yinterp] = Lagrange(x,y,xinterp)
% Returns the values, yinterp, of the polynomial of
% degree n - 1 that passes through the n data points (x, y) at the values
% in the row vector xinterp, using the Lagrange form of the interpolating
% polynomial


n = length(x);
ninterp = length(xinterp);

ell = NaN(n,ninterp);

for jj = 1:n
    lp = ones(1,ninterp);
    for ii = 1:n
        if ii ~= jj
            lp = lp.*((xinterp-x(ii))./(x(jj)-x(ii)));
        end
    end
    ell(jj,:) = lp;
end

yinterp = y*ell;

end