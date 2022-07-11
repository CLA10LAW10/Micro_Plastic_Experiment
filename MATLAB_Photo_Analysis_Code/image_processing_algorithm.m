function [output_args] = image_processing_algorithm(input_args)
%clc  % Clear the command window.
close all % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
%clear all % Erase all existing variables.
fontSize = 11;

%% PARSE FILE NAME OF DNG FROM PATH.
pathname = input_args;
[pathstr,raw_file,ext] = fileparts(input_args); %raw_file = WP...highres, ext = .dng, 
  
fprintf('Raw file: %s\n', raw_file);
fprintf('Path string: %s\n', pathstr);
fprintf('Extension: %s\n', ext);

% [raw_file, pathname] = uigetfile('*.dng', 'Select a DNG file');
%% CONVERT FROM RAW TO TIFF WITHOUT LOSS.
% Using dcraw reader as DNG converter. Be sure that dcraw reader.exe should
% be in the same folder with this .m file.
ReadNokiaRaw(input_args);
filename = strrep(input_args, '.dng', '.tiff');
pathname = pathstr;
 
% %% CONVERT BAYERN PATTERN ENCODED IMAGE TO TRUECOLOR IMAGE.
I = imread(filename);  % Bayern pattern image  % Note: Bayern pattern of the camera (i.e., bggr, rggb, etc.) used should be checked.
[m,n] = size(I);
if m<n 

  I = imrotate(I,-90);
  
end
% I = demosaic(I,'rggb');
%  G = I(2:2:end,1:2:end); % green channel
%  R = I(2:2:end, 2:2:end); % red channel
%  B = I(1:2:end, 1:2:end); % blue channel
 
 

% figure, imshow(I);
 %imcrop
% S = imcrop  (I, [1636.5 2692.5 2152 1984]);
% [m,n] = size (S);
% S0 = S;
% S1 = S(1:335, 1:282);
% S2 = S(1:335, 283:564);
% S3 = S(1:335, 565:846);
% S4 = S(1:335, 847:1128);
% 
% S5 = S(336:670, 1:282);
% S6 = S(336:670, 283:564);
% S7 = S(336:670, 565:846);
% S8 = S(336:670, 847:1128);
% 
% S9 = S(671:1005, 1:282);
% S10 = S(671:1005, 283:564);
% S11= S(671:1005, 565:846);
% S12= S(671:1005, 847:1128);

 imwrite(I, strcat(pathstr, '\', raw_file, '.tiff'));
% imwrite(S1, '1.tiff'); 
% imwrite(S2, '2.tiff');
% imwrite(S3, '3.tiff');
% imwrite(S4, '4.tiff');
% imwrite(S5, '5.tiff');
% imwrite(S6, '6.tiff');
% imwrite(S7, '7.tiff');
% imwrite(S8, '8.tiff');
% imwrite(S9, '9.tiff');
% imwrite(S10, '10.tiff');
% imwrite(S11, '11.tiff');
% imwrite(S12, '12.tiff');

end

