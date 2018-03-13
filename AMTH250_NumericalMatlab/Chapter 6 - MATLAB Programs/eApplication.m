% This script explores e and the exponential function

% Call a function display a menu and get a choice
choice = eOption();

% Choice 4 is to exit the program
while choice ~= 4
    switch choice
        case 1
            % Explain E
            eExplain();
        case 2
            % Approximate e using a limit
            eLimit();
        case 3
            % Approximate exp(x) using Maclaurin and compare to exp
            x = input('Please enter a value for x: ');
            expFn(x);
    end
    % Display the menu again and get user's choice
    choice = eOption();
end