function [tempLogAbsError, tempLogH] = cleanLogs(logAbsError, logH)

    % If any values are inf, skip them
    indices = fliplr(sort([find(isinf(logAbsError)), find(isinf(logH))])); % reverse array so 
    %no deletion errors.
    tempLogAbsError = logAbsError;
    tempLogAbsError(indices) = [];
    tempLogH = logH;
    tempLogH(indices) = [];
    
    % Getting rid of unwanted too curvy estimates
    dd = diff(diff(tempLogAbsError));
    % remove any items with diff of diffs >= 1.00
    indices = find(abs(dd) >= 0.3);
    % scale indices by 2 since that is amount list decreases after double
    % diff
    indices = fliplr(indices + 2); % in decreasing order so no deletion errors
    tempLogAbsError(indices) = [];
    tempLogH(indices) = [];
end