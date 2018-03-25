function letter = letterGrade(quizNumberGrade)
    % Returns a letter given a quiz numeric grade from 0 to 10
    
    %disp(['n = ', num2str(n)])
    
    % error check first
    if quizNumberGrade < 0 || quizNumberGrade > 10
        error('Bad input - not a valid grade')
        
    % Now figure out the letter grade
    elseif quizNumberGrade == 9 || quizNumberGrade == 10
        letter = 'A';
    elseif quizNumberGrade == 8
        letter = 'B';
    elseif quizNumberGrade == 7
        letter = 'C';
    elseif quizNumberGrade == 6
        letter = 'D';
    else
        letter = 'F';
    end 
end

