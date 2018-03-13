function posNumMaybe = countNumberOfErrors()
% Prompt user and error check until he enters the positive number

% NOTE: if we say 'clear countNumberOfErrors' it clears the persistent vars
% inside the subfunction too!

    posNumMaybe = input('Enter a positive number: ');
    
    while ~isnumeric(posNumMaybe) || posNumMaybe < 0
        incrementErrors(posNumMaybe)
        posNumMaybe = input('Again!: ');
    end
end



function incrementErrors(posNumMaybe)
    persistent errCount
    
    if isempty(errCount)
        errCount = 0;
    end
    errCount = errCount + 1;
    
    fprintf('Error # %d. Does %.5f look like a positive number to you?\n', errCount, posNumMaybe)
end