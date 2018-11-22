%% How to solve system of linear equations

%% System of Linear Equation Method
%% method 1
x = sym('x'), y = sym('y'), z = sym('z');
[x y z] = solve('x+y-z=4', 'x-2*y+3*z=-6', '2*x+3*y+z=7')

[x y] = solve('x+y-z=4','x-2*y+3*z=-6','x,y') % to answer in terms of x and y
[x z] = solve('x+y-z=4','x-2*y+3*z=-6','x,z') % in terms of x and z

%% method 2
syms x y z
eqn1 = 2*x + y + z == 2;
eqn2 = -x + y - z == 3;
eqn3 = x + 2*y + 3*z == -10;
[A, b] = equationsToMatrix([eqn1, eqn2, eqn3], [x,y,z]);
X = linsolve(A, b)


%% Inverse Matrix Method
A = sym([3 2 -1; -1 3 2; 1 -1 -1]);
b = sym([10; 5; -1]);
x = A\b
