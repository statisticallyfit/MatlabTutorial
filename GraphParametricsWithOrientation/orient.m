% function to draw velocity tangets on 2D parametric curve

function orient(tVals, x, y, axesVector)
x = str2func(x);
y = str2func(y);

% first graph the equations
xVals = subs(x, tVals);
yVals = subs(y, tVals);
graphParametric2D(xVals, yVals, axesVector)

% do the derivatives
syms t
dxdt = diff(x, t);
dydt = diff(y, t);

% create value vectors
dxdtVals = subs(dxdt, tVals);
dydtVals = subs(dydt, tVals);

[txVals, tyVals] = normalizeVector(dxdtVals, dydtVals);

plotVectors(xVals,yVals, txVals,tyVals)

% ax.DataAspectRatio = [1 1 1];
