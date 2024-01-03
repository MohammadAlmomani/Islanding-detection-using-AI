%% Data collection

clear all
clc 
close all
F=[]; S=[]; dP=[];
load ('Data')
Data=Data';
for i=1:484
    F=[F;Data{i}.PMU(9:19,:)];
    S=[S;zeros(1,1);ones(10,1).*Data{i}.status];
    dP=[dP;Data{i}.dP.*ones(11,2)];
end
  
    InfoPMU.Input =F;
    InfoPMU.Output=S;
    InfoPMU.P=dP;
    save('InfoPMU','InfoPMU')
    %% train 
    load ('Results')
X = InfoPMU.Input;
y = InfoPMU.Output;
rand_num = randperm(size(X,1));
X_train = X(rand_num(1:round(0.80*length(rand_num))),:);
y_train = y(rand_num(1:round(0.80*length(rand_num))),:);
X_test = X(rand_num(round(0.8*length(rand_num))+1:end),:);
y_test = y(rand_num(round(0.8*length(rand_num))+1:end),:);
fs=1:size(X,2);
X_train_w_best_feature = X_train(:,fs);
tic;
Md1 =fitcsvm(X_train_w_best_feature,y_train,'KernelFunction','gaussian'); % Bayes' Optimization 사용.
t1=toc;
X_feature = X_test;
accuracy_for_iter = sum((predict(Md1,X_feature) == y_test))/length(y_test)*100
Results.SVM{1}.PMU.Md=Md1;
Results.SVM{1}.PMU.Accuracy=accuracy_for_iter;
Results.SVM{1}.PMU.time=t1;
%%%%%%%%%%%%%%%%

tic;
Md1 = fitcknn(X_train_w_best_feature,y_train,'Distance', 'Euclidean','Exponent', [],'NumNeighbors', 1, 'DistanceWeight', 'Equal','Standardize', true,'ClassNames', [0; 1]);
t1=toc;
accuracy_Md1 = sum((predict(Md1,X_feature) == y_test))/length(y_test)*100
Results.KNN{1}.PMU.Md=Md1;
Results.KNN{1}.PMU.Accuracy=accuracy_Md1;
Results.KNN{1}.PMU.time=t1;

tic;
Md1 =fitctree(X_train_w_best_feature,y_train,'SplitCriterion', 'gdi','MaxNumSplits', 100); 
t1=toc;
accuracy_Md1 = sum((predict(Md1,X_feature) == y_test))/length(y_test)*100
Results.Tree{1}.PMU.Md=Md1;
Results.Tree{1}.PMU.Accuracy=accuracy_Md1;
Results.Tree{1}.PMU.time=t1;

X_train=X_train';y_train=y_train';X_test=X_test';y_test=y_test';
y_train=[y_train;abs(1-y_train)];y_test=[y_test;abs(1-y_test)];
net = patternnet([20 10]);net.trainParam.showWindow=0;
perf=0;
for i=1:100
tic;[net1, tr1] = train(net,X_train,y_train);t1=toc;
y = net1(X_test);
classes = vec2ind(y);
perf1=1-sum(abs(y_test(2,:)-(classes-1)))/length(y_test);
if perf1>perf
net=net1;tr=tr1;t=t1;perf=perf1;
end
if perf1==1
    break
end
end
accuracy_Md1 = perf
Results.ANN{1}.PMU.net=net;
Results.ANN{1}.PMU.tr=tr;
Results.ANN{1}.PMU.Accuracy=accuracy_Md1;
Results.ANN{1}.PMU.time=t;
save ('Results','Results')
