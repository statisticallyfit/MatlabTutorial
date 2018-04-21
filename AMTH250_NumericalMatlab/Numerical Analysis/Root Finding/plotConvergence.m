
function plotConvergence(xVec)

    figure(3); clf; hold on; grid on; grid minor
    
    % plotting iterations against x. 
    plot(1:length(xVec), xVec, 'r-o', 'LineWidth', 2);
    xlabel('n (iteration number)');
    ylabel('x_n');
    title(['Convergence of Root Finding'])
    
end