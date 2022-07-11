format compact, format short,
clear, clc

PET_B_0_NaN = xlsread('ContactAngle.xlsx','PET B','H2:H101');
PET_B_0 = rmmissing(PET_B_0_NaN);
STD_PET_B_0 = std(PET_B_0);
MEAN_PET_B_0 = mean(PET_B_0);

PET_B_15_NaN = xlsread('ContactAngle.xlsx','PET B','H104:H203');
PET_B_15 = rmmissing(PET_B_15_NaN);
STD_PET_B_15 = std(PET_B_15);
MEAN_PET_B_15 = mean(PET_B_15);

PET_B_30_NaN = xlsread('ContactAngle.xlsx','PET B','H206:H305');
PET_B_30 = rmmissing(PET_B_30_NaN);
STD_PET_B_30 = std(PET_B_30);
MEAN_PET_B_30 = mean(PET_B_30);

PET_B_60_NaN = xlsread('ContactAngle.xlsx','PET B','H308:H438');
PET_B_60 = rmmissing(PET_B_60_NaN);
STD_PET_B_60 = std(PET_B_60);
MEAN_PET_B_60 = mean(PET_B_60);

MEAN_PET_B = [MEAN_PET_B_0, MEAN_PET_B_15, MEAN_PET_B_30, MEAN_PET_B_60];
STD_PET_B = [STD_PET_B_0, STD_PET_B_15, STD_PET_B_30, STD_PET_B_60];

save('PET_B_Data.mat');