function [formants, bandwidths] = Formants(fs, a)
    
    roots_lpc = roots(a);
    
    % Keep only roots with positive imaginary parts
    roots_lpc = roots_lpc(imag(roots_lpc) > 0);

    angles = atan2(imag(roots_lpc), real(roots_lpc));

    freqs = angles * (fs/(2*pi));

    bandwidths = -1/2 * (fs/(2*pi)) * log(abs(roots_lpc));

    [formants, indices] = sort(freqs);
    bandwidths = bandwidths(indices);

    if length(formants) > 3
        formants = formants(1:3);
        bandwidths = bandwidths(1:3);
    end

end