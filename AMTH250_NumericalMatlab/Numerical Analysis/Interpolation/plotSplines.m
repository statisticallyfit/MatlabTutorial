% splinePolys = the linear or cubic splines (a list of symbolic
% polynomials)
% xs = original xs
% ys = original ys
function plotSplines(xData, yData, splinePolys)
    % making range for plotting the interpolated polynomial
    syms x; 
    n = length(xData);
    
    figure(1); clf; hold on; grid on; grid minor;
    
    % plot data points
    plot(xData, yData, 'b.', 'MarkerSize', 30);
    
    for i = 1:n-1
        % getting calculated values of the ith spline poly in the interval of 
        % x(i), x(i+1)
        xx = xData(i): 0.01: xData(i+1);
        ss = subs(splinePolys(i), x, xx);
        
        %plotting
        plot(xx, ss, 'b-', 'LineWidth', 2)
    end
    
    % add x-axis
    %plot([min(xData), max(xData)], [0 0]);
    
    xlabel('x')
    ylabel('Data Points and Polynomial')
    
    legend('Data', 'Spline (ith)', 'Location', 'Best')
end