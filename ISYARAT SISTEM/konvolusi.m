% Program konvolusi

nx = -3:3;
X= [3 11 7 0 -1 4 2];
nh = -1:4;
H = [2 3 0 -5 2 1];
nyb = nx(1) + nh(1);
nye = nx(length(X)) + nh(length(H));
ny = [nyb:nye];

figure(1)
subplot(313); stem(nx, X); xlim([min(ny) max(ny)]);
subplot(312); stem(nh, H); xlim([min(ny) max(ny)]);

m = length(X);
n = length(H);
X = [X,zeros(1,m)]; %Data dibuat 2 kali dengan menambah 0
H = [H, zeros(1,n)]; %Data dibuat 2 kali dengan menambah 0

for i=1:n+m-1
    Y(i)=0;
    
    for j=1:m
        if(i-j+1>0)
        Y(i)=Y(i)+X(j)*H(i-j+1);
        else
        end
    end
end

Y
subplot(311);
stem(ny,Y);
ylabel('Y[n]'); xlim([min(ny) max(ny)]);
xlabel('------->n');
title('Convolution of Two Signal without conv function');