function [n, h, S] = getPrism()
    % Prompts user for n = num sides, 
    % h = height of prism, and S = length of sides. 
    
    
    
    n = input('Enter the number of prism sides: ');
    while ~isnumeric(n) || ~isscalar(n) || (int32(n) ~= n) || n < 3
        disp('Invalid! The number of sides must be a positive integer!')
        n = input('Enter the number no less than 3: ');
    end
    
    h = input('Enter the prism height: ');
    while ~isnumeric(h) || ~isscalar(h) ||  h < 0
        disp('Invalid! The height should be a positive number.')
        h = input('Enter the prism height: ');
    end
    
    S = input('Enter the length of the sides: ');
    while ~isnumeric(S) || ~isscalar(S) || S < 0
        disp('Invalid! The side lengths should be a positive number.')
        S = input('Enter the length of the sides: ');
    end
    
end