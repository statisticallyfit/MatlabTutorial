function logResult = whatIs(vec)
% What does this function do (loops until finds nonzero element and returns
% true else returns the false)
    logResult = false;
    i = 1;
    
    while i <= length(vec) && logResult == false
        if vec(i) ~= 0
            logResult = true; 
        end
        i = i + 1;
    end
    
end