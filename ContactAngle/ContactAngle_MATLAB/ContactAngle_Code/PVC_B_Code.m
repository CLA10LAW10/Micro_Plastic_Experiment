format compact, format short,
clear, clc

PVC_B_0_NaN = xlsread('ContactAngle.xlsx','PVC B','H2:H51');
PVC_B_0 = rmmissing(PVC_B_0_NaN);
STD_PVC_B_0 = std(PVC_B_0);
MEAN_PVC_B_0 = mean(PVC_B_0);

% PVC_B_15_NaN = xlsread('ContactAngle.xlsx','PVC B','H63:H109');
% PVC_B_15 = rmmissing(PVC_B_15_NaN);
% STD_PVC_B_15 = std(PVC_B_15);
% MEAN_PVC_B_15 = mean(PVC_B_15);

PVC_B_30_NaN = xlsread('ContactAngle.xlsx','PVC B','H56:H85');
PVC_B_30 = rmmissing(PVC_B_30_NaN);
STD_PVC_B_30 = std(PVC_B_30);
MEAN_PVC_B_30 = mean(PVC_B_30);

% PVC_B_60_NaN = xlsread('ContactAngle.xlsx','PVC B','H161:H230');
% PVC_B_60 = rmmissing(PVC_B_60_NaN);
% STD_PVC_B_60 = std(PVC_B_60);
% MEAN_PVC_B_60 = mean(PVC_B_60);

% MEAN_PVC_B = [MEAN_PVC_B_0, MEAN_PVC_B_15, MEAN_PVC_B_30, MEAN_PVC_B_60];
% STD_PVC_B = [STD_PVC_B_0, STD_PVC_B_15, STD_PVC_B_30, STD_PVC_B_60];

save('PVC_B_Data.mat');