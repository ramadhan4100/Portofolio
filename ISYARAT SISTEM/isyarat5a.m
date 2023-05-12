%%%
%function (ldiv) : calculate inverse z-transform by long division
%example
%       -2      -3
%   (5 - 3z + 4z)
%G(z)---------------------
%       -1      -2
%       (5 - z - 3z)
%a=[5 0 -3 4] , b=[5 -1 -3]
%ldiv(a,b,100)

a = [0 0.5]
b = [1 0 0.25]
y = ldiv(a,b,20)

function funresult=ldiv(a,b,N)
%a numerator
%b denominator
%default order of filter == 20
funresult=[];
if nargin < 3
    if nargin > 1
        N=20;
    else
        disp('usage: M= ldiv(a,b,N)')
        disp('a:numerator, b:denominator and N is the order of the resultant filter')
        return
    end
end
if size(a) < 1
    disp('error: numerator must at least have one element not empty')
    return
end
if size(b) < 1
    disp('error: denominator muust at least have one element not empty')
    return
end
if b(1)==0
    disp('error: the first element of denominator must have nonzero value')
    return 
end    
if size(b) < 2
    funresult=a./b;
end    
for i=length(funresult)+1:N
        a(i)=0;
end
for i = 1 : N
    funresult(i)=a(1)/b(1);
    if length(a)>1
        for k= 2:length(b)
            if k > length (a)
                a(k)=0;
            end
            a(k)=a(k)-funresult(length(funresult))*b(k);
            end
        for i = 1:length(a)-1
            a(i)=a(i+1);
        end
    a=a(1:length(a)-1);
    end 
end        

        