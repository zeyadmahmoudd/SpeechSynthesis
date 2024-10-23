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

lpc_degree = 24;

%male and female files of same word
had_male = speechfiles + had + male + extension;
had_female = speechfiles + had + female + extension;

%sound values
[had_male, Fs_male] = audioread(had_male);
[had_female, Fs_female] = audioread(had_female);

%playing sound
% sound(had_male, Fs_male);
% pause(length(had_male)/Fs_male);
% sound(had_female, Fs_female);
% pause(length(had_female)/Fs_female);
% 
% %waveform
% [time_male, amplitude_male] = Waveform(had_male, Fs_male, "had male");
% [time_female, amplitude_female] = Waveform(had_female, Fs_female, "had female");
% 
% %spectrum
% [frequencies_male, magnitude_dB_male] = Spectrum(had_male, Fs_male, "had male");
% [frequencies_female, magnitude_dB_female] = Spectrum(had_female, Fs_female, "had female");
% 
% %spectogram
% Spectrogram(had_male, Fs_male, "had male");
% Spectrogram(had_female, Fs_female, "had female");

%segmenting vowel
vowel_data_male = Segmentation(had_male, Fs_male, start_position, duration);
vowel_data_female = Segmentation(had_female, Fs_female, start_position, duration);

length(had_male)
Fs_male

%playing vowel sound
sound(vowel_data_male, Fs_male);
pause(length(vowel_data_male)/Fs_male);
% sound(vowel_data_female, Fs_female);
% pause(length(vowel_data_female)/Fs_female);



% %lpc esimation
a = lpc(vowel_data_male, lpc_degree);
% lpc_coeff_female = lpc(vowel_data_female, lpc_degree);
% 
% 
% %frequency response to lpc
% [H_male, F_male] = freqz(1, lpc_coeff_male, 2048, Fs_male);
% [H_female, F_female] = freqz(1, lpc_coeff_female, 2048, Fs_female);
% 
% 
% 
% %plotting spectrum of lpc and vowel
% [frequencies_vowel_male, magnitude_vowel_dB_male] = Spectrum(vowel_data_male, Fs_male, "vowel a original and lpc male");
% hold on
% lpc_spectrum(H_male, F_male);
% hold off
% 
% 
% [frequencies_vowel_female, magnitude_vowel_dB_female] = Spectrum(vowel_data_female, Fs_female, "vowel a original and lpc female");
% hold on
% lpc_spectrum(H_female, F_female);
% hold off


N = Fs_male * duration;
[magnitude, f] = freqz(1, a, N, 'whole');
f = f * Fs_male / (2 * pi);

[frequencies_vowel_male, magnitude_vowel_dB_male] = Spectrum(vowel_data_male, Fs_male, "vowel a original and lpc male");
hold on
plot(f, abs(magnitude))
hold off