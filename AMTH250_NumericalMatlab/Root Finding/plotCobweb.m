
% Cobweb plot for a g function

% x0 = value close to xSol
% g = lipshutz function
% nMax = max iterations
% p = number of correct decimals
function plotCobweb(g, x0, xSol, p)
    
    %a = x0 - 1;
    %b = x0 + 1;
    xs = linspace(xSol - 0.1, xSol + 0.1, 1000);
    gs = g(xs); % note g must be vectorized. 
    
    figure(3); clf; hold on
    
    plot(xs, gs, 'b')
    plot(xs, xs, 'r--')
    
    % making the x-limits to be around the cobweb so we can see it
    %xlower = x0 - 0.1;
    %[ ~, idx] = min(abs(g(x0) - xs));
    %xupper = xs(idx) + 0.1; % add 0.1 for the width to leave some elbow room.
    %ylower = x0 - 0.1; %min(gs); %min([gs, xlower]);
    %yupper = g(x0) + 0.1; %max(gs); %max([gs, xupper]);
    %fprintf('%d %d %d %d\n', xlower, xupper, ylower, yupper)
    
    % plotting y and x-axes
    %fprintf('%d %d %d %d\n', min(xs), max(xs), min(gs), max(gs))
    plot([0 0], [min(xs), max(xs)], 'k-')
    plot([min(xs), max(xs)], [0 0], 'k-')
    axis([min(xs) max(xs) min(xs) max(xs)])
    
    %plot([0 0], [ylower, yupper], 'k-')
    %plot([xlower, xupper], [0 0], 'k-')
    
    %axis([min([xlower xupper]), max([xlower xupper]), min([ylower yupper]) max([ylower yupper]) ])
    
    grid on; grid minor
    
    xlabel('x')
    ylabel('g(x) and x-line')
    
    
    % Max number of iteration steps
    nMax = round(log(2 * 10^p) / log(2));
    
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
    
    fprintf('n = %d, nMax = %d, solution = %.30f\n', n, nMax, x(n+1))
    
end