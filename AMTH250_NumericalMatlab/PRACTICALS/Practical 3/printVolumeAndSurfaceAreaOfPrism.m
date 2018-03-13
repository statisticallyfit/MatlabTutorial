function printVolumeAndSurfaceAreaOfPrism()
    [n, h, S] = getPrism();
    [V, SA] = calculateVolumeAndSurfaceArea(n, h, S);
    
    fprintf('For a prism of height h = %.3f, that has as its base\n', h)
    fprintf('an n-sided regular polygan, where n = %.3f, and where S = %.3f\n', n, S)
    fprintf('is the length of the sides of the polygon, the prism then has\n')
    fprintf('volume V = %.3f and surface area SA = %.3f\n', V, SA)
    fprintf('\n')
end