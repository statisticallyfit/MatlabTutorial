% Question 5

% Using poly area function and Monte Carlo for polygon area

% First
close all % close all figures
clear all; % clear all variables in base workspace so we don't
% accidentally use one or more here. 
clc; % clear command window. 



% Step 1: enter the data (note - the first and last elements of each vector
% must be equal, but the simplePolygonArea function adapts the data
% accordingly. 
xsPolygon = [8.25 5.69 2.3 1.43 -0.73 -3.29 -5.91 -8.02 -3.76 -1.31 1.66];
ysPolygon = [1.22 5.01 5.95 4.02 5.42 3.79 1.75 -1.81   -4.49 -2.04 -7.11]; 

% Step 2: find the xmin, xmax, ymin, ymax
xmin = min(xsPolygon);
xmax = max(xsPolygon);
ymin = min(ysPolygon);
ymax = max(ysPolygon); 


% Step 3 = generate n random points
Ns = [10^3, 10^4, 10^5];

fprintf('n             Actual Area      Estimated Area     Absolute Error      Relative Error\n')
for ii = 1:length(Ns)
    
    n = Ns(ii);

    % generate the n random x-coordinates on (-1,1) and the
    % n random y coordinates on (-1, 1)
    xs = rand(1, n) * (xmax - xmin)  + xmin;
    ys = rand(1, n) * (ymax - ymin) + ymin;



    % Step 4: determine how many of the random points lie inside
    % the given polygon vertice (inclusive)
    
    % INPOLYGON: query points are xs, ys and polygon points follow
    % We are asking which points of xs and ys lie inside the polygon or on
    % in = logical vector, on = logical vector
    % We must sum them to find the number of ins and ons, respectively. 
    [in, on] = inpolygon(xs, ys, xsPolygon, ysPolygon);
    c = numel(xs(in)) + numel(xs(on)); % getting the number of points lying in and on the polygon
    
    
    % Step 5: estimating the area of the polygon = c / area of rectangle
    % bounding the polygon.
    areaOfBoundingRectangle = (ymax - ymin) * (xmax - xmin);
    areaPolygonEstimate = (c / n) * areaOfBoundingRectangle;  % estimated area
    % is the proportion of points inside the polygon (c/n) times the
    % rectangle area. 
    
    % Step 6: calculate the actual area using simplePolyArea
    areaPolygonTrue = simplePolyArea(xsPolygon, ysPolygon);
    
    % Step 7: get the error between actual and estimated areas
    absoluteErrorOfArea = abs(areaPolygonEstimate - areaPolygonTrue);
    relativeErrorOfArea = absoluteErrorOfArea / abs(areaPolygonTrue);
    
    
    % Step 8: display the n-value and error
    
    fprintf('%-14d  %.5f  %15.5f  %15.5f  %20.5f \n', n, areaPolygonTrue, areaPolygonEstimate, ...
        absoluteErrorOfArea, relativeErrorOfArea); %% TEACHER NOTE: this makes a very nice table!
    
end


%MARK (5/5)