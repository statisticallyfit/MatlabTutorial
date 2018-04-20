
function temp(gfunc, x0)

    %close all;clear all;clc

    xx = linspace(min([x0 0.739084762857556309967321794829]) - 0.1, max([x0 0.739084762857556309967321794829]) + 0.1, 1000);
    gx = gfunc(xx); % g(x) is defined in the function file gfunc.m 

    figure(1);clf;hold on;
    plot(xx,gx,'b','Linewidth',2);
    plot(xx,xx,'r','LineWidth',2);
    axis equal;
    grid on; grid minor

    x(1) = x0;

    nmax = 50;
    for n = 1:nmax    
        x(n+1) = gfunc(x(n));
        plot([x(n) x(n)],[x(n) x(n+1)],'k','LineWidth',2)
        pause(0.1) %pause for 0.1 seconds
        plot([x(n) x(n+1)],[x(n+1) x(n+1)],'k--','LineWidth',2)
        pause(0.1)
        if abs(x(n+1)-x(n))<0.5e-6
            break
        end
    end


    fprintf('Solution after %3i iterations = %10.6f\n',n,x(n+1))

end