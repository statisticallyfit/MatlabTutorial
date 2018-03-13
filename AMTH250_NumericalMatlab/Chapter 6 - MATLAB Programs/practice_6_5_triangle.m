% Practice 6.5


% 1. Prompts user for hypotenuse and angle (radians)
% 2. Calls function to calculate the lengths of sides and and b
% 3. Calls function to print out all values in sentence format. 

% Scripting part
% 1. enter the input
[hypot, angle] = readHypotenuseAndAngle();
% 2. calculate
[a, b] = calculateSideLengths(hypot, angle);
% 3. print
printSidesAndHypotenuse(a, b, hypot, angle);


% ------------------------------
function [hypot, angle] = readHypotenuseAndAngle()
    hypot = input('Enter the length of hypotenuse of the triangle: ');
    while ~isnumeric(hypot) || hypot < 0
        hypot = input('Invalid. Hypotenuse length is a positive number: ');
    end
    
    angle = input('Enter the angle (in radians, between sides a and c) of the triangle: ');
    while ~isnumeric(angle) 
        angle = input('Invalid. Angle must be a number: ');
    end
end

% calculate - note: side c = hypotenuse.
function [a, b] = calculateSideLengths(hypotenuse, angleBetweenAandC)
    a = hypotenuse * cos(angleBetweenAandC);
    b = hypotenuse * sin(angleBetweenAandC);
end


% print
function printSidesAndHypotenuse(a, b, hypotenuse, angle)
    fprintf('For a right triangle with hypotenuse %.5f\n', hypotenuse)
    fprintf('and an angle %.5f between side ''a'' and the hypotenuse,\n', angle)
    fprintf('side ''a'' = %.5f and side ''b'' = %.5f.\n', a, b)
end