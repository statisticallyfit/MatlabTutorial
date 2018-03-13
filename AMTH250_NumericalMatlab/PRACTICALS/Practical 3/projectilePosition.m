function [x, y] = projectilePosition(t, v0, theta0)
% For a time t, the function calculates the position
% of a projectile, (x,y). 
%
%   g = 9.807 m/s^2, 
%   v0 = initial speed, 
%   theta0 = angle of departure
% Position is: 
%   x = v0 * cos(theta0 * t)
%   y = v0 * sin(theta0 * t) - (1/2)*g*t^2
    g = 9.807; 
    
    x = v0 * cos(theta0 * t);
    y = v0 * sin(theta0 * t) - (1/2)*g*t .^ 2;
end