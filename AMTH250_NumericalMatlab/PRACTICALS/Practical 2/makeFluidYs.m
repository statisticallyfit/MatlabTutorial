function [xs, ys] = makeFluidYs(xs, force, constants)
% Returns y-values, after passing the perturbation formula y
% the force, and fluidData constants for a fluid. 
    a = constants(1);
    b = constants(2);
    
    % This is the fluid formula!
    y = @(x, F, a, b) F * exp(-a*x) .* sin(b*x);
    
    % Make the y values
    ys = y(xs, force, a, b);
    
end