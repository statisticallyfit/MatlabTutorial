% a, b, = interval f = function handle
function plotGraphAsymptotes(f, a, b, yMax)
    % get the asymptotes on the interval. 
    xs = a : 0.01: b;
    ys = f(xs);
    asymptotes = sort(xs(isinf(ys)));
    
    h = 0.000001;
    
    % constructing the intervals between the asymptotes and plotting them
    n = length(asymptotes);
    
    
    figure(1); clf; hold on; grid on; grid minor
    
    % plot between the intervals
    xsBefore = a : 0.01 : asymptotes(1) - h;
    plot(xsBefore, f(xsBefore), 'g-', 'linewidth', 2)
    xsAfter = asymptotes(n) + h: 0.01: b;
    plot(xsAfter, f(xsAfter), 'g-', 'linewidth', 2)
    % plot last asymptote
    plot([asymptotes(n), asymptotes(n)], [-yMax, yMax], 'm--', 'linewidth', 2)
    
    %indices = 1:n-1;
    %if isinf(f(a))
    %    indices = 2:n-1;
    %end
    for i = 1:n-1
        xsLegal = asymptotes(i) + h : 0.01 : asymptotes(i+1) - h;
        plot(xsLegal, f(xsLegal), 'g-', 'linewidth', 2)
        
        % plot asymptotes
        plot([asymptotes(i), asymptotes(i)], [-yMax, yMax], 'm--', 'linewidth', 2)
    end
    
    axis([a b -yMax, yMax])
    plot([0 0], [-yMax, yMax], 'k-')
    plot([a b], [0 0], 'k-')
    
end