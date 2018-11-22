% xdata, ydata = the original xs, ys to interpolate
% which = a vector containing numbers between 1 and n for which lagrange polynomial to
% plot. If this argument is not given, we plot all (n) lagrange
% polynomials, where n = length(xData). 
function plotLagranges(xData, which)

    %Creating the numeric lagrange polynomials
    n = length(xData);
    
    if nargin == 1 && ~isempty(xData) % then which is not supplied
        which = 1:n;
    end
    
    for k = which
        xx = linspace(0.9*xData(1),1.1*xData(end),100);
        ll = ones(1,length(xx)); % holds the lagrange numeric polynomials
        
        for i = 1:k-1
            ll = ll .* (xx - xData(i)) / ( xData(k)-xData(i) );
        end %skipping the kth xData in the numerator. 
        for i = k+1:n
            ll = ll .* ( xx-xData(i) ) / ( xData(k)-xData(i) );
        end
        z = zeros(1,n);
        % lagrange poly is zero for other x-vals other than the one we are on. 
        % so if this is the kth Lagrange poly, then at x(k) Lk(x(k)) = 1 and  0
        % for any other k. 
        z(k) = 1;
        
        % Plotting the numeric lagrange poly
       % clf; hold on; grid on; grid minor %% if using the saveas png
       % method
        
        % num cols =2 so num rows is always ceil(n/cols)
        %nCols = 2;
        %nRows = ceil(n / nCols);
        figure(k); clf; hold on; grid on; grid minor
        %subplot(nRows, nCols, k) % the kth subplot
        
        lp = plot(xx,ll,'k','lineWidth',2); % plotting the lagrange poly
        axis([min(xx) max(xx) min(ll) max(ll)])
        plot([min(xx) max(xx)], [0 0], 'k-') % x-axis
        
        % Plotting the dots. 
        dp = plot(xData, z,'.r','MarkerSize',25) ;

        xlabel('$x$','Interpreter','latex','FontSize',32)
        ylabel('$L_' + string(k) + '(x)$','Interpreter','latex','FontSize',32)
        legend([dp, lp], {'Data', 'Lagrange Polynomial'}, 'Location', 'Best')
        
        %saveas(gcf, "L" + string(k) + ".png")
        
        hold off
        
    end 
end