% Question 1
% A function to return the real zeros of the quadratic equation
% that has the form: ax^2 + bx + c = 0

function [x1, x2] = findRoots(a, b, c)
% a, b, c are (assuming real) coefficients that correspond to the 
% coefficients in the quadratic equation: ax^2 + bx + c = 0
% Returns: the two x-intercepts, x1 and x2. 
% Prints: a message corresponding to each case. 
    
    % initialize the roots to be NaNs
    x1 = NaN;
    x2 = NaN;
    
    % evaluate discriminant
    discr = b^2 - 4*a*c;
    
    %
    if discr < 0
        disp('The equation has no real zeros.')
    elseif discr == 0
        disp('The equation has a single zero.')
        x1 = -b / (2 * a);
    else %discr > 0
        disp('The equation has two distinct zeros.')
        x1 = (-b + sqrt(discr))/(2*a);
        x2 = (-b - sqrt(discr))/(2*a);
    end
    
end