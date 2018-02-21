% Read the audio file and plot the visual frequency spectrum in the fourier
% space
[X,Fs] = audioread('corrupted_voice.wav');
L =length(X);
Y = fft(X);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1);
title('Frequency spectrum in Fourier space');

% specifying the range of bandpass to be used for removing the noise
% The low frequency noise is detected with 200, after trial and error
% The high frequency noise is detected with 2000, after trial and error
 bandpass = [200 2000] / (Fs/2);
[b, a] = butter(3,bandpass);

% We tried filter but filtfilt works much better to filter the noise
filteredY = filtfilt(b,a, X);

% To get the clean sound we reverse Fourier transform the signal
% then we write the audio into file
audiowrite('SpeakingMan.wav',real(filteredY),Fs);
