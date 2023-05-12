%********************
%                 Function Approximation Using ANN
% ————————————————————————-
% By     : Sutrisno Ibrahim
% Contact: sutrisno_link@yahoo.com             Last update: May, 2015
%*********************
%  Funtion to be approximate y=f(x)=1+sin(5*pi*x/4);
x=-2:0.1:2;
y=2+cos(2*pi*x/2);
% Plot the function
plot(x,y);
% Create ANN and train it
N_layer=50;
net = newff(x,y,N_layer); %new fedforward net
net.trainParam.lr = 0.0000005;%Learning rate
net.trainParam.epochs = 25;%Membagi data
net.trainParam.goal = 1e-5;% Error toleransi
net = train(net,x,y);% ini ditraining net
% Simulate / testing
y_ann = sim(net,x);
% Plot the results
hold on
plot(x,y_ann,'o'), xlabel('x'),ylabel('f(x)');
title('Function Approximation Using ANN');
hold off