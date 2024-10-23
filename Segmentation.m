function [output] = Segmentation(speech, Fs, start_position, vowel_length)
    
    start_element = start_position * Fs;
    end_element = (start_position + vowel_length) * Fs;
    output = speech(start_element:end_element-1);

end