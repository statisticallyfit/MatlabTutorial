function total = totalPayPerEmployee(vec)
    h = getHours(vec);
    r = getHourlyRates(vec);
    total = h * r';
end

