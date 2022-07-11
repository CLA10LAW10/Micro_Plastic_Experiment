format compact, format short,
clear, clc

HDPE_A_0_NaN = xlsread('ContactAngle.xlsx','HDPE A','H2:H36');
HDPE_A_0 = rmmissing(HDPE_A_0_NaN);
STD_HDPE_A_0 = std(HDPE_A_0);
MEAN_HDPE_A_0 = mean(HDPE_A_0);

HDPE_A_15_NaN = xlsread('ContactAngle.xlsx','HDPE A','H40:H73');
HDPE_A_15 = rmmissing(HDPE_A_15_NaN);
STD_HDPE_A_15 = std(HDPE_A_15);
MEAN_HDPE_A_15 = mean(HDPE_A_15);

HDPE_A_30_NaN = xlsread('ContactAngle.xlsx','HDPE A','H77:H123');
HDPE_A_30 = rmmissing(HDPE_A_30_NaN);
STD_HDPE_A_30 = std(HDPE_A_30);
MEAN_HDPE_A_30 = mean(HDPE_A_30);

HDPE_A_60_NaN = xlsread('ContactAngle.xlsx','HDPE A','H126:H159');
HDPE_A_60 = rmmissing(HDPE_A_60_NaN);
STD_HDPE_A_60 = std(HDPE_A_60);
MEAN_HDPE_A_60 = mean(HDPE_A_60);

MEAN_HDPE_A = [MEAN_HDPE_A_0, MEAN_HDPE_A_15, MEAN_HDPE_A_30, MEAN_HDPE_A_60];
STD_HDPE_A = [STD_HDPE_A_0, STD_HDPE_A_15, STD_HDPE_A_30, STD_HDPE_A_60];

save('HDPE_A_Data.mat');