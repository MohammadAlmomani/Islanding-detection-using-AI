clear all
clc
PV_system_par;
model='PV_system';
load_system(model)
warning off;
sampling=1/60/64;
%%
k=1;
I=100;L1=0;L2=100;
P_load=175e3;Ql_load=1;Qc_load=1;%nomianl Power 250e3
for i=1:11
    Ql_load=50e3+1;Qc_load=1;
    for j=1:5
        sim(model);
        Data{1,k}.Local=Local(7041:8320,:);
        Data{1,k}.PMU=PMU(111:130,:);
        Data{1,k}.status=0;
        Data{1,k}.dP=[P_load-250e3,(Ql_load-1)-(Qc_load-1)]./250e3*100;
        k=k+1;
        Ql_load=Ql_load-10e3;
    end
    Ql_load=1;
    for j=1:6
        sim(model);
        Data{1,k}.Local=Local(7041:8320,:);
        Data{1,k}.PMU=PMU(111:130,:);
        Data{1,k}.status=0;
        Data{1,k}.dP=[P_load-250e3,(Ql_load-1)-(Qc_load-1)]./250e3*100;
        k=k+1;
        Qc_load=Qc_load+10e3;
    end
    P_load=P_load+15e3;
end
save('Data','Data')
% %%
%% 
I=100;L1=100;L2=0;
P_load=175e3;Ql_load=1;Qc_load=1;%nomianl Power 250e3
for i=1:11
    Ql_load=50e3+1;Qc_load=1;
    for j=1:5
        sim(model);
        Data{1,k}.Local=Local(7041:8320,:);
        Data{1,k}.PMU=PMU(111:130,:);
        Data{1,k}.status=0;
        Data{1,k}.dP=[P_load-250e3,(Ql_load-1)-(Qc_load-1)]./250e3*100;
        k=k+1;
        Ql_load=Ql_load-10e3;
    end
    Ql_load=1;
    for j=1:6
        sim(model);
        Data{1,k}.Local=Local(7041:8320,:);
        Data{1,k}.PMU=PMU(111:130,:);
        Data{1,k}.status=0;
        Data{1,k}.dP=[P_load-250e3,(Ql_load-1)-(Qc_load-1)]./250e3*100;
        k=k+1;
        Qc_load=Qc_load+10e3;
    end
    P_load=P_load+15e3;
end
save('Data','Data')

Data{1,1}.Event=['LOAD UP THEN LOAD DOWN'];
Data{1,1}.DisctiptionPMU=['Vlocal  ROCOVlocal PH_Vlocal F_local ROCOF_local Vload  ROCOVload PH_Vload F_load ROCOF_load VPCC  ROCOVPCC  PH_VPCC  F_PCC  ROCOF_PCC '];
Data{1,1}.DisctiptionLocal=['Va Va Vc ROCOVa ROCOVb ROCOVc PH_Va PH_Vb PH_Vc Ia Ia Ic ROCOIa ROCOIb ROCOIc PH_Ia PH_Ib PH_Ic THD_Va THD_Vb THD_Vc THD_Ia THD_Ib THD_Ic P ROCOP Q ROCOQ F ROCOF'];
save('Data','Data')
%%
I=0;L1=100;L2=100;k=1;
P_load=175e3;Ql_load=1;Qc_load=1;%nomianl Power 250e3
for i=1:22
    Ql_load=50e3+1;Qc_load=1;
    for j=1:5
        sim(model);
        Data{2,k}.Local=Local(7041:8320,:);
        Data{2,k}.PMU=PMU(111:130,:);
        Data{2,k}.status=0;
        Data{2,k}.dP=[P_load-250e3,(Ql_load-1)-(Qc_load-1)]./250e3*100;
        k=k+1;
        Ql_load=Ql_load-10e3;
    end
    Ql_load=1;
    for j=1:6
        sim(model);
        Data{2,k}.Local=Local(7041:8320,:);
        Data{2,k}.PMU=PMU(111:130,:);
        Data{2,k}.status=1;
        Data{2,k}.dP=[P_load-9e6,(Ql_load-1)-(Qc_load-1)]./10e6*100;
        k=k+1;
        Qc_load=Qc_load+10e3;
    end
    P_load=P_load+7.5e3;
end
save('Data','Data')
Data{2,1}.Event=['Islanding'];
save('Data','Data')
%%