clear all; close all; clc;
load ('Info2.mat');load ('Info1.mat')
for k=1:1
    X = Info2.Feature{k}.PCAL1; Y = Info2.Y{k};
    R1= AI_Method(X,Y,'SVM');   R2= AI_Method(X,Y,'KNN');
    R3= AI_Method(X,Y,'Tre');   R4= AI_Method(X,Y,'ANN');
    Results.SVM{k}.PCAL1=R1;    Results.KNN{k}.PCAL1=R2;
    Results.Tree{k}.PCAL1=R3;   Results.ANN{k}.PCAL1=R4;
    
    X = Info2.Feature{k}.PCAL2; Y = Info2.Y{k};
    R1= AI_Method(X,Y,'SVM');   R2= AI_Method(X,Y,'KNN');
    R3= AI_Method(X,Y,'Tre');   R4= AI_Method(X,Y,'ANN');
    Results.SVM{k}.PCAL2=R1;    Results.KNN{k}.PCAL2=R2;
    Results.Tree{k}.PCAL2=R3;   Results.ANN{k}.PCAL2=R4;
   
    X = Info2.Feature{k}.LDAL1; Y = Info2.Y{k};
    R1= AI_Method(X,Y,'SVM');   R2= AI_Method(X,Y,'KNN');
    R3= AI_Method(X,Y,'Tre');   R4= AI_Method(X,Y,'ANN');
    Results.SVM{k}.LDAL1=R1;    Results.KNN{k}.LDAL1=R2;
    Results.Tree{k}.LDAL1=R3;   Results.ANN{k}.LDAL1=R4;
    
    X = Info2.Feature{k}.LDAL2; Y = Info2.Y{k};
    R1= AI_Method(X,Y,'SVM');   R2= AI_Method(X,Y,'KNN');
    R3= AI_Method(X,Y,'Tre');   R4= AI_Method(X,Y,'ANN');
    Results.SVM{k}.LDAL2=R1;    Results.KNN{k}.LDAL2=R2;
    Results.Tree{k}.LDAL2=R3;   Results.ANN{k}.LDAL2=R4;
    
    X = Info2.Feature{k}.MDSL1; Y = Info2.Y{k};
    R1= AI_Method(X,Y,'SVM');   R2= AI_Method(X,Y,'KNN');
    R3= AI_Method(X,Y,'Tre');   R4= AI_Method(X,Y,'ANN');
    Results.SVM{k}.MDSL1=R1;    Results.KNN{k}.MDSL1=R2;
    Results.Tree{k}.MDSL1=R3;   Results.ANN{k}.MDSL1=R4;
    
    X = Info2.Feature{k}.MDSL2; Y = Info2.Y{k};
    R1= AI_Method(X,Y,'SVM');   R2= AI_Method(X,Y,'KNN');
    R3= AI_Method(X,Y,'Tre');   R4= AI_Method(X,Y,'ANN');
    Results.SVM{k}.MDSL2=R1;    Results.KNN{k}.MDSL2=R2;
    Results.Tree{k}.MDSL2=R3;   Results.ANN{k}.MDSL2=R4;
    
    X = Info2.Feature{k}.ProbPCAL1; Y = Info2.Y{k};
    R1= AI_Method(X,Y,'SVM');       R2= AI_Method(X,Y,'KNN');
    R3= AI_Method(X,Y,'Tre');       R4= AI_Method(X,Y,'ANN');
    Results.SVM{k}.ProbPCAL1=R1;    Results.KNN{k}.ProbPCAL1=R2;
    Results.Tree{k}.ProbPCAL1=R3;   Results.ANN{k}.ProbPCAL1=R4;
    
    X = Info2.Feature{k}.ProbPCAL2; Y = Info2.Y{k};
    R1= AI_Method(X,Y,'SVM');   R2= AI_Method(X,Y,'KNN');
    R3= AI_Method(X,Y,'Tre');   R4= AI_Method(X,Y,'ANN');
    Results.SVM{k}.ProbPCAL2=R1;    Results.KNN{k}.ProbPCAL2=R2;
    Results.Tree{k}.ProbPCAL2=R3;   Results.ANN{k}.ProbPCAL2=R4;
    
    X = Info1.Feature{k}; Y= Info1.Status{k};
    R1= AI_Method(X,Y,'SVM');       R2= AI_Method(X,Y,'KNN');
    R3= AI_Method(X,Y,'Tre');       R4= AI_Method(X,Y,'ANN');
    Results.SVM{k}.WithoutDR=R1;    Results.KNN{k}.WithoutDR=R2;
    Results.Tree{k}.WithoutDR=R3;   Results.ANN{k}.WithoutDR=R4;
end
save('Results','Results')
