close all
clear
clc

%current working diectory and speech folder containing speech files
currentDir = pwd;
speechfiles = currentDir + "\speech";

%speech file name - male or female and extension
had = "\had";
male = "_m";
female = "_f";
extension = ".wav";

duration = 100e-3 ;
start_position = 0.1;

lpc_degree = 21;

%male and female files of same word
had_male = speechfiles + had + male + extension;
had_female = speechfiles + had + female + extension;

%sound values
[had_male, Fs_male] = audioread(had_male);
[had_female, Fs_female] = audioread(had_female);

%playing sound
sound(had_male, Fs_male);
pause(length(had_male)/Fs_male);
sound(had_female, Fs_female);
pause(length(had_female)/Fs_female);

% %waveform
[time_male, amplitude_male] = Waveform(had_male, Fs_male, "had male");
[time_female, amplitude_female] = Waveform(had_female, Fs_female, "had female");

% %spectrum
[frequencies_male, magnitude_dB_male] = Spectrum(had_male, Fs_male, "had male");
[frequencies_female, magnitude_dB_female] = Spectrum(had_female, Fs_female, "had female");

% %spectogram
Spectrogram(had_male, Fs_male, "had male");
Spectrogram(had_female, Fs_female, "had female");

%segmenting vowel
vowel_data_male = Segmentation(had_male, Fs_male, start_position, duration);
vowel_data_female = Segmentation(had_female, Fs_female, start_position, duration);


%playing vowel sound
sound(vowel_data_male, Fs_male);
pause(length(vowel_data_male)/Fs_male);
sound(vowel_data_female, Fs_female);
pause(length(vowel_data_female)/Fs_female);

%Plotting Spectrum and lpc for male vowel
figure;
[f_male, mag_orig_male] = Spectrum(vowel_data_male, Fs_male, "Male vowel spectrum");
hold on;
[f_male_lpc, mag_lpc_male, a_male] = plotLPCSpectrum(vowel_data_male, Fs_male, lpc_degree, "Male lpc vowel spectrum");
hold off;

%Plotting Spectrum and lpc for female vowel
figure;
[f_female, mag_orig_female] = Spectrum(vowel_data_female, Fs_female, "Female vowel spectrum");
hold on;
[f_female_lpc, mag_lpc_female, a_female] = plotLPCSpectrum(vowel_data_female, Fs_female, lpc_degree, "Female lpc vowel spectrum");
hold off;

%Estimating formant frequencies
[formants_male, bandwiths_male] = Formants(Fs_male, a_male)
[formants_female, bandwiths_female] = Formants(Fs_female, a_female)

%Estimate fundamental frequency

%Plotting formant frequencies with spectrum