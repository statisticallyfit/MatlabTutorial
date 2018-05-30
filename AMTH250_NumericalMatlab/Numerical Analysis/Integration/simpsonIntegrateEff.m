function simpIntegral = simpsonIntegrateEff(f, a, b, p) %  p = num correct signif digits

    mMax = 100;

    inc_1 = trapezoidStep(f, a,b,1);
    simpIntegral = f(a) + 4*f((a+b)/2) + f(b);

    for m = 1:mMax            
        inc_2 = trapezoidStep(f, a,b, m+1);
        simpIntegral = simpIntegral - 2*inc_1 + 4*inc_2;
        
        if abs(simpIntegral + 4*inc_1 - 8*inc_2) <= 10^(-p)*abs(simpIntegral) 
            break;
        end    
        inc_1 = inc_2;
    end

    N_est = 2^(m+1);
    simpIntegral=((b-a)/(3*N_est)) * simpIntegral;
    
    fprintf('Solution with 2^%i (%i) intervals is equal to = %.*f \n',m+1,N_est, p, simpIntegral)
    
end