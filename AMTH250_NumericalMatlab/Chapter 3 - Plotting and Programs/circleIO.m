% This script calculates the area of a circle.
% It prompts the user for the radius

% Ask for radius
fprintf('\n\n--- Units will be in inches.\n')
radius = input('Enter the radius: ');

% Calculate area
area = pi * radius^2;

% Print all variables in sentence format: 
fprintf('For a circle with radius %.5f inches, \n', radius)
fprintf('the area is %.5f inches squared.\n', area)

%fprintf(['For a circle with radius %.5f inches, \n,...'
%'the area is %.5f inches squared\n'], radius, area)
