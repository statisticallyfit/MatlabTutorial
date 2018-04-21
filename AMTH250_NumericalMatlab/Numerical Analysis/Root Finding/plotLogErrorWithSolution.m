% x = all xs from iterations
% xSol = real x solution we give ourselves so that we can get more accurate
% plot. 
function plotLogErrorWithSolution(x, xSol)
    absError = abs(xSol - x);
    logError = log(absError);
    
    figure(5); clf; hold on; grid on; grid minor
    plot(logError(1:end-1), logError(2:end), 'r.', 'MarkerSize', 12)
    
    xlabel('$\log|\varepsilon_{n}|$', 'Interpreter', 'latex')
    ylabel('$\log|\varepsilon_{n+1}|$','Interpreter','latex')
    
    % slope estimates of the plotted line (from top to bottom or right to
    % left on plot)
    errorSlopeEstimates = diff(logError(2:end)) ./ diff(logError(1:end-1));
    fprintf('log error slopes = \n')
    disp(errorSlopeEstimates')
end