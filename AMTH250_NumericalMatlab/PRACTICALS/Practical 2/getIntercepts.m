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
    for i = 1:length(indexChangeList)
        signIndex = indexChangeList(i);
        
        if abs(y(xs(signIndex))) < abs(y(xs(signIndex+1)))
            roots(counter) = xs(signIndex);
        else
            roots(counter) = xs(signIndex+1);
        end
        counter = counter + 1; 
    end
    
    yIntercept = y(0); % is the y-value where x = 0
    
end