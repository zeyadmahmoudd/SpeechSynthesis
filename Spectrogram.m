function Spectrogram(amplitudes, Fs, title_)

    window_size = 1024; 
    no_verlap = window_size / 2; 
    no_fft = 1024; 
    
    figure;

    spectrogram(amplitudes, window_size, no_verlap, no_fft, Fs, 'yaxis');
    
    title('Spectrogram ' + title_);
    xlabel('Time (sec)');
    ylabel('Frequency (Hz)');
    colorbar;

end