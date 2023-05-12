%RAMADHAN PRIHANTONO
%I0718030
%modul 2
%SAMPLING DAN ALIASING

x1 = 3
x2 = 0
f = 40
a = x1 + x2


fs = 1000
t = 0:1/fs:1 ;
y = a*sin(2*pi*f*t);
subplot(321);
plot(t,y);
title('Sinyal 15 Hz dengan Samping 1000 S/s');

fs1  = 10000;
t1 = 0:1/fs1:1;
y1 = a*sin(2*pi*f*t1);
subplot(322);
plot(t1,y1);
title('Sinyal 15 Hz dengan Samping 10000 S/s');

fs2  = 50;
t2 = 0:1/fs2:1;
y2 = a*sin(2*pi*f*t2);
subplot(323);
plot(t2,y2);
title('Sinyal 15 Hz dengan Samping 50 S/s');

fs3  = 2.01*f;
t3 = 0:1/fs3:1;
y3 = a*sin(2*pi*f*t3);
subplot(324);
plot(t3,y3);
title('Sinyal 15 Hz dengan Samping 2.01*f S/s');

fs4  = 2.1*f;
t4 = 0:1/fs4:1;
y4 = a*sin(2*pi*f*t4);
subplot(325);
plot(t4,y4);
title('Sinyal 15 Hz dengan Samping 2.1*f S/s');

fs5  = 1.9*f;
t5 = 0:1/fs5:1;
y5 = a*sin(2*pi*f*t5);
subplot(326);
plot(t5,y5);
title('Sinyal 15 Hz dengan Samping 1.9*f S/s');

z = findpeaks (y);
z1 = findpeaks (y1);
z2 = findpeaks (y2);
z3 = findpeaks (y3);
z4 = findpeaks (y4);
z5 = findpeaks (y5);

frekuensi1=(length(z))/1;
sprintf('Frekuensi sinyal yang terdeteksi dengan sampling rate 1000 S/s : %d Hz', frekuensi1)
frekuensi2=(length(z1))/1;
sprintf('Frekuensi sinyal yang terdeteksi dengan sampling rate 10000 S/s : %d Hz', frekuensi2)
frekuensi3=(length(z2))/1;
sprintf('Frekuensi sinyal yang terdeteksi dengan sampling rate 50 S/s : %d Hz', frekuensi3)
frekuensi4=(length(z3))/1;
sprintf('Frekuensi sinyal yang terdeteksi dengan sampling rate (2.01*f) S/s : %d Hz', frekuensi4)
frekuensi5=(length(z4))/1;
sprintf('Frekuensi sinyal yang terdeteksi dengan sampling rate (2.1*f) S/s : %d Hz', frekuensi5)
frekuensi6=(length(z5))/1;
sprintf('Frekuensi sinyal yang terdeteksi dengan sampling rate (1.9*f) S/s : %d Hz', frekuensi6)


fs = [10:0.1:200];
for k = 1 : length (fs);
    t = 0:1/fs(k):1;
    b = a*sin(2*pi*f*t);
    fd(k) = length(findpeaks(b));
end
figure
plot (fs,fd);
title('Sinyal yang terdeteksi pada 15 Hz');