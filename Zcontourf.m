function [X,Y,Z]=Zcontourf(Out,Targ,P)
L01=find(P(:,2)==-0.1);P(L01,2)=0;
L01=find(P(:,2)==-0.2);P(L01,2)=0;
L01=find(P(:,2)==-0.3);P(L01,2)=0;
L01=find(P(:,2)==-0.4);P(L01,2)=0;
L01=find(P(:,2)==-0.5);P(L01,2)=0;

X=unique(P(1:242*11,1));
Y=unique(P(:,2));
for i=1:484
    d0=1:11;
    d0=d0+11*i-11;
    Z(i)=(1-(sum(abs(Out(d0)-Targ(d0))))/numel(d0))*100;
end
n=numel(Z)/4;
Z=(Z(1:n)+Z(n+1:2*n)+Z(2*n+1:2:4*n)+Z(2*n+2:2:4*n))/4;
Z=reshape (Z,numel(X),numel(Y));
%   Z=round(Z/10)*10;
% Z(1:2,:)=ceil(Z(1:2,:)/20)*20;
% Z(:,1:2)=ceil(Z(:,1:2)/20)*20;
% Z(end-2:end,:)=ceil(Z(end-2:end,:)/20)*20;
% Z(:,end-2:end)=ceil(Z(:,end-2:end)/20)*20;
% 
% % X=[-36; -33; X; 36;39];
% Y=[-28; -24; Y; 24;28];
% Z=[ 100*ones(2,size(Z,2));Z;100*ones(2,size(Z,2))];
% Z=[ 100*ones(size(Z,1),2),Z,100*ones(size(Z,1),2)];


end