function asymptotes = getAsymptotes(xs, ys)
% Gets the x-values at which the ys have discontinuities (vertical
% asymptotes only).
    asymptotes = xs(ys == Inf);
    
end