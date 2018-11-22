% Question 4: Monte Carlo

% This script uses the Monte Carlo Method to get 
% an estimate of the irration Pi. 

% First
close all % close all figures
clear all; % clear all variables in the base workspace so the script doesn't borrow  from it. 
clc; % clear command window for clarity. 


% Step 1: prompt user for an integer n 
% (must be the n = large number of random points to be
% uniformly generated)
n = input('Enter a large number n: ');
while ~isnumeric(n) || ~isscalar(n) || n <= 0 || ~isfinite(n) || isnan(n) || iskeyword(n) 
    disp('Invalid: input must be a positive integer n.')
    n = input('Enter again: ');
end


% Step 2: generate the n random x-coordinates on (-1,1) and the
% n random y coordinates on (-1, 1)
xs = rand(1, n) * (1 + 1) - 1;
ys = rand(1, n) * (1 + 1) - 1;


% Step 3: determine the number (c) for which x^2 + y^2 <= 1
% (meaning, the number of coordinates that lie inside or on
% the unit circle at the origin)
circlePoints = xs .^ 2 + ys .^ 2;
% finding the count of points that are on or inside the  circle
c = sum(circlePoints <= 1);


% Step 4: now estimate Pi by multiplying c/n by area of square (4)
% that the circle lies inside
estimatePI = 4*c / n; 
format long
disp(['The estimate of pi = ', num2str(estimatePI)])



% Step 5: visualizing the calculation: 

close all; % close all figures/plots
clf; % clears the current figure/plot - if we do close all this is not necessary. 

% getting points that lie outside the circle versus inside and on the
% circle
cInside = find(circlePoints <= 1);
cOuts = find(circlePoints > 1);


%xsInside = zeros(1, c); % is a vector to hold x-coordinate of coordinate
% pair that lies inside the unit circle
%ysInside = zeros(1, c);

%xsOutside = zeros(1, n - c);
%ysOutside = zeros(1, n- c); 

%for ii = 1:n
%    %   if points are inside and on the circle, put them in the 'inside'
%    %   vector. 
%    if xs(ii)^2 + ys(ii)^2 <= 1
%        xsInside(ii) = xs(ii); % some indices in the xsInside vec are
%        skipped, causing extra zeroes to be plotted on the graph! NOT
%        CORRECT. 

%        ysInside(ii) = ys(ii);
%    else % the points are outside the circle, put them in the 'outside' vector
%        xsOutside(ii) = xs(ii);
%        ysOutside(ii) = ys(ii);
%    end
%end


%% TEACHER COMMENT
%NOTE: by default xsInside, ysInside, xsOutside and ysOutside have entries
%of zero, some of which will not be overwritten by the above code. Thus the
%plots of the random points below will include multiple points at the
%origin that were probably not part of the random selection of numbers.
%(See the blue dot at the centre of your plot.) 
%%


figure(1)
% plot the square with solid black lines
plot([-1 -1], [-1 1], 'k-') % at x = -1, straight vertical line from -1 to 1
hold on
grid on; grid minor
plot([1 1], [-1 1], 'k-') % at x = 1, straight vertical line from -1 to 1
plot([-1 1], [-1 -1], 'k-') % the bottom part of the square
plot([-1 1], [1 1], 'k-') % the top part of the square. 

axis([-1.5 1.5, -1.2 1.2]) % setting xlimits [-1.3, 1.3] and ylimits [-1.4, 1.4]

% plot the unit circle with a solid black curve
theta = 0:0.01: 2*pi; %the domain of the unit circle [0, 2pi]
plot(cos(theta), sin(theta), 'k-'); % plotting the circle

% plotting the x and y axes (just for clarity)
plot([0 0], [-1, 1], 'k-') % the y-axis
plot([-1, 1], [0, 0], 'k-') % the axis, both with black lines

% Plotting the Monte Carlo Data. 
plot(xs(cInside), ys(cInside), 'r.') % plot inside dots as red points. 
plot(xs(cOuts), ys(cOuts), 'b.') % plot outside dots as blue dots. 

% Now labels
xlabel('x')
ylabel('y')
title('The Monte Carlo Estimate of Pi')



%MARK (4.5/5) -- this is a good code, but be careful not to introduce extra
%points when visualising your variables/data
