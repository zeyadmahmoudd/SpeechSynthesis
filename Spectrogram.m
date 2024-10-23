function Spectrogram(amplitudes, Fs, title_)
    % Define window sizes in milliseconds
    window_sizes_ms = [25, 125, 375, 1000];  % In ms
    nfft = 4096;  % Increase FFT points for better frequency resolution
    
    % Get the length of the signal
    signal_length = length(amplitudes);
    
    % Create a new figure
    figure;
    
    for i = 1:length(window_sizes_ms)
        % Convert window size to samples
        window_size_samples = round(window_sizes_ms(i) * Fs / 1000);  % Convert ms to samples
        noverlap = round(window_size_samples / 2);  % 50% overlap
        
        % Check if the window size is valid for the signal length
        if window_size_samples <= signal_length
            % Calculate the spectrogram
            [S, F, T, P] = spectrogram(amplitudes, window_size_samples, noverlap, nfft, Fs);
    
            % Plot the spectrogram
            subplot(2, 2, i);  % Create 2x2 subplots
            imagesc(T, F, 10*log10(P));  % Plot power in dB
            axis xy;  % Flip the Y-axis so frequency increases upward
            xlabel('Time (s)');
            ylabel('Frequency (Hz)');
            title(['Spectrogram with T = ', num2str(window_sizes_ms(i)), ' ms']);
            colorbar;
            ylim([0, Fs/2]);  % Limit the frequency axis to Nyquist frequency (Fs/2)
        else
            % Skip window size if it's too large for the signal
            subplot(2, 2, i);
            text(0.5, 0.5, ['Window size too large for signal'], 'HorizontalAlignment', 'center');
            axis off;
        end
    end
end