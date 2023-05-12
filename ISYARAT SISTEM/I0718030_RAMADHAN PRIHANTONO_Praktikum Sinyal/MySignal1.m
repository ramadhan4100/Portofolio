%-----------------RAMADHAN PRIHANTONO----------------------
%--------------Operasi sinyal, Sistem, dan Noise-----------------
x1=3;
x2 =0;
% periode
T=(x1+1);

% frekuensi
f=(x2+1)*10;
% tipe sinyal
p= mod(30,3)
% amplitudo
A=x1+x2  ;
fs=1000;
%ploting
t=0:1/fs:T;
y=A*sin(2*pi*f*t)
plot(t,y)
title ('Sinyal Sinusoidal')