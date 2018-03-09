function theType = argumentType(arg)
    % Returns the type of the argument - scalar, row vec, col vec, or
    % matrix. 
    [r c] = size(arg);
    
    if r == 1 && c == 1
        theType = 'scalar';
    elseif r == 1 && c ~= 1
        theType = 'row vector';
    elseif r ~= 1 && c == 1
        theType = 'column vector';
    else
        theType = 'matrix';
    end
end