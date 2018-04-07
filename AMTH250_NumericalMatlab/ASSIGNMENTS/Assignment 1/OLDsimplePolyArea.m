function area = OLDsimplePolyArea(x, y)
    cumSum = 0;
    n = length(x) - 1;
    
    % check if first and last elements are the same, for each
    % of the vectors x and y ???
    %if x(n + 1) ~= x(1) || y(n+1) ~= y(1)
    %    error('x(n+1) must = x(1) and y(n+1) must = y(1)')
    %end
       
    
    % Assuming vectors x and y are the same length = n + 1
    for ii = 1: n
        fprintf('%d  x(i) = %.2f, x(i + 1) = %.2f\n', ii, x(ii), x(ii+1));
        coordinateProduct = (x(ii) - x(ii + 1)) * (y(ii) + y(ii+1));
        cumSum = cumSum + coordinateProduct;
    end
    
    area = (1/2) * abs( cumSum );
    
end