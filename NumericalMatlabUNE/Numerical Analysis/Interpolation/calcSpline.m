% given the list of splines and original xs, this function calculates the
% interpolated value of the spline, depending on where it falls in the
% interval. 
function yInterps = calcSpline(xData, splines, xInterps)
    n = length(xData); % test condition: length(splines) + 1 = length(xs)
    %xInterps = sym(xInterps);
    yInterps = sym(zeros(1, length(xInterps)));
    %xData = sym(xData);
    
    syms x;
    
    for c = 1:length(xInterps)
        for i = 1:n-1
            if xInterps(c) >= xData(i) && xInterps(c) <= xData(i+1)
                yInterps(c) = sym(subs(splines(i), x, xInterps(c)));
            end
        end
    end
end