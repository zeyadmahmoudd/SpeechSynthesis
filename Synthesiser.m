function synthesised_speech = Synthesiser(a, g, pulsetrain, time, fs, filename, title_)
    
    figure;
    synthesised_speech = filter([g], [a], pulsetrain);
    audiowrite(filename, synthesised_speech,fs);
    plot(time, synthesised_speech)
    xlabel("Time(sec)");
    ylabel("Amplitude");
    title("synthesized" + title_)
end