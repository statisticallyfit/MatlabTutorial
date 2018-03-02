function rates = getHourlyRates(vec)
    evenIndices = 2:2:(length(vec));
    rates = vec(evenIndices);
end 
