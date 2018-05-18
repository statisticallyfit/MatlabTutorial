% Question 1
% A function to return the real zeros of the quadratic equation
% that has the form: ax^2 + bx + c = 0

function theRoots = findRoots(a, b, c)
% a, b, c are (assuming real) coefficients that correspond to the 
% coefficients in the quadratic equation: ax^2 + bx + c = 0
% Returns: the two x-intercepts, x1 and x2. 
% Prints: a message corresponding to each case. 
    
    % initialize the roots to be NaNs
    %x1 = NaN;
    %x2 = NaN;
    
    % evaluate discriminant
    discr = b^2 - 4*a*c;
    
    %
    if discr < 0
        fprintf('The equation %.2f*x^2 + %.2f*x + %.2f = 0 has no real zeros.', a, b, c)
        theRoots = [];
    elseif discr == 0
        fprintf('The equation %.2f*x^2 + %.2f*x + %.2f = 0 has a single zero.', a, b, c)
        theRoots = [ -b / (2 * a)]; % don't need to place this in array, the single value
        % will automatically be interpreted as a single-element array. 
    else %discr > 0
        fprintf('The equation %.2f*x^2 + %.2f*x + %.2f = 0 has two distinct zeros.', a, b, c)
        theRoots = [(-b + sqrt(discr))/(2*a), (-b - sqrt(discr))/(2*a)];
    end
    
end

%MARK (4/4)