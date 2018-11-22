% How to plot functions

%% ezplot
syms x
f = [1 4 -7 -10];
f = poly2sym(f, x)
ezplot(f, -1, 3) % f with the x-axis limits

%% plot3
t = 0:pi/50:10*pi;
st = sin(t);
ct = cos(t);

figure
plot3(st,ct,t)

%% surf and mesh
x = -2:0.1:2; y = -1:0.1:2;
[X, Y] = meshgrid(x,y);
Z = Y.* exp(-(X.^2 + Y.^2));
subplot(2,1,1), mesh(X, Y, Z), title('Mesh Plot'),... 
    xlabel('x'), ylabel('y'), zlabel('z'), 
subplot(2,1,2), surf(X, Y, Z), title('Surface Plot'),...
    xlabel('x'), ylabel('y'), zlabel('z')
hold on
alpha 0.2