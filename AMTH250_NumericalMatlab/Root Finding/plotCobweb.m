
% Cobweb plot for a g function

% x0 = value close to xSol
% g = lipshutz function
% nMax = max iterations
% p = number of correct decimals
function plotCobweb(g, x)
    
    % Max number of iteration steps (so that solution is within p decimal
    % places)
    %nMax = round(log(2 * 10^p) / log(2));
    x0 = x(1);
    %xSol = xVec(nMax + 1);
    
    xs = linspace(min(x) - 0.1, max(x) + 0.1, 1000);
    gs = g(xs); % note g must be vectorized. 
    
    figure(3); clf; hold on
    
    % showing where they intersect
    plot(xs, gs, 'b', 'LineWidth', 2) % plot the y = g(x) function
    plot(xs, xs, 'r--', 'LineWidth', 2) % plot  the y = x function
    
    % making the x-limits to be around the cobweb so we can see it
    %xlower = min([xs, x0]) - 0.01; 
    %[ ~, idx] = min(abs(g(x0) - xs));
    %xupper = xs(idx) + 0.01; % add 0.1 for the width to leave some elbow room.
    
    %ylower = min([gs, xlower]) - 0.01;
    %yupper = max([gs, xupper]) + 0.01;
    %fprintf('%d %d %d %d\n', xlower, xupper, ylower, yupper)
    
    % plotting y and x-axes
    %fprintf('%d %d %d %d\n', min(xs), max(xs), min(gs), max(gs))
    plot([0 0], [min(gs) max(gs)], 'k-', 'LineWidth', 3)
    plot([min(xs) max(xs)], [0 0], 'k-', 'LineWidth', 3)
    axis([min(xs) max(xs) min(gs) max(gs)])
    
    grid on; grid minor
    
    xlabel('x')
    ylabel('g(x) and x-line')
    
    
    
    % Plotting the cobweb part
   % xx = zeros(nMax + 1, 1); 
    %xx(1) = x0; % initial vector
    
    
    % NOTE: we could just use xVec instead of generating the same one in
    % xVecNew all over again, but it is useful to see the process. 
    
    for n = 1:length(x) % length(x) is nmax, where last elem is correct to p decimals
    
        %xx(n+1) = g(xx(n)); 
        
        plot([x(n) x(n)], [x(n) x(n+1)], 'k', 'LineWidth', 1.5)
        pause(0.1)
        plot([x(n) x(n+1)], [x(n+1) x(n+1)], 'k--', 'LineWidth', 1.5)
        pause(0.1)
        
        %if abs(x(n+1) - x(n)) < 0.5 * 10^(-p)
        %    break
        %end
       
    end
    
    fprintf('n = %d, solution = %.30f\n', n, x(n+1))
    
end