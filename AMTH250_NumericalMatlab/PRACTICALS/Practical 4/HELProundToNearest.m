% takes output of decimalToBinary and rounds to nearest
function  roundToNearest(decimalNum)

    % convert to floating point
    [total, ~] = strsplit(decimalToBinary(decimalNum), '.');
    whole = total{1};
    after = total{2};
    
    if whole == '0' % go right on the after part until hit one
        
end