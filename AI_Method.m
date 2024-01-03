function  Results= AI_Method(X,y,method)
rand_num = randperm(size(X,1));
X_train = X(rand_num(1:round(0.80*length(rand_num))),:);
y_train = y(rand_num(1:round(0.80*length(rand_num))),:);
X_test = X(rand_num(round(0.8*length(rand_num))+1:end),:);
y_test = y(rand_num(round(0.8*length(rand_num))+1:end),:);
fs=1:size(X,2);
X_train_w_best_feature = X_train(:,fs);
switch method
    case 'SVM'
        tic;
        Md1 =fitcsvm(X_train_w_best_feature,y_train,...
            'KernelFunction','gaussian',...
            'PolynomialOrder', [], ...
            'KernelScale', 1.5, ...
            'BoxConstraint', 1, ...
            'Standardize', true, ...
            'ClassNames', [0; 1]);
        t1=toc;
    case 'KNN'
        tic;
        Md1 = fitcknn(X_train_w_best_feature,y_train,...
            'Distance', 'Euclidean','Exponent', [],...
            'NumNeighbors', 1, 'DistanceWeight', 'Equal',...
            'Standardize', true,'ClassNames', [0; 1]);
        t1=toc;
    case 'Tre'
        tic;
        Md1 =fitctree(X_train_w_best_feature,y_train,...
            'SplitCriterion', 'gdi','MaxNumSplits', 100);
        t1=toc;
    case 'ANN'
        X_train=X_train';y_train=[y_train';abs(1-y_train')];X_test=X_test';y_test=[y_test';abs(1-y_test')];
        net = patternnet([15 10]);net.trainParam.showWindow=0;
        perf=0;
        for i=1:10
            tic;
            [net1, tr1] = train(net,X_train,y_train);
            t=toc;
            y = net1(X_test);
            classes = vec2ind(y);
            perf1=1-sum(abs(y_test(2,:)-(classes-1)))/length(y_test);
            if perf1>perf
                net=net1;tr=tr1;t1=t;perf=perf1;
            end
            if perf1==1
                break
            end
        end
        Md1.net=net;
        Md1.tr=tr;
end
if method == 'ANN'
    accuracy_for_iter=perf*100
else
    X_feature = X_test;
    accuracy_for_iter = sum((predict(Md1,X_feature) == y_test))/length(y_test)*100
end
Results.Md=Md1;
Results.Accuracy=accuracy_for_iter;
Results.time=t1;
