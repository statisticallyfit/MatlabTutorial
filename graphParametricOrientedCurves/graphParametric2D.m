%% Program to graph a parametric curve in 2D
% must do t value calculation beforehand
% x = list of values from x part
% y = list of values from y part
% axesVector = contains xMin, xMax, yMin, yMax

function graphParametric2D(x, y, axesVector)

plot(x, y)
grid
axis(axesVector)

xMin = axesVector(1);
xMax = axesVector(2);
yMin = axesVector(3);
yMax = axesVector(4);

line([xMin xMax], [0 0]) % x axis
line([0 0], [yMin yMax]) % y axis
