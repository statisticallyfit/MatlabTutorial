function [roots, yIntercept] = getIntercepts(xs, y)
% Given xs  the original function, get the x-intercept
% and y intercept of the original function

    % Get the yvalues using the original function: 
    ys = y(xs);
    % Get indices in ys where y changes sign (indices of x roots)
    indexChangeList = int32(find(diff(sign(ys)))); %changing to ints otherwise are doubles!
    
    %Getting the x-roots
    roots = zeros(1, length(indexChangeList));
    
    counter = 0; 
    for i = indexChangeList
        if abs(y(xs(i))) < abs(y(xs(i+1)))
            roots(counter) = xs(i);
        else
            roots(counter) = xs(i+1);
        end
        counter = counter + 1; 
    end
    
    yIntercept = y(0); % is the y-value where x = 0
    
end