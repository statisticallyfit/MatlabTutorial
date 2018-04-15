clear all; close all; clc

% load data from the displacement file
data = load('displacement.mat');

% extract dixplacement x and associated times t from datafile
x = data.x; 
t = data.t; 
n = length(t);
h = t(2) - t(1);


% determine forward diff approximation for dx/dt
dxdt_f = NaN(1, n);
dxdt_f(1, 1:n-1) = (x(2:n) - x(1:n-1)) ./ h; 

%determine backward diff approximation for dx/dt
dxdt_b = NaN(1, n);
dxdt_b(1, 2:n) = (x(2:n) - x(1:n-1)) ./ h; 

% determine central difference approx for dx/dt
dxdt_c = NaN(1, n);
dxdt_c(1, 2:n-1) = (x(3:n) - x(1:n-2)) ./ (2*h);


% determine central diff approximation for d2x/dt2 (second deriv)
d2xdt2_c = NaN(1, n);
d2xdt2_c(1, 2:n-1) = (x(3:n) + x(1:n-2) - 2*x(2:n-1)) ./ (h^2);


% Plotting
figure(1); clf; hold on
subplot(3, 1, 1); hold on % subplot m=3 rows, n=1 col, referring to row=1
plot(t, x, 'k')
xlabel('t')
ylabel('x')

subplot(3, 1, 2); hold on % subplot: m=3 rows, n=1 col, referring to row=2
plot(t, dxdt_f, 'r') % forward
plot(t, dxdt_b, 'g') % backward
plot(t, dxdt_c, 'b') % central 
xlabel('t')
ylabel('dx/dt')
legend('Forward', 'Backward', 'Central')

subplot(3, 1, 3); hold on % 3 rows, 1 col, referring to third row plot
plot(t, d2xdt2_c, 'k')
xlabel('t')
ylabel('d^2x/dt^2 Central')