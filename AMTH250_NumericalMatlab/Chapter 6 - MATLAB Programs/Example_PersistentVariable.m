% Showing persistent variables

% First function is not persistent ('count' variable)
fprintf('This is what happens with a "normal" variable: \n')
func1
func1

% The second function has a persistent 'count' variable
fprintf('\nThis is what happens with a persistent variable: \n')
func2 
func2