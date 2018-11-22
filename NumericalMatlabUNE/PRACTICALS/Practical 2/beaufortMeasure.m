function weatherPrognosis = beaufortMeasure(windStrength)
% Takes an integer windStrength between 0 and 12 and returns
% one of the weather measures. 

    % Validating input
    if windStrength < 0 || windStrength > 12 || (round(windStrength) ~= windStrength)
        %error('Invalid input!')
        weatherPrognosis = 'INVALID';
        
    % Now analyzing: 
    elseif windStrength == 0
        weatherPrognosis = 'There is no wind';
    elseif windStrength >= 1 && windStrength <= 6
        weatherPrognosis = 'There is a breeze';
    elseif windStrength >= 7 && windStrength <= 9
        weatherPrognosis = 'There is a gale';
    elseif windStrength == 10 || windStrength == 11
        weatherPrognosis = 'It is a storm'; 
    elseif windStrength == 12
        weatherPrognosis = 'Hello, Hurricane'; 
end