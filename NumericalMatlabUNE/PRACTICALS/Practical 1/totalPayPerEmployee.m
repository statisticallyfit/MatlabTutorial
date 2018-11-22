% This function calculates the total pay of an employee, given
% a vector with even length, containing pay and hourlyRate, consecutively.
function total = totalPayPerEmployee(vec)
    h = getHours(vec);
    r = getHourlyRates(vec);
    total = h .* r;
end

