function printInDegreesOrRadians
    angle = input('Enter the angle: ');
    radOrDeg = input('Is is (r)adians or (d)egrees?: ', 's');
    
    sineValue = 0;
    if radOrDeg == 'r'
        sineValue = sin(angle);
    elseif radOrDeg == 'd'
        sineValue = sind(angle);
    end
    
    fprintf('The sin is %.5f\n', sineValue)
end 