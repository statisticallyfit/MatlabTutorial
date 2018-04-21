% Loop until user enters a positive number

inputNum = input('Enter a positive number: ');
while inputNum < 0
    fprintf('Invalid %d\n', inputNum)
    inputNum = input('You must enter a positive number: ');
end
fprintf('Thanks you entered a %.1f \n', inputNum)