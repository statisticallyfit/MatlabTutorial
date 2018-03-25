function circum = calcCircum(r)
    % This function returns the circumference, but returns error
    % if radius r is negative
    
    if r < 0
        error('Sorry, radius cannot be negative')
    else
        circum = 2*pi*r;
    end
end