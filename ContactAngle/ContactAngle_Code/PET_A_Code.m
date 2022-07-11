format compact, format short,
clear, clc

PET_A_0_NaN = xlsread('ContactAngle.xlsx','PET A','H2:H60');
PET_A_0 = rmmissing(PET_A_0_NaN);
STD_PET_A_0 = std(PET_A_0);
MEAN_PET_A_0 = mean(PET_A_0);

PET_A_15_NaN = xlsread('ContactAngle.xlsx','PET A','H63:H163');
PET_A_15 = rmmissing(PET_A_15_NaN);
STD_PET_A_15 = std(PET_A_15);
MEAN_PET_A_15 = mean(PET_A_15);

PET_A_30_NaN = xlsread('ContactAngle.xlsx','PET A','H166:H200');
PET_A_30 = rmmissing(PET_A_30_NaN);
STD_PET_A_30 = std(PET_A_30);
MEAN_PET_A_30 = mean(PET_A_30);

PET_A_60_NaN = xlsread('ContactAngle.xlsx','PET A','H203:H238');
PET_A_60 = rmmissing(PET_A_60_NaN);
STD_PET_A_60 = std(PET_A_60);
MEAN_PET_A_60 = mean(PET_A_60);

MEAN_PET_A = [MEAN_PET_A_0, MEAN_PET_A_15, MEAN_PET_A_30, MEAN_PET_A_60];
STD_PET_A = [STD_PET_A_0, STD_PET_A_15, STD_PET_A_30, STD_PET_A_60];

save('PET_A_Data.mat');