 clear all
clc
Status1=[];Feature1=[];DP1=[];Status2=[];Feature2=[];DP2=[];Status3=[];Feature3=[];DP3=[];
Status4=[];Feature4=[];DP4=[];Status5=[];Feature5=[];DP5=[];Status6=[];Feature6=[];DP6=[];
Status7=[];Feature7=[];DP7=[];Status8=[];Feature8=[];DP8=[];Status9=[];Feature9=[];DP9=[];
Status10=[];Feature10=[];DP10=[];
load('Data.mat');%load('Data_NI1.mat');load('Data_NI2.mat')
Data=Data';
[F,S,dP]=Extract (Data,1);Feature1=[Feature1;F];Status1=[Status1;S];DP1=[DP1;dP]; clear F S dP;
% [F,S,dP]=Extract (Data,2);Feature2=[Feature2;F];Status2=[Status2;S];DP2=[DP2;dP]; clear F S dP;
% [F,S,dP]=Extract (Data,3);Feature3=[Feature3;F];Status3=[Status3;S];DP3=[DP3;dP]; clear F S dP;
% [F,S,dP]=Extract (Data,4);Feature4=[Feature4;F];Status4=[Status4;S];DP4=[DP4;dP]; clear F S dP;
% [F,S,dP]=Extract (Data,5);Feature5=[Feature5;F];Status5=[Status5;S];DP5=[DP5;dP]; clear F S dP;
% [F,S,dP]=Extract (Data,6);Feature6=[Feature6;F];Status6=[Status6;S];DP6=[DP6;dP]; clear F S dP;
% [F,S,dP]=Extract (Data,7);Feature7=[Feature7;F];Status7=[Status7;S];DP7=[DP7;dP]; clear F S dP;
% [F,S,dP]=Extract (Data,8);Feature8=[Feature8;F];Status8=[Status8;S];DP8=[DP8;dP]; clear F S dP;
% [F,S,dP]=Extract (Data,9);Feature9=[Feature9;F];Status9=[Status9;S];DP9=[DP9;dP]; clear F S dP;
% [F,S,dP]=Extract (Data,10);Feature10=[Feature10;F];Status10=[Status10;S];DP10=[DP10;dP]; clear F S dP;
Info1.Feature{1}=Feature1;Info1.Status{1}=Status1;Info1.dP{1}=DP1;
% Info1.Feature{2}=Feature2;Info1.Status{2}=Status2;Info1.dP{2}=DP2;
% Info1.Feature{3}=Feature3;Info1.Status{3}=Status3;Info1.dP{3}=DP3;
% Info1.Feature{4}=Feature4;Info1.Status{4}=Status4;Info1.dP{4}=DP4;
% Info1.Feature{5}=Feature5;Info1.Status{5}=Status5;Info1.dP{5}=DP5;
% Info1.Feature{6}=Feature6;Info1.Status{6}=Status6;Info1.dP{6}=DP6;
% Info1.Feature{7}=Feature7;Info1.Status{7}=Status7;Info1.dP{7}=DP7;
% Info1.Feature{8}=Feature8;Info1.Status{8}=Status8;Info1.dP{8}=DP8;
% Info1.Feature{9}=Feature9;Info1.Status{9}=Status9;Info1.dP{9}=DP9;
% Info1.Feature{10}=Feature10;Info1.Status{10}=Status10;Info1.dP{10}=DP10;

Info1.discription='Feature Befor DR';
save('Info1','Info1')
