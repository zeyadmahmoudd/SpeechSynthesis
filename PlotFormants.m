function PlotFormants(formants, frequencies, lpc_spectrum)
    
    % Get current axis limits
    yl = ylim;  % Get y-axis limits
    
    % For each formant, find its magnitude from LPC spectrum
    for i = 1:length(formants)
        % Find closest frequency index
        [~, idx] = min(abs(frequencies - formants(i)));
        y_pos = lpc_spectrum(idx);  % Get magnitude at formant frequency
        
        % Plot dot
        scatter(formants(i), y_pos, 100, 'r', 'filled');
        
        % Plot vertical dashed line from bottom to formant point
        line([formants(i) formants(i)], [yl(1) y_pos], ...
             'Color', 'r', 'LineStyle', '--', 'LineWidth', 1);
        
        % Add label at the bottom (frequency value)
        text(formants(i), yl(1)-5, sprintf('%.0f', formants(i)), ...
             'HorizontalAlignment', 'center', ...
             'VerticalAlignment', 'top', ...
             'Color', 'r');
        
        % Add formant label above the point
        text(formants(i), y_pos + 5, sprintf('F%d', i), ...
             'HorizontalAlignment', 'center', ...
             'VerticalAlignment', 'bottom', ...
             'Color', 'r');
    end
end