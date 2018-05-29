% part f) cubic spline

f = @(x) cos(2 * x);
x = [0 0.2 0.4 0.6 0.8 1];
y = f(x);

% Plotting lagrange L3 over -1, 2 with the function cos(2x)
figure(1); clf; hold on; grid on; grid minor

% interval
xx = -1 : 0.01: 2;

% add data points
plot(x, y, 'r.', 'MarkerSize', 30);
% add lagrange polynomial
plot(xx, subs(L3, symvar(L3), xx), 'k-', 'LineWidth', 2);
% add the original function f(x) = cos(2x)
plot(xx, f(xx), 'b-', 'LineWidth', 2);
% Add the cubic not a knot spline
plot(xx, spline(x, y, xx), 'm-', 'LineWidth', 2);
% resize the axis
axis([-1, 2, -1.2, 1.2]);

legend('Data', 'Third Lagrange Poly', 'f(x) = cos(2x)', 'Not-A-Knot Cubic Spline', 'Location', 'Best')
hold off;