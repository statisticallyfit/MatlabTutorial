function [area, circum] = areaCircum(radius)
    area = pi* radius .* radius;
    circum = 2 * pi * radius; 
end