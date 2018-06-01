% ss = vector of approximated sum values over several iterations. 
% hs = vector of intervals that correspond to the sum values. 
function plotLogErrorIntegr(ss, hs, exactSum)
    absError = abs(ss - exactSum) ;
    logAbsError = log(absError);
    logH = log(hs);
    
    [tempLogAbsError, tempLogH] = cleanLogs(logAbsError, logH);
    
    % make coefficients of least squares regression line so that
    % we can see the slope of the log errors, which should be 2 since
    % trapezoidal rule has error bounded by const* h^2. 
    c = polyfit(tempLogH, tempLogAbsError, 1); 
    
    % Plotting
    figure(1); clf; hold on; grid on; grid minor
    
    % Add the log errors
    p1 = plot(logH, logAbsError, 'b.', 'MarkerSize', 30);
    % Add the least squares line
    p2 = plot(tempLogH, polyval(c, tempLogH), 'r-', 'LineWidth', 2);
    
    xlabel('$\log h$','Interpreter','latex', 'fontsize', 20)
    ylabel('$\log(|\textrm{error}|)$','Interpreter','latex', 'fontsize', 20)
    
    sign = 0;
    if c(2) > 0
        sign = 1;
    else % negative
        sign = -1;
        c(2) = abs(c(2));
    end
    legend([p1, p2], {'LogErrors', '$y = ' + string(c(1)) + 'x ' + string(sign) + string(c(2)) + '$'}, 'Location', 'Best', 'Interpreter', 'Latex', 'FontSize', 20)
    
end