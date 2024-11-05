function synthesised_speech = Synthesiser(a, g, pulsetrain, time, fs, title_, folder_path)
    
    figure;
    synthesised_speech = filter([g], [a], pulsetrain);
    file_title = title_{1} + " " + title_{2};
    sanitized_title = char(regexprep(file_title, '[^a-zA-Z0-9]', ''));
    filename = fullfile(folder_path, [sanitized_title '.wav']);
    audiowrite(filename, synthesised_speech,fs);
    plot(time, synthesised_speech)
    xlabel("Time(sec)");
    ylabel("Amplitude");
    title_text = sprintf("synthesized  %s\n%s", title_{1}, title_{2});
    title(title_text);
end