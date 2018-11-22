% Calculates the polynomial of the pth order least squares fit to data
function olsPoly = polyLeastSquares(xData, yData, power)
    if length(xData) ~= length(yData)
        error('Lengths of xData and yData are not the same')
    end
    
    % else we continue
    n = length(xData);
    xData = sym(reshape(xData, [1, n]));
    yData = sym(reshape(yData, [1, n]));
    
    % Make the list of powers 0 -> p+p
    ppList = 0 : (power + power);
    
    % calculate the power sums:
    xPowSums = sym(zeros(1, power+power + 1));
    for p = ppList
        xPowSums(p+1) = sum(xData .^ p);
    end
    
    % calculate the xyPow Sums
    xyPowSums = sym(zeros(1, power+1));
    for p = 0:power
        xyPowSums(p+1) = sum((xData .^ p) .* yData);
    end
    xyPowSums = transpose(xyPowSums); % since this is the coefficient vector.
    
    % Now make the matrix from xPowSums
    xPowSumMatrix = sym(zeros(power + 1, power + 1));
    for p = 0:power
        xPowSumMatrix(p+1, :) = xPowSums(p+1 : p+1 + power);
    end
    
    % solve the system
    coefficients = linsolve(xPowSumMatrix, xyPowSums);
    
    % Build up the polynomial symbolically:
    syms x; 
    xs = sym(zeros(1, power + 1)); % +1 to hold the x^0 constant x
    for p = 0 : power
        xs(p+1) = x ^ p;
    end
    
    % Now multiply to get the polynomials
    olsPoly = fliplr(xs * coefficients);
    
end