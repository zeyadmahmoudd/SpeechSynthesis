function synthesised_speech = Synthesiser(a, g, pulsetrain, time, fs, filename, title_)
    
    figure;
    synthesised_speech = filter([g], [a], pulsetrain);
    audiowrite(filename, synthesised_speech,fs);
    plot(time, synthesised_speech)
    xlabel("Time(sec)");
    ylabel("Amplitude");
    title_text = sprintf("synthesized  %s\n%s", title_{1}, title_{2});
    title(title_text);
end