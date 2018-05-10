% poly = symbolic polynomial
% xs = original xs
% ys = original ys
% xRange = a vector of length 2 containing min and max x values
function plotComparePoly(xs1, ys1, xs2, ys2, xmin, xmax, poly1, poly2)
    % PLOTTING the data with the curve
    
    % making range for plotting the interpolated polynomial
    syms x; 
    
    % first poly
    pxs1 = xmin : 0.01 :xmax;
    pys1 = subs(poly1, x, pxs1);
    ymin1 = min(pys1);
    ymax1 = max(pys1);
    
    % second poly
    pxs2 = xmin : 0.01 :xmax;
    pys2 = subs(poly2, x, pxs2);
    ymin2 = min(pys2);
    ymax2 = max(pys2);
    
    %plotting
    figure(1); clf; hold on; grid on; grid minor
    plot(pxs1, pys1, 'r-', 'LineWidth', 2) % plot the polynomial
    plot(xs1, ys1, 'm.', 'MarkerSize', 30) % plot the data
    % plot second poly
    plot(pxs2, pys2, 'b-', 'LineWidth', 2) % plot the polynomial
    plot(xs2, ys2, 'c.', 'MarkerSize', 30) % plot the data
    
    xlabel('x')
    ylabel('Data Points and Polynomial')
    
    legend('Poly 1', 'Data 1', 'Poly 2', 'Data 2', 'Location', 'Best')
end