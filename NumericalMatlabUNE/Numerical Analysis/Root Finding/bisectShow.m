function bisectShow(f, a, b, nMax)
    % starting
    fa = f(a);
    xNew = 0;
    
    fprintf('%s %10s %20s %10s %20s %15s %15s\n', 'n', 'a', 'xNew', 'b', 'f(a)', 'f(xNew)', 'f(b)')
    
    for n = 1: nMax
        xNew = (a + b)/2; 
        fNew = f(xNew);
        
        fprintf('%d %15.8f %15.8f %15.8f %15d %15d %15d\n', n, a, xNew, b, sign(fa), sign(fNew), sign(f(b)))
        
        if fa*fNew > 0
            a = xNew; % new interval is [estimate, b]
            fa = fNew;
        else
            b = xNew; % new interval [a, estimate]
        end
    end
        
    fprintf('nMax = %d, xNew = %.10f\n', nMax, xNew) 
    
end