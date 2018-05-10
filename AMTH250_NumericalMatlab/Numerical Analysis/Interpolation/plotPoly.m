% poly = symbolic polynomial
% xs = original xs
% ys = original ys
% xRange = a vector of length 2 containing min and max x values
function plotPoly(xData, yData, xRange, poly)
    % PLOTTING the data with the curve
    
    % making range for plotting the interpolated polynomial
    syms x; 
    
    xmin = xRange(1);
    xmax = xRange(2);
    polyXs = xmin : 0.01 :xmax;
    polyYs = subs(poly, x, polyXs);
    ymin = min(polyYs);
    ymax = max(polyYs);
    
    %plotting
    figure(1); clf; hold on; grid on; grid minor
    plot(polyXs, polyYs, 'c-', 'LineWidth', 2) % plot the polynomial
    plot(xData, yData, 'm.', 'MarkerSize', 30) % plot the data
    %plot([0 0], [ymin ymax], 'k-', 'LineWidth', 3) % y axis
    %plot([xmin xmax], [0 0], 'k-', 'LineWidth', 3) % x axis
    xlabel('x')
    ylabel('Data Points and Polynomial')
    %title(['Polynomial Interpolation, p(x) = ', poly])
end