% xdata, ydata = the original xs, ys to interpolate
% which = a vector containing numbers between 1 and n for which lagrange polynomial to
% plot. If this argument is not given, we plot all (n) lagrange
% polynomials, where n = length(xData). 
% a, b = the interval given to plot the Lagrange polynomials, where a < b. 
function plotLagranges(xData, a, b, which)

    %Creating the numeric lagrange polynomials
    n = length(xData);
    
    if nargin == 1 && ~isempty(xData) % then which vector is not supplied.
        which = 1:n;
    end
    
    for k = which
        xx = a : 0.01: b; %linspace(0.9*xData(1),1.1*xData(end),100);
        ll = ones(1,length(xx)); % holds the lagrange numeric polynomials
        
        for i = 1:k-1
            ll = ll .* (xx - xData(i)) / ( xData(k)-xData(i) );
        end %skipping the kth xData in the numerator. 
        for i = k+1:n
            ll = ll .* ( xx-xData(i) ) / ( xData(k)-xData(i) );
        end
        z = zeros(1,n);
        % lagrange poly is zero for other x-values other than the one we are on. 
        % so if this is the kth Lagrange poly, then at x(k) we have Lk(x(k)) = 1 and  
        % we have Lk(x(k)) = 0 for any other k. 
        z(k) = 1;
        
        
       % clf; hold on; grid on; grid minor %% if using the saveas png
       % method
       
        % Plotting the numeric lagrange poly
        figure(k); clf; hold on; grid on; grid minor
        
        lp = plot(xx,ll,'k','lineWidth',2); % plotting the lagrange poly
        axis([min(xx) max(xx) min(ll) max(ll)])
        plot([min(xx) max(xx)], [0 0], 'k-') % x-axis
        
        % Plotting the dots. 
        dp = plot(xData, z,'.r','MarkerSize',25) ;

        xlabel('$x$','Interpreter','latex','FontSize',32)
        ylabel('$L_' + string(k) + '(x)$','Interpreter','latex','FontSize',32)
        legend([lp], {'Lagrange Polynomial'}, 'Location', 'Best')
        
        hold off
        
    end 
end