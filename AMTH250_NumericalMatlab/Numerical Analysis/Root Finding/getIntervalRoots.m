% info source 1 (best): https://www.mathworks.com/help/symbolic/examples/solve-equations-in-returnconditions-mode.html
% info source 2 (the hard way): https://www.mathworks.com/help/symbolic/solve.html
function zeroes = getIntervalRoots(f, a, b)

    f = sym(f);
    x = symvar(f); 
    
    % This gives some finite solutions or a general formula to find some
    % more, if we have a case of infinite solutions like sin(x) == 0
    [zeroes, parameters, conditions] = solve([f == 0, x > a, x < b], 'ReturnConditions', true);
    
    % done!
end