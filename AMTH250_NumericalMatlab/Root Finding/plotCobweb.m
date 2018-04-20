
% Cobweb plot for a g function

% g = lipshutz function
% x = accumulated vector of xs in the estimation process of the fixed point
% iteration. Last element is xSol, first is x0, and last xSol is correct to
% p decimal places, so no need to pass in p here again. 
function plotCobweb(g, x)
    
    xs = linspace(min(x) - 0.1, max(x) + 0.1, 1000);
    gs = g(xs); % note g must be vectorized. 
    
    figure(3); clf; hold on
    
    % showing where they intersect
    plot(xs, gs, 'b', 'LineWidth', 2) % plot the y = g(x) function
    plot(xs, xs, 'r--', 'LineWidth', 2) % plot  the y = x function
    
    % plotting y and x-axes
    xmin = min(xs) - 0.05;
    xmax = max(xs) + 0.05;
    ymin = min([gs xs]) - 0.05;
    ymax = max([gs xs]) + 0.05;
    plot([0 0], [ymin ymax], 'k-', 'LineWidth', 3)
    plot([xmin xmax], [0 0], 'k-', 'LineWidth', 3)
    axis([xmin xmax ymin ymax])
    
    grid on; grid minor
    
    xlabel('x')
    ylabel('g(x) and x-line')
    
   
    % NOTE: we could just use xVec instead of generating the same one in
    % xVecNew all over again, but it is useful to see the process. 
    
    for n = 1:length(x)-1 % length(x) is nmax, where last elem is correct to p decimals
        %xx(n+1) = g(xx(n)); 
        
        plot([x(n) x(n)], [x(n) x(n+1)], 'k', 'LineWidth', 1.5)
        pause(0.1)
        plot([x(n) x(n+1)], [x(n+1) x(n+1)], 'k--', 'LineWidth', 1.5)
        pause(0.1)
    end
    
    fprintf('n = %d, solution = %.30f\n', n, x(n+1))
    
end