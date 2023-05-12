%---------------RAMADHAN PRIHANTONO----------------
%------------------------I0718030------------------
%-------------------------MODUL4-------------------
%--------------------FOURIER TRANSFORM-------------
 

% No.1
Fs = 1000; % sampling frequency
T = 1/Fs; % sample time
L = 1000; % length of signal
t = (0:L-1)*T; % time vector
An = 2; % amplitudo noise
% sum of a 50 Hz sinusoid and a 120 Hz sinusoid
x = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
y = x + An*randn(size(t)); %sinusoid plus noise

% An = 0
An1 = 0;
y1 = x + An1*randn(size(t));    % Sinusoidal + noise
subplot(3,2,1)
plot(Fs*t(1:50),y1(1:50))
title('Signal Corrupted Wirh Zero-Mean Random Noise and An = 0')
xlabel('time(ms)')

NFFT = 2^nextpow2(L);
Y1 = fft(y1,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
subplot(3,2,2)
plot(f,2*abs(Y1(1:NFFT/2+1)))
title('Single-Sided Amplitude Spectrum of y1(t)')
xlabel('Frequency(Hz)')
ylabel('|Y1(f)|')

% An = 1
An2 = 1;
y2 = x + An2*randn(size(t));
subplot(3,2,3)
plot(Fs*t(1:50),y2(1:50))
title('Signal Corrupted Wirh Zero-Mean Random Noise and An = 1')
xlabel('time(ms)')

NFFT = 2^nextpow2(L);
Y2 = fft(y2,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
subplot(3,2,4)
plot(f,2*abs(Y2(1:NFFT/2+1)))
title('Single-Sided Amplitude Spectrum of y2(t)')
xlabel('Frequency(Hz)')
ylabel('|Y2(f)|')

% An = 2
An3 = 2;
y3 = x + An3*randn(size(t));
subplot(3,2,5)
plot(Fs*t(1:50),y3(1:50))
title('Signal Corrupted Wirh Zero-Mean Random Noise and An = 2')
xlabel('time(ms)')

NFFT = 2^nextpow2(L);
Y3 = fft(y3,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
subplot(3,2,6)
plot(f,2*abs(Y3(1:NFFT/2+1)))
title('Single-Sided Amplitude Spectrum of y3(t)')
xlabel('Frequency(Hz)')
ylabel('|Y3(f)|')

% An = 3
figure
An4 = 3;
y4 = x + An4*randn(size(t));
subplot(3,2,1)
plot(Fs*t(1:50),y4(1:50))
title('Signal Corrupted Wirh Zero-Mean Random Noise and An = 3')
xlabel('time(ms)')

NFFT = 2^nextpow2(L);
Y4 = fft(y4,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
subplot(3,2,2)
plot(f,2*abs(Y4(1:NFFT/2+1)))
title('Single-Sided Amplitude Spectrum of y4(t)')
xlabel('Frequency(Hz)')
ylabel('|Y4(f)|')

% An = 4
An5 = 4;
y5 = x + An5*randn(size(t));
subplot(3,2,3)
plot(Fs*t(1:50),y5(1:50))
title('Signal Corrupted Wirh Zero-Mean Random Noise and An = 4')
xlabel('time(ms)')

NFFT = 2^nextpow2(L);
Y5 = fft(y5,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
subplot(3,2,4)
plot(f,2*abs(Y5(1:NFFT/2+1)))
title('Single-Sided Amplitude Spectrum of y5(t)')
xlabel('Frequency(Hz)')
ylabel('|Y5(f)|')

% An = 5
An6 = 5;
y6 = x + An6*randn(size(t));
subplot(3,2,5)
plot(Fs*t(1:50),y6(1:50))
title('Signal Corrupted Wirh Zero-Mean Random Noise and An = 5')
xlabel('time(ms)')

NFFT = 2^nextpow2(L);
Y6 = fft(y6,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
subplot(3,2,6)
plot(f,2*abs(Y6(1:NFFT/2+1)))
title('Single-Sided Amplitude Spectrum of y6(t)')
xlabel('Frequency(Hz)')
ylabel('|Y6(f)|')

% No.2
% NIM = 06
figure
x1 = 0;
x2 = 6;
tPraktikum1 = 0:1/1000:x1+1; % Interval Waktu pada Praktikum 1
A = x1+x2; % Amplitudo pada Praktikum 1
f = (x2+1)*10; % Frekuensi pada Praktikum 1
z = A*sin(2*pi*f*tPraktikum1) % Rumus Sinyal Praktikum 1
subplot(1,2,1);
plot(tPraktikum1,z);
xlabel('Waktu, s(second)');
ylabel('Amplitudo');
title('Sinyal Praktikum 1');
NFFT = 2^nextpow2(L);     
% Kekuatan berikutnya 2 dari Panjang y
Y = fft(z,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1)
% Plot spektrum amplitudo satu sisi
subplot(1,2,2);
plot(f,2*abs(Y(1:NFFT/2+1)))
title('Spektrum Amplitudo Satu Sisi dari s(t)')
xlabel('Frekuensi (Hz)')
ylabel('|S(f)|')

%% No. 3
figure(4) 
A = audioread('3000.wav');
B = A(:,1);
NFFT = 2^nextpow2(44100);     
% Kekuatan berikutnya 2 dari Panjang y
b = fft(B,NFFT)/44100;
f = 44100/2*linspace(0,1,NFFT/2+1)
% Plot spektrum amplitudo satu sisi
plot(f,2*abs(b(1:NFFT/2+1)))
title('Spektrum Amplitudo Satu Sisi dari Y (t)')
xlabel('Frekuensi (Hz)')
ylabel('|Y(f)|')
