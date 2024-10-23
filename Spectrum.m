function [output1, output2] = Spectrum(amplitudes, sampling_frequency, title_)

    no_frequency_bins = length(amplitudes);
    bin_width = sampling_frequency / no_frequency_bins;
    
    frequencies = (0: no_frequency_bins/2) * bin_width;

    amplitudes_freq_domain = fft(amplitudes);
    magnitude = abs(amplitudes_freq_domain / no_frequency_bins);
    magnitude_dB = 20 * log10(magnitude);
    magnitude_dB_half = magnitude_dB(1:length(frequencies));

    figure

    plot(frequencies, magnitude_dB_half);

    xlabel("Frequency(Hz)");
    ylabel("Amplitude(dB)");

    title(title_ + " Spectrum")

    xlim([min(frequencies), max(frequencies)]);

    output1 = frequencies;
    output2 = magnitude_dB_half;
end

