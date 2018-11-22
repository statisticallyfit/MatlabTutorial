syms x; 
L3 = vpa(expand((x - 0)*(x - 0.2)*(x - 0.6)*(x - 0.8)*(x - 1)./((0.4-0)*(0.4-0.2)*(0.4-0.6)*(0.4-0.8)*(0.4-1))), 7);

f = @(x) cos(2 * x);
x = [0 0.2 0.4 0.6 0.8 1];
y = f(x);

% part d) Estimate cos(1) = cos(2*0.5) -----------------------------------------------------------
[polyInterp, ~] = interpLagrange(x, y);
fprintf('The interpolated polynomial is: %s\n', string(vpa(polyInterp, 5)))
% vpa(polyInterp, 8) % rounded to 8 decimals

% estimate cos(1) by plugging in x = 0.5 for y = cos(2x)
var = symvar(polyInterp);
yInterp = subs(polyInterp, var, 0.5);
fprintf('The value of cos(1) = cos(2*0.5) is about = %.5f\n', yInterp)



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
% resize the axis
axis([-1, 2, -1.2, 1.2]);

legend('Data', 'f(x) = cos(2x)', 'Interpolating function', 'Location', 'Best')
hold off;