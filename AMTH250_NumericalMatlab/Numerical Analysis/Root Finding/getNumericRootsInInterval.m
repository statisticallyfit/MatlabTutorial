
% SOURCE: https://www.mathworks.com/help/symbolic/solve-equations-numerically.html
% NOTE: to find symbolic roots: solve(sym(f) == 0, x) but this won't give
% ALL the roots in a particular interval. 
function zeroes = getNumericRootsInInterval(f, xInterval, tolerance)
    if nargin < 3
        tolerance = 1e-6;
    end
    
    syms x;
    f = sym(f);
    
    % try to solve if none found then exit. 
    zeroes = vpasolve(f == 0, x,xInterval);
    
    if(isempty(zeroes))
        return
    else % if some are found them branch out in both directions to search for more roots. 
        lowerLimit = zeroes - tolerance;
        upperLimit = zeroes + tolerance;
        zeroesInLowerBound = getNumericRootsInInterval(f,[xInterval(1) lowerLimit],1);
        
        % sorting the unique lower bound zeroes. 
        if ~isempty(zeroesInLowerBound)
            zeroes = sort([zeroes zeroesInLowerBound]);
        end
        
        % sorting the unique upper bound zeroes. 
        zeroesInUpperBound = getNumericRootsInInterval(f,[upperLimit xInterval(2)],1);
        if ~isempty(zeroesInUpperBound)
            zeroes = sort([zeroes zeroesInUpperBound]);
        end
        
        return
    end
end