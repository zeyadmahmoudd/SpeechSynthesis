close all
clear
clc

%Current working diectory and speech folder containing speech files
currentDir = pwd;
speechfiles = currentDir + "\speech";

%Speech file name - male or female and extension
had = "\had";
male = "_m";
female = "_f";
extension = ".wav";

%parameters for segmenting signal
duration = 100e-3 ;
start_position = 0.1;

%LPC order
lpc_degree = 14;

%title for plots and folders of experiments
additional_title = "lpc order = " + string(lpc_degree) + ", start position = " + string(start_position) + "sec, duration = " + string(duration)+ "sec";

%Creating experiment folders

%Male and female files of same word
had_male = speechfiles + had + male + extension;
had_female = speechfiles + had + female + extension;

%Sound values
[had_male, Fs_male] = audioread(had_male);
[had_female, Fs_female] = audioread(had_female);

%Playing sound
sound(had_male, Fs_male);
pause(length(had_male)/Fs_male);
sound(had_female, Fs_female);
pause(length(had_female)/Fs_female);

%Waveform
[time_male, amplitude_male] = Waveform(had_male, Fs_male, "had male");
[time_female, amplitude_female] = Waveform(had_female, Fs_female, "had female");

%Spectrum
[frequencies_male, magnitude_dB_male] = Spectrum(had_male, Fs_male, "had male");
[frequencies_female, magnitude_dB_female] = Spectrum(had_female, Fs_female, "had female");

%Spectogram
Spectrogram(had_male, Fs_male, "had male");
Spectrogram(had_female, Fs_female, "had female");

%Segmenting vowel
vowel_data_male = Segmentation(had_male, Fs_male, start_position, duration);
vowel_data_female = Segmentation(had_female, Fs_female, start_position, duration);


%Playing vowel sound
sound(vowel_data_male, Fs_male);
pause(length(vowel_data_male)/Fs_male);
sound(vowel_data_female, Fs_female);
pause(length(vowel_data_female)/Fs_female);

%Plotting waveform of the vowel
[var1, var2] = Waveform(vowel_data_male, Fs_male, "vowel a male");
[var3, var4] = Waveform(vowel_data_female, Fs_female, "vowel a female");

%Plotting Spectrum and lpc for male vowel
[f_male, mag_orig_male] = Spectrum(vowel_data_male, Fs_male, {"Male vowel with lpc", additional_title});
hold on;
[f_male_lpc, mag_lpc_male, a_male, g_male] = plotLPCSpectrum(vowel_data_male, Fs_male, lpc_degree);
legend("Spectrum", "LPC")
hold off;

%Plotting Spectrum and lpc for female vowel
[f_female, mag_orig_female] = Spectrum(vowel_data_female, Fs_female, {"Female vowel with lpc", additional_title});
hold on;
[f_female_lpc, mag_lpc_female, a_female, g_female] = plotLPCSpectrum(vowel_data_female, Fs_female, lpc_degree);
legend("Spectrum", "LPC")
hold off;

%Estimating formant frequencies
[formants_male, bandwiths_male] = Formants(Fs_male, a_male)
[formants_female, bandwiths_female] = Formants(Fs_female, a_female)

%Estimate fundamental frequency
FundamentalFrequency_male = FundamentalFrequency(vowel_data_male, Fs_male)
FundamentalFrequency_female = FundamentalFrequency(vowel_data_female, Fs_female)

%Indicating formant frequencies on spectrum of male vowel
[f_male, mag_orig_male] = Spectrum(vowel_data_male, Fs_male, {"Male vowel with lpc and formants", additional_title});
hold on;
[f_male_lpc, mag_lpc_male, a_male, g_male] = plotLPCSpectrum(vowel_data_male, Fs_male, lpc_degree);
PlotFormants(formants_male, f_male_lpc, mag_lpc_male);
legend("Spectrum", "LPC", "Formants")
hold off;

%Indicating formant frequencies on spectrum of female vowel
[f_female, mag_orig_female] = Spectrum(vowel_data_female, Fs_female, {"Female vowel with lpc and formants", additional_title});
hold on;
[f_female_lpc, mag_lpc_female, a_female, g_female] = plotLPCSpectrum(vowel_data_female, Fs_female, lpc_degree);
PlotFormants(formants_female, f_female_lpc, mag_lpc_female);
legend("Spectrum", "LPC", "Formants")
hold off;

%Creating pulse train for the synthesiser
[pulseTrain_male, time_male] = PulseTrain(FundamentalFrequency_male, duration, Fs_male, {"male", additional_title});
[pulseTrain_female, time_female] = PulseTrain(FundamentalFrequency_female, duration, Fs_female, {"female", additional_title});


%Synthesising Speech
synthesised_male = Synthesiser(a_male, g_male, pulseTrain_male, time_male, Fs_male, "synthesised_vowel_a_male.wav", {"vowel a male", additional_title});
synthesised_female = Synthesiser(a_female, g_female, pulseTrain_female, time_female, Fs_female, "synthesised_vowel_a_female.wav", {"vowel a female", additional_title});