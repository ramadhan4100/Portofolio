%%%Down sampling
t = 0:.00025:1; % Time vector
x = sin(2*pi*30*t)+ sin(2*pi*60*t);
k=6; %faktor decimation
y = decimate(x,k);
subplot(211);
gbatas = 120;
stem(x(1:gbatas)), axis([0 120 -2 2])
% Original signal
xlabel('(a)batas Sinyal asli')
subplot(212);
stem(y(1:gbatas/k)) %Decimated signal
xlabel('(b) Hasil time scaling, dovn sampling')

%%%% Upsampling
clc;
t = 0:0.001:1;
% Time vector
x = sin(2*pi*30*t) + sin(2*pi*60*t);
K=4;
%interpolasi dengan faktor 4
y = interp(x,k);
% subplot(211)
subplot(311)
gbatas=30;
stem(x(1:gbatas));
xlabel('(a) Sinyal Asli');
%subplot(212)
subplot(312)
stem(y(1:gbatas*k));
xlabel('(b) Hasil Interpolasi');
%
subplot(313);
stem(y(1:gbatas*k),'color','red'); hold on;
x = upsample(x,4);
stem(x(1:gbatas*k),'color','blue');
