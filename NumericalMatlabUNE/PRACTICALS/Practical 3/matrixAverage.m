function avg = matrixAverage(mat)
% Gets a matrix as an input argument and returns average of
% all numbers in the matrix.
    [numRows, numCols] = size(mat);
    
    cumSum = 0;
    for r = 1:numRows
        for c = 1:numCols
            cumSum = cumSum + mat(r, c);
        end
    end
    
    avg = cumSum / (numRows * numCols);
    
end