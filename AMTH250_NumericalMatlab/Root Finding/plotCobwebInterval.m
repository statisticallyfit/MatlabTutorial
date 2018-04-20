function plotCobwebInterval(g, xL, xR, x0)
        
    xs = linspace(xL, xR,1000);
    strG = func2str(g);
    gs = g(xs);

    close all; figure(1); clf;
    hold on; grid on; grid minor
    plot(xs, xs, 'r--', 'LineWidth',2);
    plot(xs, gs, 'b-', 'LineWidth',2);

    title(['y = x and g(x) = ', strG(5:end)]);

    % axes
    plot([0 0], [xL xR], 'k-', 'LineWidth',3)
    plot([xL xR], [0 0], 'k-', 'LineWidth',3)

    % Now doing cobweb
    x(1) = x0;
    nmax = 60;

    for n = 1:nmax
        x(n+1) = g(x(n));
        %fprintf('x(n) = %.6f\n', x(n))
        plot([x(n) x(n)], [x(n) x(n+1)], 'k', 'LineWidth', 2)
        pause(0.1)

        plot([x(n) x(n+1)], [x(n+1) x(n+1)],'k--', 'LineWidth', 2)
        pause(0.1)
        
        axis equal
        axis([xL xR xL xR])

        % we do not expect this to be true here
        % because no convergence in this casea.
        if abs(x(n+1) - x(n)) < 0.5e-6
            break
        end
    end
    
    fprintf('n iterations = %d, end result = %10.6f\n', n, x(n+1))

    axis equal
    axis([xL xR xL xR])

    legend('y = x', 'y = g(x)', 'Location', 'Best') % must put last else too many lines added to plto
    % if you add plots after the legend
    
end