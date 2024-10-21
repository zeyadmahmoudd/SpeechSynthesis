%current working diectory and speech folder containing speech files
currentDir = pwd;
speechfiles = currentDir + "\speech";

%speech file name - male or female and extension
had = "\had";
male = "_m";
female = "_f";
extension = ".wav";

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

%waveform
[time_male, amplitude_male] = Waveform(had_male, Fs_male, "had male");
[time_female, amplitude_female] = Waveform(had_female, Fs_female, "had female");

%spectrum
[frequencies_male, magnitude_dB_male] = Spectrum(had_male, Fs_male, "had male");
[frequencies_female, magnitude_dB_female] = Spectrum(had_female, Fs_female, "had female");

%spectogram
Spectrogram(had_male, Fs_male, "had male");
Spectrogram(had_female, Fs_female, "had female");