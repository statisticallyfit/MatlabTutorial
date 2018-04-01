% Question 3
%       The simplePolyArea(x,y) function calculates the area of a polygon
% in Cartesian coordinates. 
% x = the x coordinate part of the vertices of the polygon.
% y = the y coordinates of the vertices of the polygon. 
% area = resulting area. 
%       Assume: 
% (1)   x(1) == x(n + 1) and y(1) = y(n+1)
% (2)   the vertices of the polygon are in the correct order, meaning
% starting at any vertex but going either full-way clockwise or
% full-way counter clockwise. Cannot hop around from vertex to vertex. 

function area = simplePolyArea(x, y)
    cumSum = 0;
    n = length(x) - 1;
    
    % check if first and last elements are the same, for each
    % of the vectors x and y ???
    %if x(n + 1) ~= x(1) || y(n+1) ~= y(1)
    %    error('x(n+1) must = x(1) and y(n+1) must = y(1)')
    %end
       
    
    % Assuming vectors x and y are the same length = n + 1
    for ii = 1: n
        coordinateProduct = (x(ii) - x(ii + 1)) * (y(ii) + y(ii+1));
        cumSum = cumSum + coordinateProduct;
    end
    
    area = (1/2) * abs( cumSum );
    
end