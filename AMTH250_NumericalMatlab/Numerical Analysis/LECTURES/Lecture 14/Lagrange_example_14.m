close all;clear all;
%Enter data
x=[1 1.3 1.6 1.9 2.2];
y=[0.1411 -0.6878 -0.9962 -0.5507 0.3115];

n=length(x);

%Value of x where y is to be estimated
xinterp=1.5;

% We plot the Lagrange polynomials for the given x-values
for k = 1:n
    xx = linspace(0.9*x(1),1.1*x(end),100);
    yy = ones(1,length(xx));
    for i = 1:k-1
        yy = yy .* (xx - x(i)) / ( x(k)-x(i) );
    end
    for i = k+1:n
        yy = yy .* ( xx-x(i) ) / ( x(k)-x(i) );
    end
    z = zeros(1,n);
    z(k) = 1;
    plot(xx,yy,'k','lineWidth',1.5)
    axis([0.9 2.3 -.6 1.5])
    hold on
    plot(x,z,'.r','MarkerSize',16)
    xlabel('$x$','Interpreter','latex','FontSize',32)
    ylabel('$L_' + string(k) + '(x)$','Interpreter','latex','FontSize',32)
    box on
    grid on   
    saveas(gcf,"L" + string(k) + ".png") 
    hold off
end   

% We plot the Lagrange polynomial for the given data points
xx = 0:0.01:3;
yy = Lagrange(x,y,xx);
plot(xx,yy,'k','LineWidth',1.5)
axis([0 3 -1.1 1.1])
hold on
plot(xx,sin(3*xx),'--b')
plot(x,y,'.r','MarkerSize',16)
xlabel('$x$','Interpreter','latex','FontSize',24)
ylabel('$y$','Interpreter','latex','FontSize',24)
legend({'$P_4(x)$','$\sin(3x)$'},'Interpreter','latex','Location','North','FontSize',18)
box on
grid on
saveas(gcf,"Lagrange_example.png")
hold off

yinterp = Lagrange(x,y,xinterp);

fprintf('The estimate of y(%4.2f) = %7.5f \n',xinterp,yinterp)        

[P,R,S] = lagrangepoly(x,y);
g = sprintf('%d ',P);
fprintf('The coefficients of the Lagrange polynomial are: %s\n',g)