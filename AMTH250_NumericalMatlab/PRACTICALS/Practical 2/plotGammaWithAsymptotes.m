function plotGammaWithAsymptotes(xs, ys)
% Given the x-values of data and y-values, we find asymptotes
% and plot them. 
        
    yMin = min(ys); yMax = abs(yMin);
    xMin = min(xs); xMax = max(xs);
    asyms = getAsymptotes(xs, ys);
    
    % Plotting the main graph
    clf
    plot(xs, ys, 'g-')
    axis([xMin-1, xMax, yMin yMax])
    grid on
    hold on 
    
    % Now plotting asymptotes as dashed lines
    for i = 1:length(asyms)
        plot([asyms(i) asyms(i)], [yMin yMax], 'm--')
    end
end