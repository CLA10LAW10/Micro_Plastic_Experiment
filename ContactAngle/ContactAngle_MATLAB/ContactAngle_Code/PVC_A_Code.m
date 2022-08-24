format compact, format short,
clear, clc

PVC_A_0_NaN = xlsread('ContactAngle.xlsx','PVC A','H2:H60');
PVC_A_0 = rmmissing(PVC_A_0_NaN);
STD_PVC_A_0 = std(PVC_A_0);
MEAN_PVC_A_0 = mean(PVC_A_0);

PVC_A_15_NaN = xlsread('ContactAngle.xlsx','PVC A','H63:H109');
PVC_A_15 = rmmissing(PVC_A_15_NaN);
STD_PVC_A_15 = std(PVC_A_15);
MEAN_PVC_A_15 = mean(PVC_A_15);

PVC_A_30_NaN = xlsread('ContactAngle.xlsx','PVC A','H112:H158');
PVC_A_30 = rmmissing(PVC_A_30_NaN);
STD_PVC_A_30 = std(PVC_A_30);
MEAN_PVC_A_30 = mean(PVC_A_30);

PVC_A_60_NaN = xlsread('ContactAngle.xlsx','PVC A','H161:H230');
PVC_A_60 = rmmissing(PVC_A_60_NaN);
STD_PVC_A_60 = std(PVC_A_60);
MEAN_PVC_A_60 = mean(PVC_A_60);

MEAN_PVC_A = [MEAN_PVC_A_0, MEAN_PVC_A_15, MEAN_PVC_A_30, MEAN_PVC_A_60];
STD_PVC_A = [STD_PVC_A_0, STD_PVC_A_15, STD_PVC_A_30, STD_PVC_A_60];

save('PVC_A_Data.mat');