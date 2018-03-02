function hours = getHours(vec)
    oddIndices = 1:2:(length(vec));
    hours = vec(oddIndices);
end

