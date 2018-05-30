% part f) cubic spline

f = @(x) cos(2 * x);
x = [0 0.2 0.4 0.6 0.8 1];
y = f(x);
[polyInterp, ~] = interpLagrange(x, y);

% Plotting lagrange L3 over -1, 2 with the function cos(2x)
figure(1); clf; hold on; grid on; grid minor

% interval
xx = -1 : 0.01: 2;
% add data points
plot(x, y, 'r.', 'MarkerSize', 30);
% add the original function f(x) = cos(2x)
plot(xx, f(xx), 'b-', 'LineWidth', 2);
% Add the Lagrange interpolating polynomial
plot(xx, subs(polyInterp, symvar(polyInterp), xx), 'm-', 'LineWidth', 2);
% Add the cubic not a knot spline
plot(xx, spline(x, y, xx), 'k-', 'LineWidth', 2);
% resize the axis
axis([-1, 2, -1.2, 1.2]);

legend('Data', 'f(x) = cos(2x)', 'Lagrange Interpolation', 'Not-A-Knot Cubic Spline', 'Location', 'Best')
hold off;