format compact, format short,
clear, clc

Time = xlsread('ContactAngle.xlsx','Graphs','A37:A43')';

save('Time_Data.mat');