function y = sinc(x)
    y = 0;
    if x >= 0.001 | x <= -0.001
        y = sin(x)./x;
    elseif x < 0.001 & x > -0.001
        y = 1 - x.^2/6; % taylor approximation
    end
        
end