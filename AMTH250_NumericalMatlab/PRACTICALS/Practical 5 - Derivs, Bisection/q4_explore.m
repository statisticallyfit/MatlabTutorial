close all; clear all; clc

xs = -2:0.01:2.5;
f = @(x) x .^ 4 - x .^ 3 - 10;
fs = f(xs);

figure(1); clf; hold on
plot(xs, fs, 'b')
% x and y axis
plot([0 0], [min(fs)-25, max(fs)+25], 'k')
plot([min(xs), max(xs)], [0 0], 'k')
axis([min(xs) max(xs) min(fs)-25 max(fs)+25])

grid on; grid minor
xlabel('x')
ylabel('f(x) = x^4 - x^3 - 10')