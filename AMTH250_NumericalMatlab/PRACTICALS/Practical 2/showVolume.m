function showVolume
% Prompt user for input, verify, print it

% Prompting + validating. 
inputSide = input('Enter the side length: ');
while inputSide < 0
    inputSide = input('Invalid! Enter the side length (positive): ');
end

volume = volumeTetrahedron(inputSide);

fprintf('The volume of a tetrahedron with equilaterial triangle side lengths of %.5f is: %.5f\n', inputSide, volume)

end