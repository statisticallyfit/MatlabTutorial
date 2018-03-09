function signsMat = signNumMat(mat)
    
    [r c] = size(mat);
    
    for i = 1:r
        for j = 1:c
            if mat(i, j) > 0
                signsMat(i, j) = 1;
            elseif mat(i, j) == 0
                signsMat(i, j) = 0;
            else 
                signsMat(i, j) = -1;
            end
        end
    end
end

