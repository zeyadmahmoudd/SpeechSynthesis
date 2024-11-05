function [pulse_train, t] = PulseTrain(f0, duration, fs, title_)
    figure;
    
    t = 0:1/fs:duration-1/fs;
    % Calculate period in samples
    T = round(fs/f0);
    % Create zero array
    pulse_train = zeros(1, length(t));
    % Set pulses at periodic intervals
    pulse_train(1:T:end) = 1;
    
    plot(t, pulse_train);
    title_text = sprintf("Pulse train for %s\n%s", title_{1}, title_{2});
    title(title_text);
    xlabel("time (sec)")
    
end