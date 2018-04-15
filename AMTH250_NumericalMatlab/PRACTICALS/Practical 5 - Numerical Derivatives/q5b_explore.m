
close all; clear all; clc

xs = -1.6 : 0.01 : 1; 
f = @(x) exp(x-2) + x .^3 - x;
fs = f(xs);

figure(1); clf; hold on
grid on; grid minor

plot(xs, fs, 'b')
plot([0 0], [min(fs) max(fs)], 'k')
plot([min(xs) max(xs)], [0 0], 'k')
axis([min(xs) max(xs) min(fs) max(fs)])

xlabel('x')
ylabel('f(x) = e^(x-2) + x^3 - x')