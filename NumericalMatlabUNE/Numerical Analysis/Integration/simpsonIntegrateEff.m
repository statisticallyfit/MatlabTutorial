function Im = simpsonIntegrateEff(f, a, b, p) %  p = num correct signif digits

    mMax = 100;

    inc_1 = trapezoidStep(f, a,b,1);
    Im_est = f(a) + 4*f((a+b)/2) + f(b);

    for m = 1:mMax            
        inc_2 = trapezoidStep(f, a,b, m+1);
        Im_est = Im_est - 2*inc_1 + 4*inc_2;
        
        if abs(Im_est + 4*inc_1 - 8*inc_2) <= 10^(-p)*abs(Im_est) 
            break;
        end    
        inc_1 = inc_2;
    end

    N_est = 2^(m+1);
    Im = ((b-a)/(3*N_est)) * Im_est;
    
    fprintf('Solution with 2^%i (%i) intervals is equal to = %.*f \n',m+1,N_est, p, Im_est)
    
end