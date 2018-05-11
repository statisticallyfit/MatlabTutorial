% given the list of splines and original xs, this function calculates the
% interpolated value of the spline, depending on where it falls in the
% interval. 
function yInterps = calcSpline(xs, splines, xInterps)
    n = length(xs); % test condition: length(splines) + 1 = length(xs)
    xInterps = sym(xInterps);
    yInterps = sym(zeros(1, length(xInterps)));
    xs = sym(xs);
    
    for c = 1:length(xInterps)
        
        for i = 1:n-1
            if xInterps(c) >= xs(i) && xInterps(c) <= xs(i+1)
                syms x;
                yInterps(c) = subs(splines(i), x, xInterps(c));
            end
        end
    end
end