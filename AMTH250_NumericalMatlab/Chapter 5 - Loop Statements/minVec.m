function [theMin] = minVec(vec)
    theMin = vec(1);
    
    for i = 2:length(vec)
        if vec(i) < theMin
            theMin = vec(i);
        end
    end
end