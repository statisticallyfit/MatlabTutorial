function radius = readRadius()
% Asks the user for the radius of a circle (ignoring error checking)
    disp('When prompted, please enter the radius in inches.')
    radius = input('Enter the radius: ');
    
    while ~isnumeric(radius) || radius < 0
        radius = input('Radius must be a positive number. Enter again: ');
    end
end

