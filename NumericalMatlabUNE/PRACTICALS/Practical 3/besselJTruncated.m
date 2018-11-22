function besselSum = besselJTruncated(nu, x)
% Evaluates the besselJ function truncated to the first
% 11 terms: m = 0, 1, ... 10. (instead of m to infinity) 

    besselSum = 0;
    
    for m = 0:10
        besselSum = besselSum + (-1)^m * (x/2) .^ (2*m + nu) / (factorial(m) * gamma(m + nu + 1));
    end 
        
end