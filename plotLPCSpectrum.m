function [frequencies, lpc_spectrum, a] = plotLPCSpectrum(signal, fs, order, title_str)
    % Compute LPC coefficients
    [a, g] = lpc(signal, order);
    
    % Compute frequency response
    nfft = 2^nextpow2(length(signal));
    [h, f] = freqz(g, a, nfft/2 + 1, fs);  % Note: using g directly, not sqrt(g)
    
    % Compute magnitude in dB
    lpc_spectrum = 20*log10(abs(h) + eps);
    
    % Plot LPC spectrum
    plot(f, lpc_spectrum, 'r', 'LineWidth', 1.5);
    
    % Output
    frequencies = f;
end