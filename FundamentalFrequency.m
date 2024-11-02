function f0 = FundamentalFrequency(signal, fs)
    % Compute autocorrelation
    r = xcorr(signal, 'coeff');
    r = r(length(signal):end);  % Keep only positive lags
    
    % Set search range for realistic speech F0
    min_lag = round(fs/400);  % max F0 = 400 Hz
    max_lag = round(fs/50);   % min F0 = 50 Hz
    
    % Search for peaks in the valid range (skip first peak at lag 0)
    [pks, locs] = findpeaks(r(min_lag:max_lag));
    
    if ~isempty(pks)
        % Find highest peak in the valid range
        [~, max_idx] = max(pks);
        period_samples = locs(max_idx) + min_lag - 1;
        f0 = fs/period_samples;
    else
        f0 = NaN;
    end
end