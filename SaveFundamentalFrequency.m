function SaveFundamentalFrequency(FF_male, FF_female, experiment_folder)

file_name = 'FundamentalFrequency.txt';
file_path = fullfile(experiment_folder, file_name);

fileID = fopen(file_path, 'w');

if fileID == -1
    error('Could not open the file for writing.');
end

fprintf(fileID, 'Male fundamental frequency = %.2f Hz\n', FF_male);
fprintf(fileID, 'Female fundamental frequency = %.2f Hz\n', FF_female);

fclose(fileID);

disp(['Data saved to ', file_path]);

end