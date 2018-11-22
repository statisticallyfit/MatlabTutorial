% Generates the first numBits of EXP(1) constant
% RETURN: array bits that holds 1s and 0s of the bits of PI, starting with
% the bits for the integer part

function bitsString = generateBitsOfE(numBits)
    
    % bits for 2 (integer part of e = 2.71828) starting the array
    bitsString = ['10.', blanks(numBits - 2)];
    
    % generating decimal part: e.g, 0.141592653589793
    fracPart = exp(1) - 2; 
    
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