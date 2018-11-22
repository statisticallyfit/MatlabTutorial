
close all; clear all; clc;


h = 0.01; 

xs = 0 : h : 4; 

fs = cos(xs);
dfdx = - sin(xs);

n = length(xs);


% forward diff
dfdx_forward = NaN(1, n);
for ii = 1:n-1
    dfdx_forward(ii) = (cos(xs(ii + 1)) - cos(xs(ii))) / h; 
end

% Vectorized forward diff
dfdx_forward_vec = NaN(1, n);
dfdx_forward_vec(1, 1:n-1) = (cos(xs(2:n)) - cos(xs(1:n-1))) ./ h; 



% backwards diff
dfdx_backwards = NaN(1, n);
for ii = 2:n
    dfdx_backwards(ii) = (cos(xs(ii)) - cos(xs(ii-1))) / h; 
end
% Vectorized backward diff
dfdx_backward_vec = NaN(1, n);
dfdx_backward_vec(1, 2:n) = (cos(xs(2:n)) - cos(xs(1:n-1))) ./ h; 





% central diff
dfdx_central = NaN(1,n);
for ii = 2:n-1
    dfdx_central(ii) = (cos(xs(ii + 1)) - cos(xs(ii - 1))) / (2*h); 
end

%midpoint of 3,1 = 2, midpoint of n, n-2 = n-1
dfdx_central_vec = NaN(1,n);
dfdx_central_vec(1, 2:n-1) = (cos(xs(3:n)) - cos(xs(1:n-2))) ./ (2*h);






%%% PLOTTING
figure(1); clf; hold on
plot(xs, dfdx, 'r')
plot(xs, dfdx_forward_vec, 'b')
plot(xs, dfdx_backward_vec, 'g')
plot(xs, dfdx_central_vec, 'k')
xlabel('x')
ylabel('dfdx')
legend('Exact Deriv', 'Forward', 'Backwards', 'Central')




%% Errors
error_forward = abs(dfdx_forward_vec - dfdx); 
error_backward = abs(dfdx_backward_vec - dfdx);
error_central = abs(dfdx_central_vec - dfdx);

figure(2); clf; hold on
plot(xs, error_forward, 'b')
plot(xs, error_backward, 'r')
plot(xs, error_central, 'g')
xlabel('x')
ylabel('Absolute error')
legend('Forward error', 'Backward error', 'Central Error')
