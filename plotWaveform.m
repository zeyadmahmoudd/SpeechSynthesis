function plotWaveform(amplitudes, sampling_frequency, title_)

    time_step = 1 / sampling_frequency;
    end_time = (length(amplitudes) - 1) / sampling_frequency;

    time = 0:time_step:end_time;

    figure;

    plot(time, amplitudes);

    xlabel("Time(sec)");
    ylabel("Amplitude");

    title(title_ + " waveform")
    
    xlim([min(time), max(time)]);
end


