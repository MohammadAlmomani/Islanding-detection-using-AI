clear
clc
load ('Results')
load ('Info2')

%% Table 3-7  number of samples 
T=Info2.Y{1};
Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
for i=1:10
[A(i), T1, O1] = Accurecy(T,O,i);
Islanding_Events(i,1)=sum(T1');
Non_Islanding_Events(i,1)=numel(T1)-sum(T1');
total(i,1)=numel(T1);
end

Table=[Islanding_Events,Non_Islanding_Events,total];
%% Scatter
figure (1) 
Data=Info2.Feature{1}.PCAL2;Y=Info2.Y{1}; 
X1=Data(:,1);X2=Data(:,2);X3=Data(:,3);X4=Data(:,4);X5=Data(:,5);
subplot (221)
scatter (X1,X2,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 2')
title ('PCA')

subplot (222)
scatter (X1,X3,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 3')
title ('PCA')

subplot (223)
scatter (X1,X4,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 4')
title ('PCA')

subplot (224)
scatter (X1,X5,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 5')
title ('PCA')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (2) 
Data=Info2.Feature{1}.LDAL2;Y=Info2.Y{1}; 
X1=Data(:,1);X2=Data(:,2);X3=Data(:,3);X4=Data(:,4);X5=Data(:,5);
subplot (221)
scatter (X1,X2,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 2')
title ('LDA')

subplot (222)
scatter (X1,X3,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 3')
title ('LDA')

subplot (223)
scatter (X1,X4,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 4')
title ('LDA')

subplot (224)
scatter (X1,X5,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 5')
title ('LDA')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (3) 
Data=Info2.Feature{1}.MDSL2;Y=Info2.Y{1}; 
X1=Data(:,1);X2=Data(:,2);X3=Data(:,3);X4=Data(:,4);X5=Data(:,5);
subplot (221)
scatter (X1,X2,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 2')
title ('MDS')

subplot (222)
scatter (X1,X3,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 3')
title ('MDS')

subplot (223)
scatter (X1,X4,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 4')
title ('MDS')

subplot (224)
scatter (X1,X5,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 5')
title ('MDS')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (4) 
Data=Info2.Feature{1}.ProbPCAL2;Y=Info2.Y{1}; 
X1=Data(:,1);X2=Data(:,2);X3=Data(:,3);X4=Data(:,4);X5=Data(:,5);
subplot (221)
scatter (X1,X2,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 2')
title ('ProbPCA')

subplot (222)
scatter (X1,X3,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 3')
title ('ProbPCA')

subplot (223)
scatter (X1,X4,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 4')
title ('ProbPCA')

subplot (224)
scatter (X1,X5,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 5')
title ('ProbPCA')
%%
%%%%%%%%% ROC
close all
figure (1)
subplot (221)
hold on
T=Info2.Y{1};
Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('KNN-PCA ')
grid on
box on

subplot (222)
hold on
T=Info2.Y{1};
Md1=Results.KNN{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('KNN-LDA ')
grid on
box on

subplot (223)
hold on
T=Info2.Y{1};
Md1=Results.KNN{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('KNN-MDS ')
grid on
box on

subplot (224)
hold on
T=Info2.Y{1};
Md1=Results.KNN{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('KNN-ProbPCA ')
grid on
box on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (2)
subplot (221)
hold on
T=Info2.Y{1};
Md1=Results.SVM{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('SVM-PCA ')
grid on
box on

subplot (222)
hold on
T=Info2.Y{1};
Md1=Results.SVM{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('SVM-LDA ')
grid on
box on

subplot (223)
hold on
T=Info2.Y{1};
Md1=Results.SVM{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('SVM-MDS ')
grid on
box on

subplot (224)
hold on
T=Info2.Y{1};
Md1=Results.SVM{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('SVM-ProbPCA ')
grid on
box on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (3)
subplot (221)
hold on
T=Info2.Y{1};
Md1=Results.Tree{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('DT-PCA ')
grid on
box on

subplot (222)
hold on
T=Info2.Y{1};
Md1=Results.Tree{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('DT-LDA ')
grid on
box on

subplot (223)
hold on
T=Info2.Y{1};
Md1=Results.Tree{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('DT-MDS ')
grid on
box on

subplot (224)
hold on
T=Info2.Y{1};
Md1=Results.Tree{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('DT-ProbPCA ')
grid on
box on

%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (4)
subplot (221)
hold on
T=Info2.Y{1};
Md1=Results.ANN{1}.PCAL2.Md.net;
Input1=Info2.Feature{1}.PCAL2;
y = Md1(Input1');
O = abs(1-(vec2ind(y)-1));
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('ANN-PCA ')
grid on
box on

subplot (222)
hold on
T=Info2.Y{1};
Md1=Results.ANN{1}.LDAL2.Md.net;
Input1=Info2.Feature{1}.LDAL2;
y = Md1(Input1');
O = abs(1-(vec2ind(y)-1));
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('ANN-LDA ')
grid on
box on

subplot (223)
hold on
T=Info2.Y{1};
Md1=Results.ANN{1}.MDSL2.Md.net;
Input1=Info2.Feature{1}.MDSL2;
y = Md1(Input1');
O = abs(1-(vec2ind(y)-1));
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*50,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('ANN-MDS ')
grid on
box on

subplot (224)
hold on
T=Info2.Y{1};
Md1=Results.ANN{1}.ProbPCAL2.Md.net;
Input1=Info2.Feature{1}.ProbPCAL2;
y = Md1(Input1');
O = abs(1-(vec2ind(y)-1));
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 1 0 100])
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('ANN-ProbPCA ')
grid on
box on
%% Accurecy 
close all
T=Info2.Y{1};
Md1=Results.ANN{1}.PCAL2.Md.net;
Input1=Info2.Feature{1}.PCAL2;
y = Md1(Input1');
O = abs(1-(vec2ind(y)-1));clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
ANN_PCA=nonzeros(A);
T=Info2.Y{1};
Md1=Results.ANN{1}.LDAL2.Md.net;
Input1=Info2.Feature{1}.LDAL2;
y = Md1(Input1');
O = abs(1-(vec2ind(y)-1));clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
ANN_LDA=nonzeros(A);
T=Info2.Y{1};
Md1=Results.ANN{1}.MDSL2.Md.net;
Input1=Info2.Feature{1}.MDSL2;
y = Md1(Input1');O = abs(1-(vec2ind(y)-1));
clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
ANN_MDS=nonzeros(A);
T=Info2.Y{1};
Md1=Results.ANN{1}.ProbPCAL2.Md.net;
Input1=Info2.Feature{1}.ProbPCAL2;
y = Md1(Input1');
O = abs(1-(vec2ind(y)-1));clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
ANN_ProbPCA=nonzeros(A);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=Info2.Y{1};
Md1=Results.Tree{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
Tree_PCA=nonzeros(A);

T=Info2.Y{1};
Md1=Results.Tree{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
Tree_LDA=nonzeros(A);

T=Info2.Y{1};
Md1=Results.Tree{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
Tree_MDS=nonzeros(A);

T=Info2.Y{1};
Md1=Results.Tree{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
Tree_ProbPCA=nonzeros(A);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=Info2.Y{1};
Md1=Results.SVM{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
SVM_PCA=nonzeros(A);

T=Info2.Y{1};
Md1=Results.SVM{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
SVM_LDA=nonzeros(A);

T=Info2.Y{1};
Md1=Results.SVM{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
SVM_MDS=nonzeros(A);

T=Info2.Y{1};
Md1=Results.SVM{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
SVM_ProbPCA=nonzeros(A);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=Info2.Y{1};
Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
KNN_PCA=nonzeros(A);

T=Info2.Y{1};
Md1=Results.KNN{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
KNN_LDA=nonzeros(A);

T=Info2.Y{1};
Md1=Results.KNN{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
KNN_MDS=nonzeros(A);

T=Info2.Y{1};
Md1=Results.KNN{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);clear A
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
KNN_ProbPCA=nonzeros(A);
%
close all
figure (1)
hold on
t=1:2:10;
x1=SVM_PCA;x2=Tree_PCA;x3=KNN_PCA;x4=ANN_PCA;
plot (t,x1,'b-','LineWidth',2)
plot(t,x2,'g:','LineWidth',2)
plot(t,x3,'r-.','LineWidth',2)
plot(t,x4,'c--','LineWidth',2)
grid on 
box on 
xlabel ('sampling (cycle)')
ylabel('Accurecy (%)')
title ('PCA')
legend ('SVM','DT','KNN','ANN')

figure (2)
hold on
x1=SVM_LDA;x2=Tree_LDA;x3=KNN_LDA;x4=ANN_LDA;
plot (t,x1,'b-','LineWidth',2)
plot(t,x2,'g:','LineWidth',2)
plot(t,x3,'r-.','LineWidth',2)
plot(t,x4,'c--','LineWidth',2)
grid on 
box on 
xlabel ('sampling (cycle)')
ylabel('Accurecy (%)')
title ('LDA')
legend ('SVM','DT','KNN','ANN')


figure (3)
hold on
x1=SVM_MDS;x2=Tree_MDS;x3=KNN_MDS;x4=ANN_MDS;
plot (t,x1,'b-','LineWidth',2)
plot(t,x2,'g:','LineWidth',2)
plot(t,x3,'r-.','LineWidth',2)
plot(t,x4,'c--','LineWidth',2)
grid on 
box on 
xlabel ('sampling (cycle)')
ylabel('Accurecy (%)')
title ('MDS')
legend ('SVM','DT','KNN','ANN')

figure (4)
hold on
x1=SVM_ProbPCA;x2=Tree_ProbPCA;x3=KNN_ProbPCA;x4=ANN_ProbPCA;
plot (t,x1,'b-','LineWidth',2)
plot(t,x2,'g:','LineWidth',2)
plot(t,x3,'r-.','LineWidth',2)
plot(t,x4,'c--','LineWidth',2)
grid on 
box on 
xlabel ('sampling (cycle)')
ylabel('Accurecy (%)')
title ('ProbPCA')
legend ('SVM','DT','KNN','ANN')

% Table 3-8 Accurecy at cycle 7 
SVM=[SVM_PCA(1),SVM_LDA(1), SVM_MDS(1), SVM_ProbPCA(1)];
KNN=[KNN_PCA(1),KNN_LDA(1), KNN_MDS(1), KNN_ProbPCA(1)];
DT=[Tree_PCA(1),Tree_LDA(1), Tree_MDS(1), Tree_ProbPCA(1)];
ANN=[ANN_PCA(1),ANN_LDA(1), ANN_MDS(1),ANN_ProbPCA(1)];

Table=[SVM;DT;KNN;ANN];

%%
%%%%%%% Confusion  
close all
% figure (1)
% hold on
T=Info2.Y{1};
Md1=Results.SVM{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
[A, T1, O1] = Accurecy(T,O,1);
C11=confusionmat(T1,O1);

Md1=Results.SVM{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);
[A, T1, O1] = Accurecy(T,O,1);
C12=confusionmat(T1,O1);

Md1=Results.SVM{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
[A, T2, O2] = Accurecy(T,O,1);
C13=confusionmat(T2,O2);

Md1=Results.SVM{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
[A, T3, O3] = Accurecy(T,O,1);
C14=confusionmat(T3,O3);


Md1=Results.Tree{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
[A, T1, O1] = Accurecy(T,O,1);
C21=confusionmat(T1,O1);

Md1=Results.Tree{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);
[A, T1, O1] = Accurecy(T,O,1);
C22=confusionmat(T1,O1);

Md1=Results.Tree{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
[A, T2, O2] = Accurecy(T,O,1);
C23=confusionmat(T2,O2);

Md1=Results.Tree{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
[A, T3, O3] = Accurecy(T,O,1);
C24=confusionmat(T3,O3);



Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
[A, T1, O1] = Accurecy(T,O,1);
C31=confusionmat(T1,O1);

Md1=Results.KNN{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);
[A, T1, O1] = Accurecy(T,O,1);
C32=confusionmat(T1,O1);

Md1=Results.KNN{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
[A, T2, O2] = Accurecy(T,O,1);
C33=confusionmat(T2,O2);

Md1=Results.KNN{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
[A, T3, O3] = Accurecy(T,O,1);
C34=confusionmat(T3,O3);



Md1=Results.ANN{1}.PCAL2.Md.net;
Input1=Info2.Feature{1}.PCAL2;
y = Md1(Input1');O = abs(1-(vec2ind(y)-1));
[A, T1, O1] = Accurecy(T,O,1);
C41=confusionmat(T1,O1);

Md1=Results.ANN{1}.LDAL2.Md.net;
Input1=Info2.Feature{1}.LDAL2;
y = Md1(Input1');O = abs(1-(vec2ind(y)-1));
[A, T1, O1] = Accurecy(T,O,1);
C42=confusionmat(T1,O1);

Md1=Results.ANN{1}.MDSL2.Md.net;
Input1=Info2.Feature{1}.MDSL2;
y = Md1(Input1');O = abs(1-(vec2ind(y)-1));
[A, T2, O2] = Accurecy(T,O,1);
C43=confusionmat(T2,O2);

Md1=Results.ANN{1}.ProbPCAL2.Md.net;
Input1=Info2.Feature{1}.ProbPCAL2;
y = Md1(Input1');O = abs(1-(vec2ind(y)-1));
[A, T3, O3] = Accurecy(T,O,1);
C44=confusionmat(T3,O3);





% confusionchart(C,[0 1])
Islan=sum(T1);
Non_Islan=abs(sum(T1-1));
TN11=C11(1,1)/Non_Islan;FN11=C11(1,2)/Non_Islan;FP11=C11(2,1)/Islan;TP11=C11(2,2)/Islan;CP11=(TP11+TN11)/2;ICP11=(FP11+FN11)/2;
TN12=C12(1,1)/Non_Islan;FN12=C12(1,2)/Non_Islan;FP12=C12(2,1)/Islan;TP12=C12(2,2)/Islan;CP12=(TP12+TN12)/2;ICP12=(FP12+FN12)/2;
TN13=C13(1,1)/Non_Islan;FN13=C13(1,2)/Non_Islan;FP13=C13(2,1)/Islan;TP13=C13(2,2)/Islan;CP13=(TP13+TN13)/2;ICP13=(FP13+FN13)/2;
TN14=C14(1,1)/Non_Islan;FN14=C14(1,2)/Non_Islan;FP14=C14(2,1)/Islan;TP14=C14(2,2)/Islan;CP14=(TP14+TN14)/2;ICP14=(FP14+FN14)/2;

TN21=C21(1,1)/Non_Islan;FN21=C21(1,2)/Non_Islan;FP21=C21(2,1)/Islan;TP21=C21(2,2)/Islan;CP21=(TP21+TN21)/2;ICP21=(FP21+FN21)/2;
TN22=C22(1,1)/Non_Islan;FN22=C22(1,2)/Non_Islan;FP22=C22(2,1)/Islan;TP22=C22(2,2)/Islan;CP22=(TP22+TN22)/2;ICP22=(FP22+FN22)/2;
TN23=C23(1,1)/Non_Islan;FN23=C23(1,2)/Non_Islan;FP23=C23(2,1)/Islan;TP23=C23(2,2)/Islan;CP23=(TP23+TN23)/2;ICP23=(FP23+FN23)/2;
TN24=C24(1,1)/Non_Islan;FN24=C24(1,2)/Non_Islan;FP24=C24(2,1)/Islan;TP24=C24(2,2)/Islan;CP24=(TP24+TN24)/2;ICP24=(FP24+FN24)/2;

TN31=C31(1,1)/Non_Islan;FN31=C31(1,2)/Non_Islan;FP31=C31(2,1)/Islan;TP31=C31(2,2)/Islan;CP31=(TP31+TN31)/2;ICP31=(FP31+FN31)/2;
TN32=C32(1,1)/Non_Islan;FN32=C32(1,2)/Non_Islan;FP32=C32(2,1)/Islan;TP32=C32(2,2)/Islan;CP32=(TP32+TN32)/2;ICP32=(FP32+FN32)/2;
TN33=C33(1,1)/Non_Islan;FN33=C33(1,2)/Non_Islan;FP33=C33(2,1)/Islan;TP33=C33(2,2)/Islan;CP33=(TP33+TN33)/2;ICP33=(FP33+FN33)/2;
TN34=C34(1,1)/Non_Islan;FN34=C34(1,2)/Non_Islan;FP34=C34(2,1)/Islan;TP34=C34(2,2)/Islan;CP34=(TP34+TN34)/2;ICP34=(FP34+FN34)/2;


TN41=C41(1,1)/Non_Islan;FN41=C41(1,2)/Non_Islan;FP41=C41(2,1)/Islan;TP41=C41(2,2)/Islan;CP41=(TP41+TN41)/2;ICP41=(FP41+FN41)/2;
TN42=C42(1,1)/Non_Islan;FN42=C42(1,2)/Non_Islan;FP42=C42(2,1)/Islan;TP42=C42(2,2)/Islan;CP42=(TP42+TN42)/2;ICP42=(FP42+FN42)/2;
TN43=C43(1,1)/Non_Islan;FN43=C43(1,2)/Non_Islan;FP43=C43(2,1)/Islan;TP43=C43(2,2)/Islan;CP43=(TP43+TN43)/2;ICP43=(FP43+FN43)/2;
TN44=C44(1,1)/Non_Islan;FN44=C44(1,2)/Non_Islan;FP44=C44(2,1)/Islan;TP44=C44(2,2)/Islan;CP44=(TP44+TN44)/2;ICP44=(FP44+FN44)/2;

TABLE=[TP11, TN11, FP11, FN11,CP11,ICP11;TP12, TN12, FP12, FN12,CP12,ICP12;TP13, TN13, FP13, FN13,CP13,ICP13;TP14, TN14, FP14, FN14,CP14,ICP14;...
TP21, TN21, FP21, FN21,CP21,ICP21;TP22, TN22, FP22, FN22,CP22,ICP22;TP23, TN23, FP23, FN23,CP23,ICP23;TP24, TN24, FP24, FN24,CP24,ICP24;...
TP31, TN31, FP31, FN31,CP31,ICP31;TP32, TN32, FP32, FN32,CP32,ICP32;TP33, TN33, FP33, FN33,CP33,ICP33;TP34, TN34, FP34, FN34,CP34,ICP34;...
TP41, TN41, FP41, FN41,CP41,ICP41;TP42, TN42, FP42, FN42,CP42,ICP42;TP43, TN43, FP43, FN43,CP43,ICP43;TP44, TN44, FP44, FN44,CP44,ICP44;...
]*100;
TABLE=round(TABLE*100)/100;
%% Performance Figures 
clear
clc
load ('Results')
load ('Info2')

T=Info2.Y{1};
Md1=Results.SVM{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);k=1;
for i=1:2:10
[A, T1, O1] = Accurecy(T,O,i);
C1=confusionmat(T1,O1);
Islan=sum(T1);
Non_Islan=abs(sum(T1-1));
TN1(k)=C1(1,1)/Non_Islan;FN1(k)=C1(1,2)/Non_Islan;FP1(k)=C1(2,1)/Islan;TP1(k)=C1(2,2)/Islan;%CP1(k)=(TP1+TN1)/2;ICP1(k)=(FP1+FN1)/2;
k=k+1;
end

Md1=Results.SVM{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);k=1;
for i=1:2:10
[A, T2, O2] = Accurecy(T,O,i);
C2=confusionmat(T2,O2);
Islan=sum(T2);
Non_Islan=abs(sum(T2-1));
TN2(k)=C2(1,1)/Non_Islan;FN2(k)=C2(1,2)/Non_Islan;FP2(k)=C2(2,1)/Islan;TP2(k)=C2(2,2)/Islan;%CP2(k)=(TP2+TN2)/2;ICP2(K)=(FP2+FN2)/2;
k=k+1;
end

Md1=Results.SVM{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);k=1;
for i=1:2:10
[A, T2, O2] = Accurecy(T,O,i);
C2=confusionmat(T2,O2);
Islan=sum(T2);
Non_Islan=abs(sum(T2-1));
TN3(k)=C2(1,1)/Non_Islan;FN3(k)=C2(1,2)/Non_Islan;FP3(k)=C2(2,1)/Islan;TP3(k)=C2(2,2)/Islan;%CP3(k)=(TP3+TN3)/2;ICP3(K)=(FP3+FN3)/2;
k=k+1;
end

Md1=Results.Tree{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);k=1;
for i=1:2:10
[A, T2, O2] = Accurecy(T,O,i);
C2=confusionmat(T2,O2);
Islan=sum(T2);
Non_Islan=abs(sum(T2-1));
TN4(k)=C2(1,1)/Non_Islan;FN4(k)=C2(1,2)/Non_Islan;FP4(k)=C2(2,1)/Islan;TP4(k)=C2(2,2)/Islan;%CP4(k)=(TP4+TN4)/2;ICP4(K)=(FP4+FN4)/2;
k=k+1;
end



Md1=Results.Tree{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);k=1;
for i=1:2:10
[A, T2, O2] = Accurecy(T,O,i);
C2=confusionmat(T2,O2);
Islan=sum(T2);
Non_Islan=abs(sum(T2-1));
TN5(k)=C2(1,1)/Non_Islan;FN5(k)=C2(1,2)/Non_Islan;FP5(k)=C2(2,1)/Islan;TP5(k)=C2(2,2)/Islan;%CP4(k)=(TP4+TN4)/2;ICP4(K)=(FP4+FN4)/2;
k=k+1;
end


Md1=Results.Tree{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);k=1;
for i=1:2:10
[A, T2, O2] = Accurecy(T,O,i);
C2=confusionmat(T2,O2);
Islan=sum(T2);
Non_Islan=abs(sum(T2-1));
TN6(k)=C2(1,1)/Non_Islan;FN6(k)=C2(1,2)/Non_Islan;FP6(k)=C2(2,1)/Islan;TP6(k)=C2(2,2)/Islan;%CP4(k)=(TP4+TN4)/2;ICP4(K)=(FP4+FN4)/2;
k=k+1;
end


Md1=Results.KNN{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);k=1;
for i=1:2:10
[A, T2, O2] = Accurecy(T,O,i);
C2=confusionmat(T2,O2);
Islan=sum(T2);
Non_Islan=abs(sum(T2-1));
TN7(k)=C2(1,1)/Non_Islan;FN7(k)=C2(1,2)/Non_Islan;FP7(k)=C2(2,1)/Islan;TP7(k)=C2(2,2)/Islan;%CP5(k)=(TP5+TN5)/2;ICP5(K)=(FP5+FN5)/2;
k=k+1;
end

Md1=Results.KNN{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);k=1;
for i=1:2:10
[A, T2, O2] = Accurecy(T,O,i);
C2=confusionmat(T2,O2);
Islan=sum(T2);
Non_Islan=abs(sum(T2-1));
TN8(k)=C2(1,1)/Non_Islan;FN8(k)=C2(1,2)/Non_Islan;FP8(k)=C2(2,1)/Islan;TP8(k)=C2(2,2)/Islan;%CP6(k)=(TP6+TN6)/2;ICP6(K)=(FP6+FN6)/2;
k=k+1;
end
t=1:2:10;
%
close all
figure (1)
subplot (221)
hold on 
plot(t,TP1*100,'b-','LineWidth',2)
plot(t,TP2*100,'g:','LineWidth',2)
plot(t,TP3*100,'r-.','LineWidth',2)
plot(t,TP4*100,'c--','LineWidth',2)
plot(t,TP5*100,'m:','LineWidth',2)
plot(t,TP6*100,'k-.','LineWidth',2)
plot(t,TP7*100,'k-.','LineWidth',2)
plot(t,TP8*100,'k-.','LineWidth',2)
grid on 
box on 
axis ([1 9 99.9 100])
xlabel ('Sampling (Cycles)')
ylabel ('TP(%)')
legend ('SVM-PCA','SVM-MDS','SVM-ProbPCA','DT-PCA','DT-MDS','DT-ProbPCA','KNN-MDS','KNN-ProbPCA','Location','Best')


subplot (222)
hold on 
plot(t,TN1*100,'b-','LineWidth',2)
plot(t,TN2*100,'g:','LineWidth',2)
plot(t,TN3*100,'r-.','LineWidth',2)
plot(t,TN4*100,'c--','LineWidth',2)
plot(t,TN5*100,'m:','LineWidth',2)
plot(t,TN6*100,'k-.','LineWidth',2)
plot(t,TN7*100,'k-.','LineWidth',2)
plot(t,TN8*100,'k-.','LineWidth',2)

grid on 
box on 
axis ([1 9 99.9 100])
xlabel ('Sampling (Cycles)')
ylabel ('TN(%)')
legend ('SVM-PCA','SVM-MDS','SVM-ProbPCA','DT-PCA','DT-MDS','DT-ProbPCA','KNN-MDS','KNN-ProbPCA','Location','Best')

subplot (223)
hold on 
plot(t,FP1*100,'b-','LineWidth',2)
plot(t,FP2*100,'g:','LineWidth',2)
plot(t,FP3*100,'r-.','LineWidth',2)
plot(t,FP4*100,'c--','LineWidth',2)
plot(t,FP5*100,'m:','LineWidth',2)
plot(t,FP6*100,'k-.','LineWidth',2)
plot(t,FP7*100,'k-.','LineWidth',2)
plot(t,FP8*100,'k-.','LineWidth',2)


grid on 
box on 
axis ([1 9 0 0.1])
xlabel ('Sampling (Cycles)')
ylabel ('FP(%)')
legend ('SVM-PCA','SVM-MDS','SVM-ProbPCA','DT-PCA','DT-MDS','DT-ProbPCA','KNN-MDS','KNN-ProbPCA','Location','Best')


subplot (224)
hold on 
plot(t,FN1*100,'b-','LineWidth',2)
plot(t,FN2*100,'g:','LineWidth',2)
plot(t,FN3*100,'r-.','LineWidth',2)
plot(t,FN4*100,'c--','LineWidth',2)
plot(t,FN5*100,'m:','LineWidth',2)
plot(t,FN6*100,'k-.','LineWidth',2)
plot(t,FN7*100,'k-.','LineWidth',2)
plot(t,FN8*100,'k-.','LineWidth',2)

grid on 
box on 
axis ([1 9 0 0.1])
xlabel ('Sampling (Cycles)')
ylabel ('FN(%)')
legend ('SVM-PCA','SVM-MDS','SVM-ProbPCA','DT-PCA','DT-MDS','DT-ProbPCA','KNN-MDS','KNN-ProbPCA','Location','Best')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (2)
subplot (221)
hold on 
plot(t,(TP1+TN1)/2*100,'b-','LineWidth',2)
plot(t,(TP2+TN2)/2*100,'g:','LineWidth',2)
plot(t,(TP3+TN3)/2*100,'r-.','LineWidth',2)
plot(t,(TP4+TN4)/2*100,'c--','LineWidth',2)
plot(t,(TP5+TN5)/2*100,'m:','LineWidth',2)
plot(t,(TP6+TN6)/2*100,'k-.','LineWidth',2)
plot(t,(TP7+TN7)/2*100,'k-.','LineWidth',2)
plot(t,(TP8+TN8)/2*100,'k-.','LineWidth',2)

grid on 
box on 
axis ([1 9 99.9 100])
xlabel ('Sampling (Cycles)')
ylabel ('CP(%)')
legend ('SVM-PCA','SVM-MDS','SVM-ProbPCA','DT-PCA','DT-MDS','DT-ProbPCA','KNN-MDS','KNN-ProbPCA','Location','Best')


subplot (222)
hold on 
plot(t,(FN1+FP1)/2*100,'b-','LineWidth',2)
plot(t,(FN2+FP2)/2*100,'g:','LineWidth',2)
plot(t,(FN3+FP3)/2*100,'r-.','LineWidth',2)
plot(t,(FN4+FP4)/2*100,'c--','LineWidth',2)
plot(t,(FN5+FP5)/2*100,'m:','LineWidth',2)
plot(t,(FN6+FP6)/2*100,'k-.','LineWidth',2)
plot(t,(FN7+FP7)/2*100,'k-.','LineWidth',2)
plot(t,(FN8+FP8)/2*100,'k-.','LineWidth',2)

grid on 
box on 
axis ([1 9 0 0.1])
xlabel ('Sampling (Cycles)')
ylabel ('ICP(%)')
legend ('SVM-PCA','SVM-MDS','SVM-ProbPCA','DT-PCA','DT-MDS','DT-ProbPCA','KNN-MDS','KNN-ProbPCA','Location','Best')

subplot (223)
hold on 
plot(t,(TP1+TN1)./(FP1+FN1+TN1+TP1)*100,'b-','LineWidth',2)
plot(t,(TP2+TN2)./(FP2+FN2+TN2+TP2)*100,'g:','LineWidth',2)
plot(t,(TP3+TN3)./(FP3+FN3+TN3+TP3)*100,'r-.','LineWidth',2)
plot(t,(TP4+TN4)./(FP4+FN4+TN4+TP4)*100,'c--','LineWidth',2)
plot(t,(TP5+TN5)./(FP5+FN5+TN5+TP5)*100,'m:','LineWidth',2)
plot(t,(TP6+TN6)./(FP6+FN6+TN6+TP6)*100,'k-.','LineWidth',2)
plot(t,(TP7+TN7)./(FP6+FN6+TN6+TP6)*100,'k-.','LineWidth',2)
plot(t,(TP8+TN8)./(FP6+FN6+TN6+TP6)*100,'k-.','LineWidth',2)

grid on 
box on 
axis ([1 9 99.9 100])
xlabel ('Sampling (Cycles)')
ylabel ('Accuracy(%)')
legend ('SVM-PCA','SVM-MDS','SVM-ProbPCA','DT-PCA','DT-MDS','DT-ProbPCA','KNN-MDS','KNN-ProbPCA','Location','Best')


subplot (224)
hold on 
plot(t,(FP1+FN1)./(FP1+FN1+TN1+TP1)*100,'b-','LineWidth',2)
plot(t,(FP2+FN2)./(FP2+FN2+TN2+TP2)*100,'g:','LineWidth',2)
plot(t,(FP3+FN3)./(FP3+FN3+TN3+TP3)*100,'r-.','LineWidth',2)
plot(t,(FP4+FN4)./(FP4+FN4+TN4+TP4)*100,'c--','LineWidth',2)
plot(t,(FP5+FN5)./(FP5+FN5+TN5+TP5)*100,'m:','LineWidth',2)
plot(t,(FP6+FN6)./(FP6+FN6+TN6+TP6)*100,'k-.','LineWidth',2)
plot(t,(FP7+FN7)./(FP6+FN6+TN6+TP6)*100,'k-.','LineWidth',2)
plot(t,(FP8+FN8)./(FP6+FN6+TN6+TP6)*100,'k-.','LineWidth',2)

grid on 
box on 
axis ([1 9 0 0.1])
xlabel ('Sampling (Cycles)')
ylabel ('Error(%)')
legend ('SVM-PCA','SVM-MDS','SVM-ProbPCA','DT-PCA','DT-MDS','DT-ProbPCA','KNN-MDS','KNN-ProbPCA','Location','Best')

%% NDZ 
close all
Delt_P=Info2.dP{1};
figure (1)
T=Info2.Y{1};
Md1=Results.SVM{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
[X,Y,Z]=Zcontourf(O,T,Delt_P);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',1)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('SVM-PCA')
grid on 
box on

figure (2)
T=Info2.Y{1};
Md1=Results.SVM{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
[X,Y,Z]=Zcontourf(O,T,Delt_P);
% Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',1)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('SVM-MDS')
grid on 
box on

figure (3)
T=Info2.Y{1};
Md1=Results.SVM{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
[X,Y,Z]=Zcontourf(O,T,Delt_P);
% Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',1)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('SVM-ProbPCA')
grid on 
box on



figure (4)
T=Info2.Y{1};
Md1=Results.Tree{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
[X,Y,Z]=Zcontourf(O,T,Delt_P);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',1)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('DT-PCA')
grid on 
box on

figure (5)
T=Info2.Y{1};
Md1=Results.Tree{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
[X,Y,Z]=Zcontourf(O,T,Delt_P);
% Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',1)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('DT-MDS')
grid on 
box on

figure (6)
T=Info2.Y{1};
Md1=Results.Tree{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
[X,Y,Z]=Zcontourf(O,T,Delt_P);
% Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',1)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('DT-ProbPCA')
grid on 
box on




figure (7)
T=Info2.Y{1};
Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
[X,Y,Z]=Zcontourf(O,T,Delt_P);
% Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',1)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-PCA')
grid on 
box on

figure (8)
T=Info2.Y{1};
Md1=Results.KNN{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
[X,Y,Z]=Zcontourf(O,T,Delt_P);
% Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',1)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-MDS')
grid on 
box on

figure (9)
T=Info2.Y{1};
Md1=Results.KNN{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
[X,Y,Z]=Zcontourf(O,T,Delt_P);
% Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',1)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-ProbPCA')
grid on 
box on
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%PMU 
%%%%%%%%% ROC
clear
clc
load ('Results')
load ('InfoPMU')
close all
figure (1)
subplot (221)
hold on
T=InfoPMU.Output;
Md1=Results.SVM{1}.PMU.Md;
Input1=InfoPMU.Input;
O=predict (Md1,Input1);
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('PMU-SVM ')
grid on
box on

subplot (222)
hold on
T=InfoPMU.Output;
Md1=Results.KNN{1}.PMU.Md;
Input1=InfoPMU.Input;
O=predict (Md1,Input1);
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('PMU-KNN ')
grid on
box on

subplot (223)
hold on
T=InfoPMU.Output;
Md1=Results.Tree{1}.PMU.Md;
Input1=InfoPMU.Input;
O=predict (Md1,Input1);
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('PMU-DT ')
grid on
box on

subplot (224)
hold on
T=InfoPMU.Output;
Md1=Results.ANN{1}.PMU.net;
Input1=InfoPMU.Input;
y = Md1(Input1');O = abs(1-(vec2ind(y)-1));
[A(1), T1, O1] = Accurecy(T,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1] = Accurecy(T,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1] = Accurecy(T,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1] = Accurecy(T,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1] = Accurecy(T,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('PMU-ANN ')
grid on
box on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

%% % %%  Accurecy
clear
clc
load ('Results')
load ('InfoPMU')
close all
figure (1)
subplot (221)
hold on
T=InfoPMU.Output;
Md1=Results.ANN{1}.PMU.net;
Input1=InfoPMU.Input;
y = Md1(Input1');O = abs(1-(vec2ind(y)-1));
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
ANN=nonzeros(A);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Md1=Results.Tree{1}.PMU.Md;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
Tree=nonzeros(A);
%%%%%%%%%%%%%%%%%%%
Md1=Results.SVM{1}.PMU.Md;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
SVM=nonzeros(A);
%%%%%%%%%%%%%%%%%%
Md1=Results.KNN{1}.PMU.Md;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1] = Accurecy(T,O,i);
end
KNN=nonzeros(A);
close all
figure (1)
hold on
t=1:2:10;
x1=SVM;x2=Tree;x3=KNN;x4=ANN;
plot (t,x1,'b-','LineWidth',2)
plot(t,x2,'g:','LineWidth',2)
plot(t,x3,'r-.','LineWidth',2)
plot(t,x4,'c--','LineWidth',2)
grid on 
box on 
xlabel ('sampling (cycle)')
ylabel('Accurecy (%)')
title ('Accurecy of PMU Model')
legend ('SVM','DT','KNN','ANN')


%% Confusion 
clear
clc
load ('Results')
load ('InfoPMU')
close all
T=InfoPMU.Output;
Input1=InfoPMU.Input;
Md1=Results.KNN{1}.PMU.Md;
O=predict (Md1,Input1);
[A, T1, O1] = Accurecy(T,O,1);
C1=confusionmat(T1,O1);
Islan=sum(T1);Non_Islan=numel(T1)-Islan;
TN1=C1(1,1)/Non_Islan;FN1=C1(1,2)/Non_Islan;FP1=C1(2,1)/Islan;TP1=C1(2,2)/Islan;CP1=(TP1+TN1)/2;ICP1=(FP1+FN1)/2;

[A, T1, O1] = Accurecy(T,O,3);
C1=confusionmat(T1,O1);
Islan=sum(T1);Non_Islan=numel(T1)-Islan;
TN3=C1(1,1)/Non_Islan;FN3=C1(1,2)/Non_Islan;FP3=C1(2,1)/Islan;TP3=C1(2,2)/Islan;CP3=(TP3+TN3)/2;ICP3=(FP3+FN3)/2;

[A, T1, O1] = Accurecy(T,O,5);
Islan=sum(T1);Non_Islan=numel(T1)-Islan;
C1=confusionmat(T1,O1);
TN5=C1(1,1)/Non_Islan;FN5=C1(1,2)/Non_Islan;FP5=C1(2,1)/Islan;TP5=C1(2,2)/Islan;CP5=(TP5+TN5)/2;ICP5=(FP5+FN5)/2;

[A, T1, O1] = Accurecy(T,O,7);
Islan=sum(T1);Non_Islan=numel(T1)-Islan;
C1=confusionmat(T1,O1);
TN7=C1(1,1)/Non_Islan;FN7=C1(1,2)/Non_Islan;FP7=C1(2,1)/Islan;TP7=C1(2,2)/Islan;CP7=(TP7+TN7)/2;ICP7=(FP7+FN7)/2;

[A, T1, O1] = Accurecy(T,O,9);
Islan=sum(T1);Non_Islan=numel(T1)-Islan;
C1=confusionmat(T1,O1);
TN9=C1(1,1)/Non_Islan;FN9=C1(1,2)/Non_Islan;FP9=C1(2,1)/Islan;TP9=C1(2,2)/Islan;CP9=(TP9+TN9)/2;ICP9=(FP9+FN9)/2;
%
figure1 = figure;
axes1 = axes('Parent',figure1);
bar([TP1,TN1,FP1,FN1;TP3,TN3,FP3,FN3;TP5,TN5,FP5,FN5;TP7,TN7,FP7,FN7;TP9,TN9,FP9,FN9]);
box(axes1,'on');
set(axes1,'XTick',[1 2 3 4 5],'XTickLabel',{'1','3','5','7','9'});
grid on
legend ('TP','TN','FP','FN','Location','Best')
xlabel ('sample (cycles)')
ylabel ('Rate of Classification')
title ('PMU-KNN')
Acc1=CP1./(CP1+ICP1);Acc3=CP3./(CP3+ICP3);Acc5=CP5./(CP5+ICP5);Acc7=CP7./(CP7+ICP7);Acc9=CP9./(CP9+ICP9);
E1=ICP1./(CP1+ICP1);E3=ICP3./(CP3+ICP3);E5=ICP5./(CP5+ICP5);E7=ICP7./(CP7+ICP7);E9=ICP9./(CP9+ICP9);

figure2 = figure;
axes1 = axes('Parent',figure2);
bar([CP1,Acc1,ICP1,E1;CP3,Acc3,ICP3,E3;CP5,Acc5,ICP5,E5;CP7,Acc7,ICP7,E7;CP9,Acc9,ICP9,E9]);
box(axes1,'on');
set(axes1,'XTick',[1 2 3 4 5],'XTickLabel',{'1','3','5','7','9'});
grid on
legend ('CP','Accuracy','ICP','Error','Location','Best')
xlabel ('sample (cycles)')
ylabel ('Rate of Classification')
title ('PMU-KNN')

%% NDZ

clear
clc
load ('Results')
load ('InfoPMU')
close all
T=InfoPMU.Output;
Input1=InfoPMU.Input;
Md1=Results.KNN{1}.PMU.Md;
O=predict (Md1,Input1);Delt_P=InfoPMU.P;
[A, T1, O1] = Accurecy(T,O,1);
[X,Y,Z]=Zcontourf(O1,T1,Delt_P);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('PMU-KNN')
grid on 
box on