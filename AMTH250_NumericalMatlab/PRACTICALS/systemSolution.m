function xSol = systemSolution(A, b)
    if det(A) ~= 0
        xSol = A^-1 * b; 
    else
        xSol = ['x', 'y', 'z']' ;
    end 
end 


