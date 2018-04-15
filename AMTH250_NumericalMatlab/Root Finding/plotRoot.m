
% aInitial = initial lower part of interval
% bInitial = initial upper part of interval
% xSol = x root we want to plot

function plotRoot(f, xSol, aInitial, bInitial)
    %%% Generating data for the curve
    xp = linspace(aInitial, bInitial, 1000);
    fp = f(xp); 
        
    figure(1); clf; hold on
    grid on; grid minor

    % Plotting the axes
    plot([0, 0], [min(fp), max(fp)], 'k-') % y-axis
    plot([aInitial-1, bInitial+1], [0 0], 'k-') % x-axis

    % Plotting the curve
    plot(xp, fp)
    
    % Plot the root point
    plot(xSol, 0, '.', 'MarkerSize', 30, 'MarkerEdgeColor', 'red')

    % setting the limits of the axes
    axis([aInitial-1, bInitial+1, min(fp), max(fp)])
end