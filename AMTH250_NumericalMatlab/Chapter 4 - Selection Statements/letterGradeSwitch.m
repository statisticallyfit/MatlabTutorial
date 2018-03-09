function letter = letterGradeSwitch(quizNumberGrade)
    % Returns a letter given a quiz numeric grade from 0 to 10
    
    % error check first
    if quizNumberGrade < 0 || quizNumberGrade > 10
        error('Bad input - not a valid grade')
        
    % Now figure out the letter grade
    else
        switch quizNumberGrade 
            case {10, 9}
                letter = 'A';
            case 8
                letter = 'B';
            case 7 
                letter = 'C';
            case 6
                letter = 'D';
            otherwise
                letter = 'F';
        end 
    end 
end

