function besselPlotCompare()
% Over the interval 0 <= x <= 10, and nu = 1, compare my bessel
% with MATLAB's besselj(nu, x) function. 
% Plot the curves (mine is red dashed and matlab's is blue solid).

    % Get the data.
    xs = 0: 0.01: 10;
    nu = 1;
    ysMyBessel = besselJTruncated(nu, xs);
    ysBessel = besselj(nu, xs);
    
    % Plotting the curves
    yMin = min([ysMyBessel ysBessel]); yMax = max([ysMyBessel ysBessel]);
    xMin = min(xs); xMax = max(xs); 
    
    plot(xs, ysMyBessel, 'r--', xs, ysBessel, 'b-')
    %axis([xMin-2, xMax+2, yMin-2, yMax+2])
    grid on; grid minor
    xlabel('x')
    ylabel('y')
    title('Comparison Between My Bessel and MATLAB''s Bessel')
    legend('My Bessel', 'MATLAB''s Bessel')
end