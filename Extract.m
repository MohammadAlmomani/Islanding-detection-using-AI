function [Feature, Status,dP]=Extract (Data,n)
Status=[];Feature=[];dP=[];
for i=1:242*2
    k=64*9+1;
    for j=1:12-n
   P=Data{i}.Local(k:k+64*n-1,:);
   F.Mean(j,:)=mean(P); 
   F.Min(j,:)=min(P);
   F.Max(j,:)=max(P);
   F.std(j,:)=std(P); 
   F.Energy(j,:)=sum(P.^2);
    k=k+64;
    end
    FF=[F.Mean, F.Min, F.Max, F.std, F.Energy];
    Feature=[Feature;FF];Status=[Status;zeros(1,1);ones(11-n,1)*Data{i}.status];
    DP=ones(12-n,1).*(Data{i}.dP);
dP=[dP;DP];
end
end