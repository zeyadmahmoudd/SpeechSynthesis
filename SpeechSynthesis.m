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
[had_male, Fs_male] = audioread(speechfiles + had + male + extension);
[had_female, Fs_female] = audioread(speechfiles + had + female + extension);

%playing sound
sound(had_male, Fs_male);
pause(length(had_male)/Fs_male);
sound(had_female, Fs_female);
pause(length(had_female)/Fs_female);

%waveform
plotWaveform(had_male, Fs_male, "had male");
plotWaveform(had_female, Fs_female, "had female");

%spectrum
compute_plotSpectrum(had_male, Fs_male, "had male");
compute_plotSpectrum(had_female, Fs_female, "had female");