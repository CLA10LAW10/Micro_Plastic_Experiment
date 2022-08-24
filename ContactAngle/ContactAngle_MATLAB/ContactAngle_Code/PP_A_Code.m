format compact, format short,
clear, clc

PP_A_0_NaN = xlsread('ContactAngle.xlsx','PP A','H2:H48');
PP_A_0 = rmmissing(PP_A_0_NaN);
STD_PP_A_0 = std(PP_A_0);
MEAN_PP_A_0 = mean(PP_A_0);

PP_A_15_NaN = xlsread('ContactAngle.xlsx','PP A','H51:H96');
PP_A_15 = rmmissing(PP_A_15_NaN);
STD_PP_A_15 = std(PP_A_15);
MEAN_PP_A_15 = mean(PP_A_15);

PP_A_30_NaN = xlsread('ContactAngle.xlsx','PP A','H99:H204');
PP_A_30 = rmmissing(PP_A_30_NaN);
STD_PP_A_30 = std(PP_A_30);
MEAN_PP_A_30 = mean(PP_A_30);

PP_A_60_NaN = xlsread('ContactAngle.xlsx','PP A','H207:H253');
PP_A_60 = rmmissing(PP_A_60_NaN);
STD_PP_A_60 = std(PP_A_60);
MEAN_PP_A_60 = mean(PP_A_60);

MEAN_PP_A = [MEAN_PP_A_0, MEAN_PP_A_15, MEAN_PP_A_30, MEAN_PP_A_60];
STD_PP_A = [STD_PP_A_0, STD_PP_A_15, STD_PP_A_30, STD_PP_A_60];

save('PP_A_Data.mat');