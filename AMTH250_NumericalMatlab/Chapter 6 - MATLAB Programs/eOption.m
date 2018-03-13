function choice = eOption()
% Prints a menu of options and error checks until user chooses one
    printChoices();
    choice = input('');
    
    while ~isnumeric(choice) || ~any(choice == 1:4)
        disp('Error - please choose one of the options.')
        printChoices()
        choice = input('');
    end
end


function printChoices()
    fprintf('Please choose an option:\n\n');
    fprintf('1) Explanation\n')
    fprintf('2) Limit\n')
    fprintf('3) Exponential function\n')
    fprintf('4) Exit program\n\n')
end
