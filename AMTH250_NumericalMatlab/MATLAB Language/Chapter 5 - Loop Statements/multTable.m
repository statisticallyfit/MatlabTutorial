function outMat = multTable(rows, cols)
    % preallocate the matrix
    outMat = zeros(rows, cols);
    
    for i = 1:rows
        for j = 1:cols
            outMat(i, j) = i*j;
        end
    end 
end

