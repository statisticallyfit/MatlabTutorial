
% Cobweb plot for a g function

% x0 = value close to xSol
% g = lipshutz function
% nMax = max iterations
% p = number of correct decimals
function plotCobweb(g, x0, p, nMax)
    
    %a = x0 - 1;
    %b = x0 + 1;
    xs = linspace(x0 - 1, x0 + 1, 1000);
    gs = g(xs); % note g must be vectorized. 
    
    figure(3); clf; hold on
    
    plot(xs, gs, 'b')
    plot(xs, xs, 'r--')
    
    % making the x-limits to be around the cobweb so we can see it
    xlower = x0 - 0.1;
    [ ~, idx] = min(abs(g(x0) - xs));
    xupper = xs(idx) + 0.1; % add 0.1 for the width to leave some elbow room.
    ylower = x0 - 0.1; %min(gs); %min([gs, xlower]);
    yupper = g(x0) + 0.1; %max(gs); %max([gs, xupper]);
    
    % plotting y and x-axes
    plot([0 0], [ylower, yupper], 'k-')
    plot([xlower, xupper], [0 0], 'k-')
    
    axis([xlower xupper, ylower yupper])
    
    grid on; grid minor
    
    xlabel('x')
    ylabel('g(x) and x-line')
    
    
    % Plotting the cobweb part
    x = zeros(nMax + 1, 1); 
    x(1) = x0; % initial vector
    
    for n = 1:nMax
    
        x(n+1) = g(x(n)); 
        
        plot([x(n) x(n)], [x(n) x(n+1)], 'k')
        pause(0.1)
        plot([x(n) x(n+1)], [x(n+1) x(n+1)], 'k--')
        pause(0.1)
        
        if abs(x(n+1) - x(n)) < 0.5 * 10^(-p)
            break
        end
       
    end
    
    fprintf('Solution after %d iterations is = %.30f\n', n, x(n+1))
    
end