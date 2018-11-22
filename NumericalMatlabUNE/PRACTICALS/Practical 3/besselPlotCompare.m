function besselPlotCompare()
% Over the interval 0 <= x <= 10, and nu = 1, compare my bessel
% with MATLAB's besselj(nu, x) function. 
% Plot the curves (mine is red dashed and matlab's is blue solid).

    % Get the data.
    xs = 0: 0.01: 10;
    nu = 1;
    % basically we vectorize over the xs, which is what the for-loop in
    % solutions code does as well. 
    ysMyBesselSums = besselJTruncated(nu, xs); % for each x in xs, calc bessel sum form = 0...10
    ysBesselSums = besselj(nu, xs);
    
    % Plotting the curves
    yMin = min([ysMyBesselSums ysBesselSums]); yMax = max([ysMyBesselSums ysBesselSums]);
    xMin = min(xs); xMax = max(xs); 
    
    plot(xs, ysMyBesselSums, 'r--', xs, ysBesselSums, 'b-')
    %axis([xMin-2, xMax+2, yMin-2, yMax+2])
    grid on; grid minor
    xlabel('x')
    ylabel('y')
    title('Comparison Between My Bessel and MATLAB''s Bessel')
    legend('My Bessel', 'MATLAB''s Bessel')
end