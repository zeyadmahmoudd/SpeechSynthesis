function synthesised_speech = Synthesiser(a, g, pulsetrain, time, fs, title_, folder_path)
    figure;
    
%     % Scale g based on LPC order
%     g = g * sqrt(length(a));
    
    synthesised_speech = filter([g], [a], pulsetrain);
    
    %Normalization
    synthesised_speech = synthesised_speech / max(abs(synthesised_speech));
    
    %rms_based_scaling
%     rms_target = 0.2;  % Typical RMS value for speech
%     current_rms = sqrt(mean(synthesised_speech.^2));
%     scale_factor = rms_target/current_rms;
%     synthesised_speech = synthesised_speech * scale_factor;
    
    % Combine title parts and convert to string
    file_title = string(title_{1}) + " " + string(title_{2});
    
    % Remove spaces, equals signs, and commas, but keep periods
    sanitized_title = char(regexprep(file_title, '[ =,]', ''));
    
    % Create full filepath as char
    filename = char(fullfile(folder_path, [sanitized_title '.wav']));
    
    % Create directory if it doesn't exist
    if ~exist(folder_path, 'dir')
        mkdir(folder_path);
    end
    
    audiowrite(filename, synthesised_speech, fs);
    
    plot(time, synthesised_speech)
    xlabel("Time(sec)");
    ylabel("Amplitude");
    title_text = sprintf("synthesized  %s\n%s", title_{1}, title_{2});
    title(title_text);
end