
clear all; close all; clc

f = @(x) 2*x.^3 - 6*x - 1;
xs = -2:0.01:2;
fs = f(xs);

figure(1); clf; hold on
plot(xs, fs, 'b')
plot([0 0], [min(fs) max(fs)], 'k')
plot([min(xs) max(xs)], [0 0], 'k')
axis([min(xs) max(xs) min(fs) max(fs)])

xlabel('x')
ylabel('f(x) = 2x^3 - 6x - 1')
