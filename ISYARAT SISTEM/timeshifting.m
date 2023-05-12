%timeshifting
t= linspace(-5,5);
y=sawtooth(t);%y=sinc(t);
subplot(211);
plot(t,y,'linewidth',2);
xlabel('(a)sinyal asli');
axis([-5 5 -1.2 1.2]);grid on;
subplot(212);
plot(t-2,y);
xlabel('(b)sinyal tertunda');
axis([-5 5 -1.2 1.2]);grid on;