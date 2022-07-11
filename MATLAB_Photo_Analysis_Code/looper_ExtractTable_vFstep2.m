% Start with a folder and get a list of all subfolders.
% Finds and prints names of all PNG, JPG, and TIF images in
% that folder and all of its subfolders.
clc;    % Clear the command window.
clear all;
workspace;  % Make sure the workspace panel is showing.
format longg;
format compact;

% Define a starting folder.
start_path = fullfile(matlabroot, '\images');
% Ask user to confirm or change.
topLevelFolder = uigetdir(start_path);
if topLevelFolder == 0
    return;
end
% Get list of all subfolders.
allSubFolders = genpath(topLevelFolder);
% Parse into a cell array.
remain = allSubFolders;
listOfFolderNames = {};
while true
    [singleSubFolder, remain] = strtok(remain, ';');
    if isempty(singleSubFolder)
        break;
    end
    listOfFolderNames = [listOfFolderNames singleSubFolder];
end
numberOfFolders = length(listOfFolderNames);
AllResult = zeros (3,3);
AllResult = num2cell(AllResult);
% Process all image files in those folders.
for k = 1 : numberOfFolders
    % Get this folder and print it out.
    thisFolder = listOfFolderNames{k};
    fprintf('Processing folder %s\n', thisFolder);
    
    % Get the TIFF file.
    filePattern = sprintf('%s/*.tiff', thisFolder);
    %     filePattern = sprintf('%s/*.mat', thisFolder);
    baseFileNames = dir(filePattern);
    numberOfImageFiles = length(baseFileNames);
        
    if numberOfImageFiles >= 1
        % Go through all those image files.
        
        for f = numberOfImageFiles :-1:1
            fullFileName = fullfile(thisFolder, baseFileNames(f).name);
            [imagedirectory, filename, extension] = fileparts(fullFileName);
            fprintf('     Processing matrix file %s\n', fullFileName);
            clear RGBImage;
            clear h;
            clear greenDiff;
            [IM_DIR,name,ext] = fileparts(fullFileName);
            
            % CONVERT BAYERN PATTERN ENCODED IMAGE TO TRUECOLOR IMAGE.
            I = imread([IM_DIR, '\', name, '.tiff']);  % Bayern pattern image  
            % Note: Bayern pattern of the camera (i.e., bggr, rggb, etc.) used should be checked.
            % J = demosaic(I, 'rggb');  % Truecolor image
            % I=I';
            [m,n] = size (I);
            if m>n
                I = imrotate(I,-90);
            end
            
            G = I(:,:,2);
            R = I (:,:,1);
            B = I (:,:,3);
            
            figure ('Name',filename), imshow (R, []);
            [rows, columns, numberOfColorChannels] = size(R);
            
            % Ask user to draw a circle:
            uiwait(helpdlg('Please click and drag out a circle.'));
            h.Radius = 0;
            while h.Radius == 0
                h = drawcircle('StripeColor','red','FaceAlpha',0.4)
                if h.Radius == 0
                    uiwait(helpdlg('You double-clicked.  You need to single click, then drag, then single click again.'));
                end
            end
            % Get coordinates of the circle.
            angles = linspace(0, 2*pi, 10000);
            x = cos(angles) * h.Radius + h.Center(1);
            y = sin(angles) * h.Radius + h.Center(2);
            
            % Get a mask of the circle
            mask = poly2mask(x, y, rows, columns);
            
            maskedImage = R; % Initialize with the entire image.
            maskedImage(~mask) = 0; % Zero image outside the circle mask.
            
            % Crop the image to the bounding box.
            props = regionprops(mask, 'BoundingBox');
            maskedImage = imcrop(maskedImage, props.BoundingBox);
            
            R = maskedImage;
            
            % Background subtraction
            % In order to map the contaminants that are seen
            % at red channel
            [m,n] = size (R);
            for r = 1:m
                for c = 1:n
                    if R(r,c)<= 8000 %9000
                        R(r,c) = 0;
                    end
                end
            end
            R = medfilt2(R,[3 3]);
            bw_red = im2bw(R,0.02);
            
            % Differentiating cysts and the contaminants on the image (red channel)
            ccc_red = bwconncomp(bw_red, 8);
            numPixels_red = cellfun(@numel,ccc_red.PixelIdxList);
            XXX_red=numPixels_red<50;
            [~,jnd_red,~] = find(XXX_red);
            for futoind=1:size(jnd_red,2)
                bw_red(ccc_red.PixelIdxList{jnd_red(futoind)})=0;
            end
            
            % REGIONPROPS
            RLL_red = bwlabel(bw_red,8); % to identify and count the blobs
            stats_red = regionprops(bw_red,'Area','Centroid', 'Eccentricity', 'Orientation', 'EquivDiameter','MajorAxisLength','MinorAxisLength','Perimeter'); % to compute the properties of blobs.
            
            Centroids_red_all = cat (1, stats_red.Centroid);
            Centroids_red = Centroids_red_all;
            
            if size(Centroids_red,1) == 0
                spore = 0;
                
            else
                spore = size(Centroids_red,1);
                sporeExtractFeatures;
            end
            
            
            figure('Name', filename);
            imshow(R);
%             hold on
%             plot (Centroids_red(:,1), Centroids_red(:,2), 'r*')
%             labels_red = num2str((1:size(Centroids_red,1))','%d');
%             text(Centroids_red(:,1), Centroids_red(:,2), labels_red,'horizontal','left', 'vertical','bottom', 'BackgroundColor', [.7 .9 .7]);
%             hold off
            
           % save(strcat(thisFolder, '\', filename, '.mat'), 'finalMatrix');
            
            Result (f,1) = {filename};
            Result (f,2) = {spore};
            Result (f,3) = {thisFolder};
            %close all
        end
        AllResult = [AllResult ; Result];
    else
        fprintf('     Folder %s has no image files in it.\n', thisFolder);
    end
end
