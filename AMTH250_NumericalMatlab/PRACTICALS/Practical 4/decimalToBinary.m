% input something like 25.1235 to convert to binary
function bits = decimalToBinary(decimalNum)
    bits = '';
    if decimalNum < 0
        bits = ['-', bits];
    end
    decimalNum = abs(decimalNum);
    
    % convert the whole part
    num = decimalNum;
    while num > 0
        if mod(num, 2) == 1
            bits = [bits,  '1'];
        else 
            bits = [bits, '0'];
        end
        num = floor(num/2);
    end
    
    bits = fliplr(bits);
    
    
    % Convert the fractional part (stopping at 52 bits)
    if decimalNum == fix(decimalNum) % exit if we were given a whole number
        return;
    end
    
    bits = [bits, '.'];
    limit = 1;
    frac = decimalNum - fix(decimalNum);
    while limit <= 52
        frac = frac*2;
        if frac >= 1
            bits = [bits, '1'];
            frac = frac - 1;
        else 
            bits = [bits, '0'];
        end
        limit = limit + 1;
    end
    
end