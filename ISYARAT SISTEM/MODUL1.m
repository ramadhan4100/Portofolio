%modul 1 operasi signal, system dan noise
x1 = 0
x2 = 3
%periode
T = x1+1
%frekuensi
f= (x2+1)*10    
%amplitude
A= x1+x2

Fs = 1000;
N = 0.08
t = 0:1/Fs:T;
y = A*sin(2*pi*f*t);

plot (t,y)