function multMatrix = createMultTable
    numRows = input('\nEnter the number of rows: ');
    numCols = input('Enter the number of columns: ');
    
    multMatrix = multTable(numRows, numCols);
    
    % saving to file
    save myMultTable.dat multMatrix -ascii
end

