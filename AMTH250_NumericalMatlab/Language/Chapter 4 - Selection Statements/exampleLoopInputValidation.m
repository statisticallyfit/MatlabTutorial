radius = input('Enter a radius: ');
while ~(isnumeric(radius) && isscalar(radius) && radius >= 0)
    disp('The radius must be a non-negative integer.')
    radius = input('radius = ');
end
area = pi * radius .^ 2; 
disp(['Area = ', num2str(area)])


