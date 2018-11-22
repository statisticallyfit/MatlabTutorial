function showVolume
    % Prompt user for input, verify, print it

    % Prompting + validating. 

    % first clear workspace variables since script inherits from workspace
    clear all; 

    inputSide = input('Enter the side length: ');
    while inputSide <= 0 || ~isnumeric(inputSide) || ~isscalar(inputSide)
        inputSide = input('Invalid! You must enter a positive scalar number: ');
    end

    volume = volumeTetrahedron(inputSide);

    fprintf('The volume of a tetrahedron with equilaterial triangle side lengths of %.5f is: %.5f\n', inputSide, volume)

        % or 
    % disp(['The volume of tetrahedron is', num2str(v), '.'])
end