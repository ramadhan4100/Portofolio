%-----------------RAMADHAN PRIHANTONO----------------------
%--------------Operasi sinyal, Sistem, dan Noise-----------------

fs=1000;
x1=3;
x2=0;
% periode
T=(x1+1);
t=0:1/fs:T;
% frekuensi
f=(x2+1)*10;
% tipe sinyal
p= mod(30,3);
% amplitudo
A=x1+x2;
%ploting 1
y=A*sin(2*pi*f*t);
subplot(3,2,1)
plot(t,y)
title('Sinyal Sinusoidal');

%range 0 sampai 1
b=rand(5,1)

%ploting 2
z=b*sin(2*pi*f*t);

subplot(3,2,2)
plot(t,z)
title('Sinyal terkena Noise 0 sampai 1');

%range 0 sampai 0.1
c=0.1*rand(5,1)

%ploting 3
w=c*sin(2*pi*f*t)

subplot(3,2,3)
plot(t,w)
title('Sinyal terkena Noise 0 sampai 0.1');

%range 0 sampai 10
d=10*rand(5,1)

%ploting 4
v=d*sin(2*pi*f*t);

subplot(3,2,4)
plot(t,v)
title('Sinyal terkena Noise 0 sampai 10');

%range -2 sampai 2
e=4*rand(5,1)-2

%ploting 5
u=e*sin(2*pi*f*t);

subplot(3,2,5)
plot(t,u)
title('Sinyal terkena Noise -2 sampai 2');

%range -2 sampai 6
g=8*rand(5,1)-2

%ploting 5
s=g*sin(2*pi*f*t);

subplot(3,2,6)
plot(t,s)
title('Sinyal terkena Noise -2 sampai 6');
