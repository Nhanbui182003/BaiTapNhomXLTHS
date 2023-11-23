function draw_confusionmatrix(m)
    m(1,6) = m(1,1)/sum(m(1,:))*100;
    m(2,6) = m(2,2)/sum(m(2,:))*100;
    m(3,6) = m(3,3)/sum(m(3,:))*100;
    m(4,6) = m(4,4)/sum(m(4,:))*100;
    m(5,6) = m(5,5)/sum(m(5,:))*100;
    m(6,6) = (m(1,1)+m(2,2)+m(3,3)+m(4,4)+m(5,5))/1.05;
    
    coltags = {'a', 'e', 'i', 'o', 'u', 'accuracy_percent'};
    rowtags = {'a', 'e', 'i', 'o', 'u', 'accuracy_percent'};
    
    % Create a table using the data, column names, and row names
    t = array2table(m, 'VariableNames', coltags, 'RowNames', rowtags);
    
    % Find min and max accuracy values
    minIndex = find(m(:, 6) == min(m(:, 6)));
    maxIndex = find(m(:, 6) == max(m(:, 6)));
    
    % Convert the table to a cell array
    tCell = table2cell(t);

    % Highlight cells with min and max accuracy
   

    % Create a new table from the modified cell array
    tModified = cell2table(tCell, 'VariableNames', coltags, 'RowNames', rowtags);

    % Display the table
    disp(tModified);
end