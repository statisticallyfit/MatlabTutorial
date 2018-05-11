% given the list of splines and original xs, this function calculates the
% interpolated value of the spline, depending on where it falls in the
% interval. 
function yInterp = calcSpline(xs, splines, xInterp)
    n = length(xs); % test condition: length(splines) + 1 = length(xs)
    
    for i = 1:n-1
        if xInterp >= xs(i) && xInterp <= xs(i+1)
            syms x;
            yInterp = subs(splines(i), x, xInterp);
        end
    end
end