% m = the power such that num intervals N = 2^m
% a, b = interval
% s = final estimated sum
% DETERMINE the sum of the new function values required to
% add to a running sum of f values at level m of an efficient,
% accuracy controlled trapezoidal rule. 
% SHORT: computes the sum Im_hat then we use this later on outside this
% function to compare with actual integration value and get the
% approximated integral Im, by multiplying Im_hat by (b-a)/2^m
function Im_est = trapezoidStep(f, a, b, m)

    if m == 0
        Im_est = (1/2)*(f(a) + f(b));
    else
        numNewVals = 2^(m - 1); % Number of new function values
        interval = (b-a)/numNewVals; % associated mesh spacing.
        x = a + (1/2)*interval; %starting half step in front of a;
        
        Im_est = 0; % initialize the sum. 
        for i = 1:numNewVals
            Im_est = Im_est + f(x);
            x = x + interval;
        end
    end
end