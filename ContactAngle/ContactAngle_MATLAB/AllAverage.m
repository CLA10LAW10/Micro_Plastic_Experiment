format compact, format short,
clear, clc, close all

load('HDPE_A_Data.mat');
load('PET_A_Data.mat');
load('PET_B_Data.mat');
load('PET_C_Data.mat');
load('PP_A_Data.mat');
load('PVC_A_Data.mat');
load('PVC_B_Data.mat');
load('Time_Data.mat');
Time = Time(1:4);

PET_0 = [PET_A_0', PET_B_0', PET_C_0'];
PET_15 = [PET_A_15', PET_B_15', PET_C_15'];
PET_30 = [PET_A_30', PET_B_30', PET_C_30'];
PET_60 = [PET_A_60', PET_B_60', PET_C_60'];

PET_0_MEAN = mean(PET_0);
PET_15_MEAN = mean(PET_15);
PET_30_MEAN = mean(PET_30);
PET_60_MEAN = mean(PET_60);

PET_0_STD = std(PET_0);
PET_15_STD = std(PET_15);
PET_30_STD = std(PET_30);
PET_60_STD = std(PET_60);

PET_MEAN = [PET_0_MEAN, PET_15_MEAN, PET_30_MEAN, PET_60_MEAN];
PET_STD = [PET_0_STD, PET_15_STD, PET_30_STD, PET_60_STD];


% This graph is the mean and std of all plastics at 0, 15, 30 60.

PLASTIC_MEAN_FIG = figure('DefaultAxesFontSize', 14);
hold on
plot(Time,MEAN_HDPE_A,'r.','MarkerSize',20,'LineWidth',2)
plot(Time,PET_MEAN,'b.','MarkerSize',20,'LineWidth',2)
plot(Time,MEAN_PP_A,'g.','MarkerSize',20,'LineWidth',2)
plot(Time,MEAN_PVC_A,'k.','MarkerSize',20,'LineWidth',2)
errorbar(Time,MEAN_HDPE_A,STD_HDPE_A,'r','LineWidth',2)
errorbar(Time,PET_MEAN,PET_STD,'b','LineWidth',2)
errorbar(Time,MEAN_PP_A,STD_PP_A,'g','LineWidth',2)
errorbar(Time,MEAN_PVC_A,STD_PVC_A,'k','LineWidth',2)
xlim([-1 61])
ylim([20 100])
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
title('Average Contact Angle of UV-Weathered all Four Plastics')
xlabel('Time (Minutes)')
ylabel('Contact Angle (Degrees)')
legend('HDPE MEAN','PET MEAN','PP MEAN','PVC MEAN')
hold off

export_fig(PLASTIC_MEAN_FIG,'Average_Contact_Angle_of_UV-Weathered_PET_Plastic.jpg','-nocrop')
