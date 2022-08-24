format compact, format short,
clear, clc

PET_C_0_NaN = xlsread('ContactAngle.xlsx','PET C','H2:H101');
PET_C_0 = rmmissing(PET_C_0_NaN);
STD_PET_C_0 = std(PET_C_0);
MEAN_PET_C_0 = mean(PET_C_0);

PET_C_15_NaN = xlsread('ContactAngle.xlsx','PET C','H104:H204');
PET_C_15 = rmmissing(PET_C_15_NaN);
STD_PET_C_15 = std(PET_C_15);
MEAN_PET_C_15 = mean(PET_C_15);

PET_C_30_NaN = xlsread('ContactAngle.xlsx','PET C','H207:H306');
PET_C_30 = rmmissing(PET_C_30_NaN);
STD_PET_C_30 = std(PET_C_30);
MEAN_PET_C_30 = mean(PET_C_30);

PET_C_60_NaN = xlsread('ContactAngle.xlsx','PET C','H309:H428');
PET_C_60 = rmmissing(PET_C_60_NaN);
STD_PET_C_60 = std(PET_C_60);
MEAN_PET_C_60 = mean(PET_C_60);

MEAN_PET_C = [MEAN_PET_C_0, MEAN_PET_C_15, MEAN_PET_C_30, MEAN_PET_C_60];
STD_PET_C = [STD_PET_C_0, STD_PET_C_15, STD_PET_C_30, STD_PET_C_60];

save('PET_C_Data.mat');