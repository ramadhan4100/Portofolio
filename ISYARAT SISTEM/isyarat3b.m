%3.1.1 Amplitude scaling
T=100;
t=0:1/T:50;
y1=sin(2*pi*t);
a1 = input ('nilai skala amplitude:');
y2 = a1*y1;
subplot (312); plot (t, y2);

%3.1.2 Penjumlahan sinyal

a2 = 0.5;
f2 = 10.;
y3 = a2*sin(2*pi*f2*t + pi/2);
y4 = y1 + y2;
figure (2)
subplot(311);plot(t,y1);
subplot (312);plot (t,y3);
subplot (313); plot(t,y4);
