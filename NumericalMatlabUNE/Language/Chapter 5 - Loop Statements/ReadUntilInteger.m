% Loops until you enter an integer

inputNum = input('Enter an integer: ');
convertedNum = int32(inputNum);

while inputNum ~= convertedNum
    inputNum = input('Invalid! Enter an integer: ');
    convertedNum = int32(inputNum);
end

fprintf('Thanks you entered a %d \n', inputNum)