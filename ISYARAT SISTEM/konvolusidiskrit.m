%---------------RAMADHAN PRIHANTONO----------------
%------------------------I0718030------------------
%-------------------------MODUL3-------------------
%--------------------KONVULASI DISRKIT-------------
 
% No.1
% NIM = I0718006 jadi NIM = 8030^2 = 64963600
x1 = 3;
x2 = 0;
NIM = [6 4 9 6 3 6 0 0]; %sinyal yang dibangkitkan 
fs = 1000;
A = x1+x2;
f = (x2+1)*10;
t = 0:1/fs:x1+1;
Impuls = [1 0 0 0 0 0 0 0];
Segitiga = A*sawtooth(2*pi*f*t);
Kotak = A*square(2*pi*f*t);
Praktikum1 = A*sin(2*pi*f*t);
 
% No.2
figure(1)
% 2a
% Konvolusi Sinyal NIM dengan Sinyal Impuls
subplot(2,2,1);
stem(conv(NIM,Impuls));
title('Konvolusi Sinyal NIM dengan Sinyal Impuls');
grid on;
% 2b
% Konvolusi Sinyal NIM dengan Sinyal Segitiga
subplot(2,2,2);
stem(conv(NIM,Segitiga));
title('Konvolusi Sinyal NIM dengan Sinyal Segitiga');
grid on;
% 2c
% Konvolusi Sinyal NIM dengan Sinyal Kotak
subplot(2,2,3);
stem(conv(NIM,Kotak));
title('Konvolusi Sinyal NIM dengan Sinyal Kotak');
grid on;
% 2d
% Konvolusi Sinyal NIM dengan Sinyal Praktikum 1
subplot(2,2,4);
stem(conv(NIM,Praktikum1));
title('Konvolusi Sinyal NIM dengan Sinyal Praktikum 1');
grid on;
 
% No.3
figure(2)
% 3a
% konvulasi sinyal Impuls dengan sinyal Kotak
subplot(3,2,1)
stem(conv(Impuls,Kotak));
title('konvulasi sinyal Impuls dengan sinyal kotak');
grid on
 
% 3b
% konvulasi sinyal Impuls dengan sinyal Segitiga
subplot(3,2,2)
stem(conv(Impuls,Segitiga));
title('konvulasi sinyal Impuls dengan sinyal Segitiga');
grid on
 
% 3c
% konvulasi sinyal Impuls dengan sinyal Praktikum1
subplot(3,2,3)
stem(conv(Impuls,Praktikum1));
title('konvulasi sinyal Impuls dengan sinyal Praktikum1');
grid on
 
% 3d
% konvulasi sinyal Kotak dengan sinyal Segitiga
subplot(3,2,4)
stem(conv(Kotak,Segitiga));
title('konvulasi sinyal Kotak dengan sinyal Segitiga');
grid on
 
% 3e
% konvulasi sinyal Kotak dengan sinyal Praktikum1
subplot(3,2,5)
stem(conv(Kotak,Praktikum1));
title('konvulasi sinyal Kotak dengan sinyal Praktikum1');
grid on









