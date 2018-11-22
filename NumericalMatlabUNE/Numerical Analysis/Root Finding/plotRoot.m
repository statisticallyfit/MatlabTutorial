% Function to plot an equation (f), given the upper and lower limits xL,
% xR. 
% xSol = the root of the equation f, between xL and xR. 
function plotRoot(f, a, b)
    %%% Generating data for the curve  
    % finding all the roots to plot on the graph. 
    xSols = getIntervalRoots(f, a, b);
    ySols = zeros(1, length(xSols));
    
    %setting limits for data
    xs = a : 0.01 : b; 
    fs = f(xs); 
    xLimits = [a, b];
    yLimits = [min(fs), max(fs)];   
    
    figure(1); clf; hold on; grid on; grid minor

    % Plotting the axes
    plot([0, 0], yLimits, 'k-', 'LineWidth',2); % y-axis
    plot(xLimits, [0 0], 'k-', 'LineWidth',2); % x-axis
    axis([xLimits, yLimits])

    % Plotting the curve
    plot(xs, fs, 'LineWidth', 3);
    
    % Plot the root point
    plot(xSols, ySols, 'r.', 'MarkerSize', 20);
end