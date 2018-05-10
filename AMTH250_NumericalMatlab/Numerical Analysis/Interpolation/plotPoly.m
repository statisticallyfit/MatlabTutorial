% poly = symbolic polynomial
% xs = original xs
% ys = original ys
function plotPoly(xs, ys, poly)
    % PLOTTING the data with the curve
    
    % making range for plotting the interpolated polynomial
    syms x; 
    
    xmin = min(xs);
    xmax = max(xs);
    ymin = min(ys);
    ymax = max(ys);
    polyXs = xmin : 0.01 :xmax;
    polyYs = subs(poly, x, polyXs);
    
    %plotting
    figure(1); clf; hold on; grid on; grid minor
    plot(polyXs, polyYs, 'c-', 'LineWidth', 2) % plot the polynomial
    plot(xs, ys, 'm.', 'MarkerSize', 30) % plot the data
    %plot([0 0], [ymin ymax], 'k-', 'LineWidth', 3) % y axis
    %plot([xmin xmax], [0 0], 'k-', 'LineWidth', 3) % x axis
    xlabel('x')
    ylabel('Data Points and Polynomial')
    %title(['Polynomial Interpolation, p(x) = ', poly])
end