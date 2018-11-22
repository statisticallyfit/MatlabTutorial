% Generate the first 15 bits of pi
clear;
% The integral part of pi is 3
bits = '11.';
% now let us do the fractional part using the algorithm from
% lectures

frac = pi - 3;

while length(bits) < 16
    x = 2*frac;
    if x >= 1
        bits = [bits '1'];
        frac = x - 1;
    else
        bits = [bits '0'];
        frac = x;
    end
end
% display the result
disp(bits);