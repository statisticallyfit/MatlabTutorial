function result = factorialWhileLoop(high)
    i = 0; 
    factorialProd = 1; 
    
    while i < high
        i = i + 1;
        factorialProd = factorialProd * i;
        %fprintf('i = %d, fac = %d\n', i, factorialProd)
    end
    result = factorialProd;
end

