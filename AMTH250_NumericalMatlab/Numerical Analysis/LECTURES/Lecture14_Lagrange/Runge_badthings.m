close all;clear all;clc
x = linspace(-1,1,500);
y = 1./(1+25*x.^2);

x1 = linspace(-1,1,2);
y1 = 1./(1+25*x1.^2);
z1 = polyfit(x1,y1,1);

x2 = linspace(-1,1,4);
y2 = 1./(1+25*x2.^2);
z2 = polyfit(x2,y2,3);

x3 = linspace(-1,1,8); % 8 data points. 
y3 = 1./(1+25*x3.^2);
z3 = polyfit(x3,y3,7);

x4 = linspace(-1,1,16);
y4 = 1./(1+25*x4.^2);
z4 = polyfit(x4,y4,15);

x5 = linspace(-1,1,32); %32 data points
y5 = 1./(1+25*x5.^2);
z5 = polyfit(x5,y5,31);

xinterp= -1:0.005:1;
yinterp_1=polyval(z1,xinterp);
yinterp_2=polyval(z2,xinterp);
yinterp_3=polyval(z3,xinterp);
yinterp_4=polyval(z4,xinterp);
yinterp_5=polyval(z5,xinterp);

clf; hold on
plot(x,y,'k','LineWidth',1.5)
%plot(x,y,'ro','MarkerFaceColor','r')
xlabel('$x$','Interpreter','latex','FontSize',16)
ylabel('$y$','Interpreter','latex','FontSize',16)
box on
axis equal
axis([-1 1 -0.5 1])
grid on
saveas(gcf,"runge_function.png")

clf; hold on
plot(x,y,'k','LineWidth',1.5)
plot(x1,y1,'bo','MarkerFaceColor','b')
plot(xinterp,yinterp_1,'b','LineWidth',1.5)
xlabel('$x$','Interpreter','latex','FontSize',16)
ylabel('$y$','Interpreter','latex','FontSize',16)
box on
axis equal
axis([-1 1 -0.5 1])
grid on
saveas(gcf,"runge_interp_2.png")

clf; hold on
plot(x,y,'k','LineWidth',1.5)
plot(x2,y2,'bo','MarkerFaceColor','b')
plot(xinterp,yinterp_2,'b','LineWidth',1.5)
xlabel('$x$','Interpreter','latex','FontSize',16)
ylabel('$y$','Interpreter','latex','FontSize',16)
box on
axis equal
axis([-1 1 -0.5 1])
grid on
saveas(gcf,"runge_interp_4.png")

clf; hold on
plot(x,y,'k','LineWidth',1.5)
plot(x3,y3,'bo','MarkerFaceColor','b')
plot(xinterp,yinterp_3,'b','LineWidth',1.5)
xlabel('$x$','Interpreter','latex','FontSize',16)
ylabel('$y$','Interpreter','latex','FontSize',16)
box on
axis equal
axis([-1 1 -0.5 1])
grid on
saveas(gcf,"runge_interp_8.png")

clf; hold on
plot(x,y,'k','LineWidth',1.5)
plot(x4,y4,'bo','MarkerFaceColor','b')
plot(xinterp,yinterp_4,'b','LineWidth',1.5)
xlabel('$x$','Interpreter','latex','FontSize',16)
ylabel('$y$','Interpreter','latex','FontSize',16)
box on
axis equal
axis([-1 1 -0.5 2.5])
grid on
daspect([0.5 1 1])
saveas(gcf,"runge_interp_16.png")

clf; hold on
plot(x,y,'k','LineWidth',1.5)
plot(x5,y5,'bo','MarkerFaceColor','b')
plot(xinterp,yinterp_5,'b','LineWidth',1.5)
xlabel('$x$','Interpreter','latex','FontSize',16)
ylabel('$y$','Interpreter','latex','FontSize',16)
box on
axis equal
axis([-1 1 -2 4])
grid on
daspect([0.25 1 1])
saveas(gcf,"runge_interp_32.png")



