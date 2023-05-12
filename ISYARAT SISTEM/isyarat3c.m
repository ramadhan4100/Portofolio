%y5 = y2 * y3;
%figure (3)
%subplot (311); plot (t,y2);
%subplot (312); plot (t, y3);
%subplot (313); plot(t,y5);

%y6 = 5*y5;
%wavplay(y6);

clc;clf;
Fs=6000;
t=0:1/Fs:0.25;
c=sin(2*pi*523*t*2);
d=sin(2*pi*590*t*2);
e=sin(2*pi*662*t*2);
f=sin(2*pi*490*t*2);
g=sin(2*pi*785*t*2);
a=sin(2*pi*880*t*2);
b=sin(2*pi*988*t*2);
c1=sin(2*pi*523*t*2);
nol = [zeros(size(t))];
nada1 = [d,e,a,b,e,f,c,nol,c,f,g,b,a,e,nol,nol];
nada2 = [c,g,e,f,g,g,b,nol,e,c1,c,c1,f,g,nol];
nada3 = [d,nol,e,nol,f,nol,a,b,g,a,d,c,b,c,a,nol];
nada4 = [a,f,b,c,a,nol,b,a,d,c1,f,c,g,e,b];
lagu=[nada1,nada2,nada3,nada4,nada2,nada1,nada3,nada1];
sound(lagu,Fs)
subplot(211)
plot(lagu)
subplot(212)
stem (lagu)
wavwrite(lagu,'gundul.wav')