
% part a)
f = @(x) cos(2 * x);
x = [0 0.2 0.4 0.6 0.8 1];
y = f(x);

% part c) -------------------------------------
syms x; 
L3 = vpa(expand((x - 0)*(x - 0.2)*(x - 0.6)*(x - 0.8)*(x - 1)./((0.4-0)*(0.4-0.2)*(0.4-0.6)*(0.4-0.8)*(0.4-1))), 7);
% L3 is the expanded polynomial with degree 5

% Another way: 
x = [0 0.2 0.4 0.6 0.8 1];
y = f(x);
[~, Ls] = interpLagrange(x, y); % calculating the symbolic polynomial and lagrange polynomials. 
L3_myfunc = vpa(Ls(3), 7);

% check that the hand-writtend L3(x) lagrange polynomial is equal to the
% one made from my function. 
disp('L3 = '); disp(L3);
disp('L3_myfunc = '); disp(L3_myfunc)
fprintf('The two methods yield same results: %d\n', isequal(L3_myfunc, L3))


% Now plot the third lagrange polynomial over [0, 1]
plotLagranges(x, 0, 1, 3) % which = 3 for third L3(x), and interval = 0, 1 and x = data
