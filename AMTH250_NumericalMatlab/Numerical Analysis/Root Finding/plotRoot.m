
% aInitial = initial lower part of interval
% bInitial = initial upper part of interval
% xSol = x root we want to plot

function plotRoot(f, xL, xR)
    %%% Generating data for the curve
    a = min([xL, xR]);
    b = max([xL, xR]);
    
    xSol = fzero(f, (a + b)/2);
    xp = linspace(a, b, 1000);
    fp = f(xp); 
        
    close all; figure(1); clf; hold on; grid on; grid minor

    % Plotting the axes
    plot([0, 0], [min(fp), max(fp)], 'k-', 'LineWidth',2) % y-axis
    plot([a-1, b+1], [0 0], 'k-', 'LineWidth',2) % x-axis

    % Plotting the curve
    plot(xp, fp, 'LineWidth', 2)
    
    % Plot the root point
    plot(xSol, 0, '.', 'MarkerSize', 30, 'MarkerEdgeColor', 'red')

    % setting the limits of the axes
    axis([a-1, b+1,min(fp), max(fp)])
end