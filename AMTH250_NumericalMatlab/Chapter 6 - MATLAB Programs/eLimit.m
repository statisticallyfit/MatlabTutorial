function eLimit()
% Returns approximation of e using a limit

    % Call subfunction to prompt user for n
    n = askForN();
    fprintf('An approximation of e with n = %d is %.5f\n', ...
        n, (1 + 1/n) ^ n)
end



function n = askForN()
    inputNum = input('Enter a positive integer for n: ');
    intNum = int32(inputNum);
    
    while ~isnumeric(inputNum) || intNum ~= inputNum || intNum < 0
        inputNum = input('Invalid! Enter a positive integer: ');
        intNum = int32(inputNum);
    end
    
    n = inputNum;
end