
function plotConvergence(xVec, nMax)

    figure(2); clf; hold on;
    
    % plotting iterations against x. 
    plot(0:nMax, xVec, 'r-o', 'LineWidth', 2);
    xlabel('n (iteration number)');
    ylabel('x_n');
    grid on; grid minor
    
end