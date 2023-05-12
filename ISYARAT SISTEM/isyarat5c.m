clear all
%sine signal sound
fy=300; %signal frekuency in Hz
wy=2*pi*fy; %signal frequency in rad/s
fs=6000; %sampling frequency in Hz
tiv=1/fs; %time interval between samples;
t=0:tiv:(5-tiv); %time intervals set (5 seconds)
y=5.*sin (wy*t);
y1=y + 2.5*rand(1,length(y));
%filter
a = [1];
b = [0.25 0.25 0.25 0.25];
y2 = filter(b,a,y1);
figure (1);
subplot (311); plot(t,y,'k'); %hold on
axis([0 0.15 -8.5 8.5]);
subplot (312); plot(t,y1);
axis([0 0.15 -8.5 8.5]);
subplot (313); plot(t,y2,'color','red'); %hold on
axis([0 0.15 -8.5 8.5]);
pause
sound(y,fs);
pause
sound(y1,fs);
pause
sound(y2,fs);