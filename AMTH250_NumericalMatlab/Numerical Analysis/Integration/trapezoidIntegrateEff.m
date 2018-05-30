function Im = trapezoidIntegrateEff(f, a, b, p)
    % initialize the integration estimate
    Im_est = 0; 
    mMax = 100; % desperate stopping test
    
    for m = 0:mMax
        increment = trapezoidStep(f, a, b, m);
        Im_est = Im_est + increment;
        
        % stopping test by relative error.
        if abs(Im_est - 2*increment) <= 10^(-p) * abs(Im_est) 
            break;
        end
    end
    
    % estimated number of intervals N so that we get the above precision is
    % going to be this: 
    N_est = 2^m;
    Im = ((b - a)/N_est) * Im_est;
    
    fprintf('Solution with 2^%i (%i) intervals equals area %.*f\n', m, N_est, p, Im)
    
end