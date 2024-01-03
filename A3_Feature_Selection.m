clear all; close all; clc;
load ('Info1')
for k=1:1
    X=Info1.Feature{k}; X1=[];X2=[];X3=[];X4=[];
    for i=1:40
        [X1PCA, mapping] = compute_mapping(X(:,3*i-2:3*i), 'PCA',1);
        X1=[X1,X1PCA];
        [X1PCA, mapping] = compute_mapping(X(:,3*i-2:3*i), 'LDA',1);
        X2=[X2,X1PCA];
        [X1PCA, mapping] = compute_mapping(X(:,3*i-2:3*i), 'MDS',1);
        X3=[X3,X1PCA];
    end
    X1=[X1,X(:,121:end)];X2=[X2,X(:,121:end)];X3=[X3,X(:,121:end)];
    no_dims1 = round(intrinsic_dim(X1, 'MLE'));%5
    no_dims2 = round(intrinsic_dim(X1, 'EigValue'));%4
    NN=5;%max([no_dims1,no_dims2]);
    [X1PCA, mapping] = compute_mapping(X1, 'PCA',NN);
    [X1LDA, mapLDA] = compute_mapping(X1, 'LDA',NN);
    [X1MDS, mapMDS] = compute_mapping(X1, 'MDS',NN);
    [X1ProbPCA, mapProbPCA] = compute_mapping(X1, 'ProbPCA',NN);
    DR.PCA=mapping;
    DR.LDA=mapLDA;
    DR.MDS=mapMDS;
    DR.ProbPCA=mapProbPCA;
    Info2.Feature{k}.PCAL2=X1PCA;
    Info2.Feature{k}.LDAL2=X1LDA;
    Info2.Feature{k}.MDSL2=X1MDS;
    Info2.Feature{k}.ProbPCAL2=X1ProbPCA;
    Info2.Feature{k}.PCAL1=X1;
    Info2.Feature{k}.LDAL1=X2;
    Info2.Feature{k}.MDSL1=X3;
    Info2.Feature{k}.ProbPCAL1=X1;
end
Info2.Y=Info1.Status;
Info2.dP=Info1.dP;
Info2.discription='Feature After DR';
save('Info2','Info2')
save ('DR','DR')
