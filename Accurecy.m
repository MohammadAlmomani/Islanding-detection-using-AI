function [A, L1, L2] = Accurecy(T,O,n)
L1=[];L2=[];n=n;k=1;
for j=1:484
for i=1:12-n
if sum(T(k:k+n-1))>=  n/2    
   L1=[L1;1];
else
    L1=[L1;0];
end
if sum(O(k:k+n-1))>=  n/2   
   L2=[L2;1];
else
    L2=[L2;0];
end
k=k+1;
end
k=j*11+1;
end
A =sum(1-abs(L1-L2))/numel(L1)*100;
end