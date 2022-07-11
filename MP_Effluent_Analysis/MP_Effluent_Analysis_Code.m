format compact, format short,
clear, clc, close all

MP_Day(1,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E2:E13'); % Day 0
MP_Day(2,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E15:E26'); % Day 1
MP_Day(3,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E28:E39'); % Day 2
MP_Day(4,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E41:E52'); % Day 3
MP_Day(5,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E54:E65'); % Day 4
MP_Day(6,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E67:E78'); % Day 5
MP_Day(7,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E80:E91'); % Day 6
MP_Day(8,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E93:E104'); % Day 7
MP_Day(9,:)= xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E106:E117'); % Day 8
MP_Day(10,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E119:E130'); % Day 9
MP_Day(11,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E132:E143'); % Day 10
MP_Day(12,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E145:E156'); % Day 11
MP_Day(13,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E158:E169'); % Day 12
MP_Day(14,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E171:E182'); % Day 13
MP_Day(15,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E184:E195'); % Day 14
MP_Day(16,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E197:E208'); % Day 15
MP_Day(17,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E210:E221'); % Day 16
MP_Day(18,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E223:E234'); % Day 17
MP_Day(19,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E236:E247'); % Day 18
MP_Day(20,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E249:E260'); % Day 19
MP_Day(21,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E262:E273'); % Day 20

MP_Day(22,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E275:E286'); % Day 25
MP_Day(23,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E288:E299'); % Day 30
MP_Day(24,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E301:E312'); % Day 34
MP_Day(25,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E314:E325'); % Day 39
MP_Day(26,:) = xlsread('MP_Effluent_Analysis.xlsx','Calculated Data','E327:E338'); % Day 44

for H = 1:26
    if H == 2
        A(H) = mean(MP_Day(H,2:3));
    else
        A(H) = mean(MP_Day(H,1:3));
    end
end


for H = 1:26
        B(H) = mean(MP_Day(H,4:6));
end

for H = 1:26
        C(H) = mean(MP_Day(H,7:9));
end

for H = 1:26
        D(H) = mean(MP_Day(H,10:12));
end

save('MP_Effluent_Analysis_Data.mat');

T = [0:20,25,30,34,39,44];

% % This is a 4x3 tiledlayout graph with everything centered
% % CHAOS!!!!!!!!!!!!!!!!!!!!!!!
% 
% Effluent_Analysis = figure('DefaultAxesFontSize', 14);
% 
% All_Effluent = tiledlayout(4,3);
% 
% nexttile(1,[4 2])
% hold
% plot(T,A,'r.-','MarkerSize',20,'LineWidth',2)
% plot(T,B,'b.-','MarkerSize',20,'LineWidth',2)
% plot(T,C,'g.-','MarkerSize',20,'LineWidth',2)
% plot(T,D,'k.-','MarkerSize',20,'LineWidth',2)
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% legend('0 Minutes','15 Minutes','30 Minutes','60 Minutes')
% %xticks([0:20]) xlim([-1 21])
% ylim([0 30])
% hold
% 
% nexttile(3)
% hold
% plot(T,A,'r.-','MarkerSize',20,'LineWidth',2)
% 
% %xticks([0:20]) xlim([-1 21])
% ylim([0 30])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% set(gca,'xticklabel','','tickdir','out')
% legend('0 Minutes')
% hold
% 
% nexttile(6)
% hold
% plot(T,B,'b.-','MarkerSize',20,'LineWidth',2)
% 
% %xticks([0:20]) xlim([-1 21])
% ylim([0 30])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% set(gca,'xticklabel','','tickdir','out')
% legend('15 Minutes')
% hold
% 
% nexttile(9)
% hold
% plot(T,C,'g.-','MarkerSize',20,'LineWidth',2)
% 
% %xticks([0:20]) xlim([-1 21])
% ylim([0 30])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% set(gca,'xticklabel','','tickdir','out')
% legend('30 Minutes')
% hold
% 
% nexttile(12)
% hold
% plot(T,D,'k.-','MarkerSize',20,'LineWidth',2)
% 
% %xticks([0:20]) xlim([-1 21])
% ylim([0 30])
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% set(gca,'tickdir','out')
% legend('60 Minutes')
% hold
% 
% All_Effluent.TileSpacing = 'tight';
% All_Effluent.Padding = 'compact';
% title(All_Effluent,'Effluent Microplastics')
% xlabel(All_Effluent,'Time (Days)')
% ylabel(All_Effluent,'Effluent Microplastics (\rho mL^{-1})')
% 
% Effluent_Analysis.WindowState = 'maximized';
% 
% export_fig(Effluent_Analysis,'Effluent_Analysis.png','-transparent')
% 
% Effluent_Analysis.WindowState = 'maximized';
% export_fig(Effluent_Analysis,'Effluent_Analysis.jpg')

Plastic = [A' B' C' D'];
Real1 = Plastic(1:6,:);
Real2 = Plastic(21,:);
Real3 = Plastic(23,:);
Plastic = [Real1;Real2;Real3];

A = Plastic(:,1);
B = Plastic(:,2);
C = Plastic(:,3);
D = Plastic(:,4);

figure()
boxplot(A)
figure()
boxplot (B)
figure()
boxplot(C)
figure()
boxplot(D)

figure()
boxchart(Plastic)
