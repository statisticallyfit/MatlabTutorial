function [hours, mins, secs] = breakTime(totalSeconds)
    % divide total seconds by 3600 to get the integer part (hours)
    hours = floor(totalSeconds / 3600);
    
    % remainder of totsecs/3600 = remaining num seconds (temporary)
    leftoverSecs = rem(totalSeconds , 3600); 
    
    % divide leftover secs by 60 to get remaining minutes
    mins = floor(leftoverSecs / 60);
    
    % remaining seconds is the remainder
    secs = rem(leftoverSecs, 60);
    
end