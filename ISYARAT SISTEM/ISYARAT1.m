%SD
fs=500e3;
f=10e3;
nCyl=5;
t=0:1/fs:nCyl*1/f;
x=cos(2*pi*f*t);
plot(t,x)
title('continuous sinusoidal signal');
xlabel('time(s)');
ylabel('amplitude')
