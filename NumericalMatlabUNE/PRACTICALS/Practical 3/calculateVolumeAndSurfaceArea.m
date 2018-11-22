function [V, SA] = calculateVolumeAndSurfaceArea(n, h, S)
    % Calculates the volume and surface area, given the numSides n
    %, the height h, and S side lengths. 
    
    V = (n/4) * h * S^2 * cot(pi/n);
    SA = (n/2) * S^2 * cot(pi/n) + n * S * h; 
    
end