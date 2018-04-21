
% aInitial = initial lower part of interval
% bInitial = initial upper part of interval
% xSol = x root we want to plot

function plotRoot(f, xL, xR)
    %%% Generating data for the curve
    a = min([xL, xR]);
    b = max([xL, xR]);
    
    xSol = fzero(f, (a + b)/2);
    
    %setting limits for data
    %xLimits = [a-1, b+1];
    %if ceil(b-a) <= 0.5 % then they are small and need to change
    %    xLimits = [a - 10, b + 10];
    %end
    xLimits = [a, b];
    xs = linspace(xLimits(1), xLimits(2), 1000);
    fs = f(xs); 
    yLimits = [min(fs), max(fs)];
        
    
    
    figure(4); clf; hold on; grid on; grid minor

    % Plotting the axes
    plot([0, 0], yLimits, 'k-', 'LineWidth',2) % y-axis
    plot(xLimits, [0 0], 'k-', 'LineWidth',2) % x-axis
    axis([xLimits, yLimits])

    % Plotting the curve
    plot(xs, fs, 'LineWidth', 2)
    
    % Plot the root point
    plot(xSol, 0, '.', 'MarkerSize', 30, 'MarkerEdgeColor', 'red')
end