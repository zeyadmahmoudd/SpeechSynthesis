function Spectrogram(amplitudes, Fs, title_)
    % Define window size in milliseconds
    window_size_ms = 100; % In ms
    nfft = 4096; % Increase FFT points for better frequency resolution
    
    % Get the length of the signal
    signal_length = length(amplitudes);
    
    % Convert window size to samples
    window_size_samples = round(window_size_ms * Fs / 1000); % Convert ms to samples
    noverlap = round(window_size_samples / 2); % 50% overlap
    
    % Create a new figure
    figure;
    
    % Check if the window size is valid for the signal length
    if window_size_samples <= signal_length
        % Calculate the spectrogram
        [S, F, T, P] = spectrogram(amplitudes, window_size_samples, noverlap, nfft, Fs);
        
        % Plot the spectrogram
        imagesc(T, F, 10*log10(P)); % Plot power in dB
        axis xy; % Flip the Y-axis so frequency increases upward
        xlabel('Time (s)');
        ylabel('Frequency (Hz)');
        title(sprintf('Spectrogram for %s (Window = %d ms)', title_, window_size_ms));
        colorbar;
        ylim([0, Fs/2]); % Limit the frequency axis to Nyquist frequency (Fs/2)
    else
        % Display error if window size is too large
        text(0.5, 0.5, 'Window size too large for signal', 'HorizontalAlignment', 'center');
        axis off;
    end
end