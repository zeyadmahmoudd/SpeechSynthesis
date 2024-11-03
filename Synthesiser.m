function synthesised_speech = Synthesiser(a, g, pulsetrain, time, fs, filename)
    
    figure;
    synthesised_speech = filter([g], [a], pulsetrain);
    audiowrite(filename, synthesised_speech,fs);
    plot(time, synthesised_speech)

end