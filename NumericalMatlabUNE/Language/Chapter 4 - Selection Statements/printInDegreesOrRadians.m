function printInDegreesOrRadians
    angle = input('Enter the angle: ');
    radOrDeg = input('Is it (r)adians or (d)egrees?: ', 's');
    % either no 's' signal and enter 'r' or with 's' signal and just enter r.
    
    sineValue = 0;
    if radOrDeg == 'r'
        sineValue = sin(angle);
    elseif radOrDeg == 'd'
        sineValue = sind(angle);
    end
    
    fprintf('The sin is %.5f\n', sineValue)
end 