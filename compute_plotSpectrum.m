function compute_plotSpectrum(amplitudes, sampling_frequency, title_)

    no_frequency_bins = length(amplitudes) - 1;
    bin_width = sampling_frequency / length(amplitudes);
    
    frequencies = (0: no_frequency_bins) * bin_width;

    amplitudes_freq_domain = fft(amplitudes);
    magnitude = abs(amplitudes_freq_domain);
    magnitude_dB = 20 * log10(magnitude);

    figure

    plot(frequencies, magnitude_dB);

    xlabel("Frequency(w)");
    ylabel("Amplitude(dB)");

    title(title_ + " Spectrum")

    xlim([min(frequencies), max(frequencies)]);
end

