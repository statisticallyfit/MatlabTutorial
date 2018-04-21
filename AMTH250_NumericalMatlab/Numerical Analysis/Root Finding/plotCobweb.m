
% Cobweb plot for a g function

% g = lipshutz function
% x = accumulated vector of xs in the estimation process of the fixed point
% iteration. Last element is xSol, first is x0, and last xSol is correct to
% p decimal places, so no need to pass in p here again. 
function plotCobweb(g, x)
    

    % xs is basically x vec but just elongating it a little at the edges. 
    xs = linspace(min([x, g(x)]) - 0.1, max([x, g(x)]) + 0.1, 1000);
    gs = g(xs);
    %gs = g(xs); % note g must be vectorized. 
    
   % close all;
    figure(1); clf; hold on; grid on; grid minor
    
    % showing where they intersect
    plot(xs, gs, 'b', 'LineWidth', 2) % plot the y = g(x) function
    plot(xs, xs, 'r--', 'LineWidth', 2) % plot  the y = x function
    
    % plotting y and x-axes
    xmin = min([xs, gs]) - 0.05;
    xmax = max([xs, gs]) + 0.05;
    ymin = min([gs xs]) - 0.05;
    ymax = max([gs xs]) + 0.05;
    plot([0 0], [ymin ymax], 'k-', 'LineWidth', 3)
    plot([xmin xmax], [0 0], 'k-', 'LineWidth', 3)
    
    xlabel('x')
    ylabel('g(x) and x-line')
    sg = func2str(g);
    title(['Cobweb Plot of g(x) = ', sg(5:end), ' and y = x'])
    
   
    % NOTE: we could just use xVec instead of generating the same one in
    % xVecNew all over again, but it is useful to see the process. 
    
    for n = 1:length(x)-1 % length(x) is nmax, where last elem is correct to p decimals
        %xx(n+1) = g(xx(n)); 
        
        plot([x(n) x(n)], [x(n) x(n+1)], 'k', 'LineWidth', 1.5)
        axis([xmin xmax ymin ymax])
        pause(0.1)
        
        plot([x(n) x(n+1)], [x(n+1) x(n+1)], 'k--', 'LineWidth', 1.5)
        axis([xmin xmax ymin ymax])
        pause(0.1)
    end
    
end