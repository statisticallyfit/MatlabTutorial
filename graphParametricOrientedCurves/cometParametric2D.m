%% Graphing parametrics 2D with orientation (comet())

function cometParametric2D(x, y, axesVector)

%comet(x, y)
grid
axis(axesVector)

xMin = axesVector(1);
xMax = axesVector(2);
yMin = axesVector(3);
yMax = axesVector(4);

line([xMin xMax], [0 0]) % x axis
line([0 0], [yMin yMax]) % y axis
comet(x,y)