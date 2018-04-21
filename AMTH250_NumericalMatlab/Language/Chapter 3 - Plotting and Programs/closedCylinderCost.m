function cost = closedCylinderCost(radius, height, costPerSquareFoot)
    % radius and height are in inches
    % cost is per square foot
    
    surfaceArea = 2*pi*radius .* height + 2*pi*radius .^ 2;
    
    % Convert surface area in square feet and round up
    surfaceAreaSqFeet = ceil(surfaceArea / 144);
    
    % Calculate cost in square feet
    cost = surfaceAreaSqFeet .* costPerSquareFoot;
end