function SaveFigures(directoryPath)
    % Check if directory exists; if not, create it
    if ~exist(directoryPath, 'dir')
        mkdir(directoryPath);
    end
    
    % Get handles to all open figures
    figHandles = findall(0, 'Type', 'figure');
    
    % Loop through each figure
    for i = 1:length(figHandles)
        % Set the current figure
        fig = figHandles(i);
        figure(fig);
        
        % Set standard figure size
        screensize = get(0,'ScreenSize');
        width = 1200;  % Width in pixels
        height = 600;  % Height in pixels
        left = (screensize(3) - width)/2;
        bottom = (screensize(4) - height)/2;
        set(fig, 'Position', [left, bottom, width, height]);
        
        % Try to get the title from the figure's axes
        ax = get(fig, 'CurrentAxes');  % Get current axes
        if ~isempty(ax) && ~isempty(get(ax, 'Title'))
            titleText = get(get(ax, 'Title'), 'String');  % Get title string
            % Handle case where title might be a cell array
            if iscell(titleText)
                titleText = titleText{1};
            end
        else
            titleText = sprintf('Figure_%d', i);  % Default name if no title
        end
        
        % Clean up the title text to make it filename-friendly
        titleText = regexprep(titleText, '[^\w]', '_');  % Replace non-alphanumeric chars with '_'
        
        % Full path for saving
        fullPath = fullfile(directoryPath, [titleText, '.png']);
        
        % Save the figure
        try
            exportgraphics(fig, fullPath, 'Resolution', 300);  % Export whole figure at 300 DPI
            disp(['Saved figure as: ' fullPath]);
        catch ME
            warning('Failed to save with exportgraphics, trying saveas...');
            try
                saveas(fig, fullPath);
                disp(['Saved figure as: ' fullPath]);
            catch ME2
                warning(['Failed to save figure: ' titleText]);
                disp(ME2.message);
            end
        end
    end
end