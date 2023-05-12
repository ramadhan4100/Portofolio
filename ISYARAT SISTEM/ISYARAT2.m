%isyarat2
fs1=30e3;
t1=0:1/fs1:nCyl*1/f;
x1=cos(2*pi*f*t1);

fs2=50e3;
t2=0:1/fs2:nCyl*1/f;
x2=cos(2*pi*f*t2);

subplot(2,1,1);plot(t,x); hold on;
stem(t1,x1);
subplot(2,1,2);plot(t,x); hold on;
stem(t2,x2);