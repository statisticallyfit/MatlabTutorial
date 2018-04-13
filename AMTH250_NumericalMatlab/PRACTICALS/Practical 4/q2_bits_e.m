clear;
% The integral part of e is 2
bits = '10.';
% now let us do the fractional part using the algorithm from
% lectures

frac = exp(1) - 2;

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
