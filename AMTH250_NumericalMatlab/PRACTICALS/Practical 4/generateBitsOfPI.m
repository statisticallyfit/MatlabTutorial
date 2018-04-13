
% Generates the first numBits of PI constant
% RETURN: array bits that holds 1s and 0s of the bits of PI, starting with
% the bits for 3. 

%fprintf('The first 15 bits of %.15f are = ', generateBitsOfPI(15))


function bitsString = generateBitsOfPI(numBits)
    
    bitsString = ['11.', blanks(numBits - 2)];
    
    % generating decimal part: e.g, 0.141592653589793
    fracPart = pi - 3; 
    
    for ii = 4:(numBits+1) % going one step ahead because of '.' in bits string
        fracPart = fracPart * 2;
        
        if fracPart >= 1
            bitsString(ii) = '1';
            fracPart = fracPart - 1;
        else
            bitsString(ii) = '0';
            % and frac does not need to be subtracted by 1. 
        end
    end
end