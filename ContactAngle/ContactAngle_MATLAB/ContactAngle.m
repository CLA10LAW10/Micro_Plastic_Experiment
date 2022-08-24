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

% % This graph is the mean and std of all 0, 15, 30 60.
% % Instead of doing the mean of the mean.
% 
% PET_MEAN_FIG = figure('DefaultAxesFontSize', 14);
% hold on
% plot(Time,PET_MEAN,'b.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,PET_MEAN,PET_STD,'b','LineWidth',2)
% xlim([-1 61])
% ylim([30 85])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% title('Average Contact Angle of UV-Weathered PET Plastic')
% xlabel('Time (Minutes)')
% ylabel('Contact Angle (Degrees)')
% legend('PET MEAN')
% hold off

%export_fig(PET_MEAN_FIG,'Average_Contact_Angle_of_UV-Weathered_PET_Plastic.jpg','-nocrop')

% This graph uses SUBPLOTS of the mean and std of all plastics at 0, 15, 30 60.
% This is a 4x3 tiledlayout graph with everything centered
% CHAOS!!!!!!!!!!!!!!!!!!!!!!!
% https://www.mathworks.com/matlabcentral/answers/499823-one-common-xlabel-and-ylabel-for-multiple-subplots

PLASTIC_MEAN_FIG = figure('DefaultAxesFontSize', 14);
hold on

All_Average = tiledlayout(4,3);

nexttile(1,[4 2])
% This graph is the mean and std of all plastics at 0, 15, 30 60.
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
lgd = legend('HDPE MEAN','PET MEAN','PP MEAN','PVC MEAN');
lgd.Location = 'southwest';
hold off

nexttile(3)
hold
plot(Time,MEAN_HDPE_A,'r.','MarkerSize',20,'LineWidth',2)
errorbar(Time,MEAN_HDPE_A,STD_HDPE_A,'r','LineWidth',2)

xlim([-1 61])
ylim([20 100])
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
set(gca,'xticklabel','','tickdir','out')
lgd = legend('HDPE MEAN');
lgd.Location = 'southwest';
hold

nexttile(6)
hold
plot(Time,PET_MEAN,'b.','MarkerSize',20,'LineWidth',2)
errorbar(Time,PET_MEAN,PET_STD,'b','LineWidth',2)

xlim([-1 61])
ylim([20 100])
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
set(gca,'xticklabel','','tickdir','out')
lgd = legend('PET MEAN');
lgd.Location = 'southwest';
hold

nexttile(9)
hold
plot(Time,MEAN_PP_A,'g.','MarkerSize',20,'LineWidth',2)
errorbar(Time,MEAN_PP_A,STD_PP_A,'g','LineWidth',2)

xlim([-1 61])
ylim([20 100])
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
set(gca,'xticklabel','','tickdir','out')
lgd = legend('PP MEAN');
lgd.Location = 'southwest';
hold

nexttile(12)
hold
plot(Time,MEAN_PVC_A,'k.','MarkerSize',20,'LineWidth',2)
errorbar(Time,MEAN_PVC_A,STD_PVC_A,'k','LineWidth',2)

xlim([-1 61])
ylim([20 100])
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
set(gca,'tickdir','out')
lgd = legend('PVC MEAN');
lgd.Location = 'southwest';
hold


All_Average.TileSpacing = 'tight';
All_Average.Padding = 'compact';
title(All_Average, 'Average Contact Angle of UV-Weathered all Four Plastics');
ylabel(All_Average,'Contact Angle (Degrees)');
xlabel(All_Average,'Time (Minutes)');

PLASTIC_MEAN_FIG.WindowState = 'maximized';

export_fig(PLASTIC_MEAN_FIG,'Average_Contact_Angle_of_UV-Weathered_PET_Plastic.png','-transparent')

% This is all extra work below. Older graphs ans stuff.

% % This will graph all A, B, and C with their respective STDs.
% % No legends or title
% 
% figure()
% errorbar(Time,MEAN_PET_A,STD_PET_A)
% hold on
% errorbar(Time,MEAN_PET_B,STD_PET_B)
% hold on
% errorbar(Time,MEAN_PET_C,STD_PET_C)
% xlim([-1 61])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% hold off


% This graph is the mean and std of all plastics at 0, 15, 30 60.
% 
% PLASTIC_MEAN_FIG = figure('DefaultAxesFontSize', 14);
% hold on
% plot(Time,MEAN_HDPE_A,'r.','MarkerSize',20,'LineWidth',2)
% plot(Time,PET_MEAN,'b.','MarkerSize',20,'LineWidth',2)
% plot(Time,MEAN_PP_A,'g.','MarkerSize',20,'LineWidth',2)
% plot(Time,MEAN_PVC_A,'k.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_HDPE_A,STD_HDPE_A,'r','LineWidth',2)
% errorbar(Time,PET_MEAN,PET_STD,'b','LineWidth',2)
% errorbar(Time,MEAN_PP_A,STD_PP_A,'g','LineWidth',2)
% errorbar(Time,MEAN_PVC_A,STD_PVC_A,'k','LineWidth',2)
% xlim([-1 61])
% ylim([20 100])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% title('Average Contact Angle of UV-Weathered all Four Plastics')
% xlabel('Time (Minutes)')
% ylabel('Contact Angle (Degrees)')
% legend('HDPE MEAN','PET MEAN','PP MEAN','PVC MEAN')
% hold off
% 
% % This graph uses SUBPLOTS of the mean and std of all plastics at 0, 15, 30 60.
% % Consider tiledlayout and nexttile 
% % This is a 4 X 1 Matrix of graphs
% % https://www.mathworks.com/matlabcentral/answers/499823-one-common-xlabel-and-ylabel-for-multiple-subplots
% 
% PLASTIC_MEAN_FIG = figure('DefaultAxesFontSize', 14);
% hold on
% 
% subplot(4,1,1);
% plot(Time,MEAN_HDPE_A,'r.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_HDPE_A,STD_HDPE_A,'r','LineWidth',2)
% 
% xlim([-1 61])
% ylim([79 89])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% legend('HDPE MEAN')
% 
% subplot(4,1,2);
% plot(Time,PET_MEAN,'b.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,PET_MEAN,PET_STD,'b','LineWidth',2)
% 
% xlim([-1 61])
% ylim([30 90])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% legend('PET MEAN')
% 
% subplot(4,1,3);
% plot(Time,MEAN_PP_A,'g.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_PP_A,STD_PP_A,'g','LineWidth',2)
% 
% xlim([-1 61])
% ylim([75 100])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% legend('PP MEAN')
% 
% subplot(4,1,4);
% plot(Time,MEAN_PVC_A,'k.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_PVC_A,STD_PVC_A,'k','LineWidth',2)
% legend('PVC MEAN')
% 
% xlim([-1 61])
% ylim([20 100])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% 
% han = axes(PLASTIC_MEAN_FIG,'visible','off'); 
% han.Title.Visible = 'on';
% han.XLabel.Visible = 'on';
% han.YLabel.Visible = 'on';
% ylabel(han,'Contact Angle (Degrees)');
% xlabel(han,'Time (Minutes)');
% title(han,'Average Contact Angle of UV-Weathered all Four Plastics');
% hold off
% 
% %export_fig(PLASTIC_MEAN_FIG,'Average_Contact_Angle_of_UV-Weathered_PET_Plastic.jpg','-nocrop')
% 
% % This graph uses SUBPLOTS of the mean and std of all plastics at 0, 15, 30 60.
% % This is a 2 X 2 Matrix of graphs
% % https://www.mathworks.com/matlabcentral/answers/499823-one-common-xlabel-and-ylabel-for-multiple-subplots
% 
% PLASTIC_MEAN_FIG = figure('DefaultAxesFontSize', 14);
% hold on
% 
% subplot(2,2,1);
% plot(Time,MEAN_HDPE_A,'r.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_HDPE_A,STD_HDPE_A,'r','LineWidth',2)
% 
% xlim([-1 61])
% ylim([79 89])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% legend('HDPE MEAN')
% 
% subplot(2,2,2);
% plot(Time,PET_MEAN,'b.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,PET_MEAN,PET_STD,'b','LineWidth',2)
% 
% xlim([-1 61])
% ylim([30 90])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% legend('PET MEAN')
% 
% subplot(2,2,3);
% plot(Time,MEAN_PP_A,'g.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_PP_A,STD_PP_A,'g','LineWidth',2)
% 
% xlim([-1 61])
% ylim([75 100])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% legend('PP MEAN')
% 
% subplot(2,2,4);
% plot(Time,MEAN_PVC_A,'k.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_PVC_A,STD_PVC_A,'k','LineWidth',2)
% legend('PVC MEAN')
% 
% xlim([-1 61])
% ylim([20 100])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% 
% han = axes(PLASTIC_MEAN_FIG,'visible','off'); 
% han.Title.Visible = 'on';
% han.XLabel.Visible = 'on';
% han.YLabel.Visible = 'on';
% ylabel(han,'Contact Angle (Degrees)');
% xlabel(han,'Time (Minutes)');
% title(han,'Average Contact Angle of UV-Weathered all Four Plastics');
% hold off
% 
% %export_fig(PLASTIC_MEAN_FIG,'Average_Contact_Angle_of_UV-Weathered_PET_Plastic.jpg','-nocrop')
% 
% % This graph uses SUBPLOTS of the mean and std of all plastics at 0, 15, 30 60.
% % This is a 4X1 tiled layout Graph
% % https://www.mathworks.com/matlabcentral/answers/499823-one-common-xlabel-and-ylabel-for-multiple-subplots
% 
% PLASTIC_MEAN_FIG = figure('DefaultAxesFontSize', 14);
% hold on
% 
% tiledlayout(4,1);
% nexttile
% plot(Time,MEAN_HDPE_A,'r.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_HDPE_A,STD_HDPE_A,'r','LineWidth',2)
% 
% xlim([-1 61])
% ylim([79 89])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% legend('HDPE MEAN')
% 
% nexttile
% plot(Time,PET_MEAN,'b.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,PET_MEAN,PET_STD,'b','LineWidth',2)
% 
% xlim([-1 61])
% ylim([30 90])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% legend('PET MEAN')
% 
% nexttile
% plot(Time,MEAN_PP_A,'g.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_PP_A,STD_PP_A,'g','LineWidth',2)
% 
% xlim([-1 61])
% ylim([75 100])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% legend('PP MEAN')
% 
% nexttile
% plot(Time,MEAN_PVC_A,'k.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_PVC_A,STD_PVC_A,'k','LineWidth',2)
% legend('PVC MEAN')
% 
% xlim([-1 61])
% ylim([20 100])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% 
% han = axes(PLASTIC_MEAN_FIG,'visible','off'); 
% han.Title.Visible = 'on';
% han.XLabel.Visible = 'on';
% han.YLabel.Visible = 'on';
% ylabel(han,'Contact Angle (Degrees)');
% xlabel(han,'Time (Minutes)');
% title(han,'Nexttile');
% % title(han,'Average Contact Angle of UV-Weathered all Four Plastics');
% hold off
% 
% %export_fig(PLASTIC_MEAN_FIG,'Average_Contact_Angle_of_UV-Weathered_PET_Plastic.jpg','-nocrop')
% 
% % This graph uses SUBPLOTS of the mean and std of all plastics at 0, 15, 30 60.
% % This is a 2 X 2 tiledlayout graph
% % https://www.mathworks.com/matlabcentral/answers/499823-one-common-xlabel-and-ylabel-for-multiple-subplots
% 
% PLASTIC_MEAN_FIG = figure('DefaultAxesFontSize', 14);
% hold on
% 
% tiledlayout(2,2);
% nexttile
% plot(Time,MEAN_HDPE_A,'r.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_HDPE_A,STD_HDPE_A,'r','LineWidth',2)
% 
% xlim([-1 61])
% ylim([79 89])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% legend('HDPE MEAN')
% 
% nexttile
% plot(Time,PET_MEAN,'b.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,PET_MEAN,PET_STD,'b','LineWidth',2)
% 
% xlim([-1 61])
% ylim([30 90])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% legend('PET MEAN')
% 
% nexttile
% plot(Time,MEAN_PP_A,'g.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_PP_A,STD_PP_A,'g','LineWidth',2)
% 
% xlim([-1 61])
% ylim([75 100])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% legend('PP MEAN')
% 
% nexttile
% plot(Time,MEAN_PVC_A,'k.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_PVC_A,STD_PVC_A,'k','LineWidth',2)
% legend('PVC MEAN')
% 
% xlim([-1 61])
% ylim([20 100])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% 
% han = axes(PLASTIC_MEAN_FIG,'visible','off'); 
% han.Title.Visible = 'on';
% han.XLabel.Visible = 'on';
% han.YLabel.Visible = 'on';
% ylabel(han,'Contact Angle (Degrees)');
% xlabel(han,'Time (Minutes)');
% title(han,'Nexttile');
% % title(han,'Average Contact Angle of UV-Weathered all Four Plastics');
% hold off
% 
% %export_fig(PLASTIC_MEAN_FIG,'Average_Contact_Angle_of_UV-Weathered_PET_Plastic.jpg','-nocrop')
% 
% % This graph uses SUBPLOTS of the mean and std of all plastics at 0, 15, 30 60.
% % This is a 'flow' tiledlayout graph
% % https://www.mathworks.com/matlabcentral/answers/499823-one-common-xlabel-and-ylabel-for-multiple-subplots
% 
% PLASTIC_MEAN_FIG = figure('DefaultAxesFontSize', 14);
% hold on
% 
% All_Average = tiledlayout(4,1);
% 
% nexttile
% hold
% plot(Time,MEAN_HDPE_A,'r.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_HDPE_A,STD_HDPE_A,'r','LineWidth',2)
% 
% xlim([-1 61])
% ylim([20 100])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% set(gca,'xticklabel','','tickdir','out')
% legend('HDPE MEAN')
% hold
% 
% nexttile
% hold
% plot(Time,PET_MEAN,'b.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,PET_MEAN,PET_STD,'b','LineWidth',2)
% 
% xlim([-1 61])
% ylim([20 100])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% set(gca,'xticklabel','','tickdir','out')
% legend('PET MEAN')
% hold
% 
% nexttile
% hold
% plot(Time,MEAN_PP_A,'g.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_PP_A,STD_PP_A,'g','LineWidth',2)
% 
% xlim([-1 61])
% ylim([20 100])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% set(gca,'xticklabel','','tickdir','out')
% legend('PP MEAN')
% hold
% 
% nexttile
% hold
% plot(Time,MEAN_PVC_A,'k.','MarkerSize',20,'LineWidth',2)
% errorbar(Time,MEAN_PVC_A,STD_PVC_A,'k','LineWidth',2)
% 
% xlim([-1 61])
% ylim([20 100])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% set(gca,'tickdir','out')
% legend('PVC MEAN')
% hold
% 
% 
% All_Average.TileSpacing = 'tight';
% All_Average.Padding = 'compact';
% title(All_Average, 'Average Contact Angle of UV-Weathered all Four Plastics');
% ylabel(All_Average,'Contact Angle (Degrees)');
% xlabel(All_Average,'Time (Minutes)');
% 
% 
% %export_fig(PLASTIC_MEAN_FIG,'Average_Contact_Angle_of_UV-Weathered_PET_Plastic.jpg','-nocrop')
