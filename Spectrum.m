function [frequencies, magnitude_dB] = Spectrum(signal, fs, title_str)
    figure;
    % Compute FFT
    nfft = 2^nextpow2(length(signal));  % Use power of 2 for FFT efficiency
    X = fft(signal, nfft);
    
    % Compute single-sided spectrum
    f = fs * (0:(nfft/2))/nfft;
    X_single = X(1:nfft/2 + 1);
    
    % Compute magnitude spectrum in dB
    magnitude = abs(X_single)/nfft;
    magnitude(2:end-1) = 2*magnitude(2:end-1);  % Compensate for single-sided spectrum
    magnitude_dB = 20*log10(magnitude + eps);
    
    % Plot spectrum
    plot(f, magnitude_dB, 'k', 'LineWidth', 0.5);
    grid on;
    xlabel('Frequency (Hz)');
    ylabel('Magnitude (dB)');
    title([title_str ' Spectrum']);
    xlim([0, fs/2]);
    
    % Output
    frequencies = f;
end