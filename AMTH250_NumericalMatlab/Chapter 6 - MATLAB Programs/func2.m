function func2
    % declare the variable; allocating space but not initializing!
    % note - only ever need to declare variables in MATLAB if you want
    % persistence. 
    % NOTE: to restart persistent variables we say: 
    %   clear functions (to clear all persistent vars in all functions)
    %   clear functionName (to clear persistent vars ina specific function)
    persistent count  
    
    if isempty(count)
        count = 0;
    end
    
    count = count + 1;
    fprintf('The value inside of count is %d\n', count)
    
end
    