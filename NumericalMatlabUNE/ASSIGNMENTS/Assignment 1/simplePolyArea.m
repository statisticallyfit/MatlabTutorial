% Question 3
%       The simplePolyArea(x,y) function calculates the area of a polygon
% in Cartesian coordinates. It updates the vectors x, y if the first
% elements aren't the same as the last elements. 

% x = the x coordinate part of the vertices of the polygon.
% y = the y coordinates of the vertices of the polygon. 
% area = resulting area. 
% ASSUME
%       (1)   the vertices of the polygon are in the correct order, meaning
% starting at any vertex but going either full-way clockwise or
% full-way counter clockwise. Cannot hop around from vertex to vertex. 
%       (2) the vectors x and y have the same length.

function area = simplePolyArea(x, y)
    cumSum = 0;
    n = length(x);
    
    limit = 0; % the upper limit for the loop
    
    % NOTE: since length(x) = length(y) (assumed) then we must treat both
    % appendings at the same time, not separately. 
    
    % Case 1: if x(1) ~= x(n) then append x(n+1) = x(1) (same for y
    % vector), and upper limit for loop is n = limit
    %if x(1) ~= x(n) && y(1) ~= y(n)
    %    x(n+1) = x(1);
    %    y(n+1) = y(1); 
    %    limit = n;
    % CASE 2: x(1) = x(n) and y(1) = y(n), no appending done    
    %else
    %    limit = n - 1; 
    %end
    x(n+1) = x(1);
    y(n+1) = y(1); % even if this is already satisfied, this makes no
    % difference to the final answer. 
    
    area = 0.5 * abs(sum((x(1:n) - x(2:n+1)) .* (y(1:n) + y(2:n+1)))); 
    
    % Assuming vectors x and y are the same length
    %for ii = 1: limit
        %%%fprintf('%d  x(i) = %.2f, x(i + 1) = %.2f\n', ii, x(ii), x(ii+1));
    %    coordinateProduct = (x(ii) - x(ii + 1)) * (y(ii) + y(ii+1));
    %    cumSum = cumSum + coordinateProduct;
    %end
    
    %area = (1/2) * abs( cumSum );
    
end

%MARK (4/4)