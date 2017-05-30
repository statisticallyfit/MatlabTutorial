% How to draw a plane (like for system of linear equations)

%% method 1
x=-5:5; y=-3:3;
[X,Y]=meshgrid(x,y);
Z=(-1-X-2*Y)/3;
mesh(X,Y,Z)
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')
title('The graph of x + 2y + 3z + 1 = 0')
axis tight
grid on
view([150 30])

%%  method 2 with patch
% make the outer points of the figure
P1 = [1,-1,3];
P2 = [2,3,4];
P3 = [-5,6,7];method 2 (patch)

% Next, we create the normal vector to our plane by taking the 
% cross-product of two vectors parallel to the plane.
normal = cross(P1-P2, P1-P3);

% Next, we declare x, y, and z to be symbolic variables, 
% create a vector whose components represent the vector 
% from P1 to a typical point on the plane, and compute the dot 
% product of this vector with our normal.
syms x y z
P = [x,y,z];
planefunction = dot(normal, P-P1);

% The equation of our plane is now planefunction = 0. We remark 
% that the MATLAB's symbolic dot product assumes that the its 
% arguments may be complex and takes the complex conjugates of the 
% components of its first argument. To see the effect of this, we compute instead:
dot(P-P1, normal); 

% Since in this course we only want dot products of real-valued vectors, 
% it helps instead to define
realdot = @(P-P1, normal) (P-P1)*transpose(normal);

% look at lines and planes in matlab in evernote...

%% method 3 
syms x y
ezsurf(1-x-y)
view(-65, 65)
hold on
ezsurf((1-x+2*y)/3)
axis tight
axis square
alpha 0.3
hold off