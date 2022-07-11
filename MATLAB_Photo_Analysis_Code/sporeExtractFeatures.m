NumBlobs = size(Centroids_red,1);
Table_red = zeros (NumBlobs, 15);

stats_red_Num = zeros (NumBlobs,1);
stats_red_Area = zeros (NumBlobs,1);
Centroids_red_r = Centroids_red(:,1);
Centroids_red_c = Centroids_red(:,2);
stats_red_Eccentricity = zeros (NumBlobs,1);
stats_red_Orientation = zeros (NumBlobs,1);
stats_red_EquivDiameter = zeros (NumBlobs,1);
stats_red_MajorAxisLength = zeros (NumBlobs,1);
stats_red_MinorAxisLength = zeros (NumBlobs,1);
stats_red_Perimeter = zeros (NumBlobs,1);
parfor n = 1:NumBlobs % write out the list of blobs and their properties
    %disp(sprintf('Blob number = %d, Area = %g, Centroid = (%g, %g), Eccentricity = %g, Orientation = %g, EquivDiameter = %g', n, stats_red(n).Area, stats_red(n).Centroid, stats_red(n).Eccentricity, stats_red(n).Orientation, stats_red(n).EquivDiameter));
    stats_red_Num(n) = n;
    stats_red_Area(n) = stats_red(n).Area;
    stats_red_Eccentricity(n) = stats_red(n).Eccentricity;
    stats_red_Orientation(n) = stats_red(n).Orientation;
    stats_red_EquivDiameter(n) = stats_red(n).EquivDiameter;
    stats_red_MajorAxisLength(n) = stats_red(n).MajorAxisLength;
    stats_red_MinorAxisLength(n) = stats_red(n).MinorAxisLength;
    stats_red_Perimeter(n) = stats_red(n).Perimeter;
end
Table_red(:, 1:10) = [stats_red_Num, ...
    stats_red_Area, ...
    Centroids_red_r, ...
    Centroids_red_c, ...
    stats_red_Eccentricity, ...
    stats_red_Orientation, ...
    stats_red_EquivDiameter, ...
    stats_red_MajorAxisLength, ...
    stats_red_MinorAxisLength, ...
    stats_red_Perimeter];
% % figure(17); % make a plot of the three matrices: bw_red and RLL
% % imshow(cImage_redchannel_original);
% % hold on
% % plot (Centroids_red(:,1), Centroids_red(:,2), 'g*')
% % labels_red = num2str((1:size(Centroids_red,1))','%d');
% % text(Centroids_red(:,1), Centroids_red(:,2), labels_red,'horizontal','left', 'vertical','bottom', 'BackgroundColor', [.7 .9 .7]);
% % hold off
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%Getting Intensity of each centroid%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
% %%%red CHANNEL
% imagesize=size(cImage_redchannel);
% centers=Centroids_red;
% [M,~]=size(centers);
% % M = 100;
% clear mask
% greenAverage=zeros(M,1); %%% Intensity of green channel regarding each centroid
% greenMax=zeros(M,1); %%% Max intensity of green channel regarding each centroid
% greenMin=zeros(M,1); %%% Min intensity of green channel regarding each centroid
% 
% redAverage=zeros(M,1); %%% Intensity of red channel regarding each centroid
% redDiff=zeros(M,1); %%% Difference between max and min intensity of red channel regarding each centroid
% redMax=zeros(M,1); %%% Max intensity of red channel regarding each centroid
% redMin=zeros(M,1); %%% Min intensity of red channel regarding each centroid
% 
% redAverage=zeros(M,1); %%% Intensity of red channel regarding each centroid
% redDiff=zeros(M,1); %%% Difference between max and min intensity of red channel regarding each centroid
% redMax=zeros(M,1); %%% Max intensity of red channel regarding each centroid
% redMin=zeros(M,1); %%% Min intensity of red channel regarding each centroid
% 
% SAverage=zeros(M,1); %%% Intensity of red channel regarding each centroid
% SDiff=zeros(M,1); %%% Difference between max and min intensity of red channel regarding each centroid
% SMax=zeros(M,1); %%% Max intensity of S channel regarding each centroid
% SMin=zeros(M,1); %%% Min intensity of S channel regarding each centroid
% 
% HAverage=zeros(M,1); %%% Intensity of red channel regarding each centroid
% HDiff=zeros(M,1); %%% Difference between max and min intensity of red channel regarding each centroid
% HMax=zeros(M,1); %%% Max intensity of red channel regarding each centroid
% HMin=zeros(M,1); %%% Min intensity of red channel regarding each centroid
% 
% VAverage=zeros(M,1); %%% Intensity of red channel regarding each centroid
% VDiff=zeros(M,1); %%% Difference between max and min intensity of red channel regarding each centroid
% VMax=zeros(M,1); %%% Max intensity of red channel regarding each centroid
% VMin=zeros(M,1); %%% Min intensity of red channel regarding each centroid
% 
% YAverage=zeros(M,1); %%% Intensity of red channel regarding each centroid
% YDiff=zeros(M,1); %%% Difference between max and min intensity of red channel regarding each centroid
% YMax=zeros(M,1); %%% Max intensity of red channel regarding each centroid
% YMin=zeros(M,1); %%% Min intensity of red channel regarding each centroid
% 
% 
% CbAverage=zeros(M,1); %%% Intensity of red channel regarding each centroid
% CbDiff=zeros(M,1); %%% Difference between max and min intensity of red channel regarding each centroid
% CbMax=zeros(M,1); %%% Max intensity of red channel regarding each centroid
% CbMin=zeros(M,1); %%% Min intensity of red channel regarding each centroid
% 
% CrAverage=zeros(M,1); %%% Intensity of red channel regarding each centroid
% CrDiff=zeros(M,1); %%% Difference between max and min intensity of red channel regarding each centroid
% CrMax=zeros(M,1); %%% Max intensity of red channel regarding each centroid
% CrMin=zeros(M,1); %%% Min intensity of red channel regarding each centroid
% 
% centers_r = centers(:,1);
% centers_c = centers(:,2);
% 
% imagesize1 = imagesize(1);
% imagesize2 = imagesize(2);
% t = linspace(0,2*pi,50);
% % tic
% parfor i=1:M
%     
%     
%         ci = [centers_c(i),centers_r(i),10];
% %         [xx,yy]=ndgrid((1:imagesize1) - ci(1), (1:imagesize2)-ci(2));
% %         tempMask = (xx.^2+yy.^2)<ci(3)^2;
%         tempMask = poly2mask(ci(3)*cos(t)+ci(2), ci(3)*sin(t)+ci(1), imagesize1, imagesize2);
% 
% %         minx = floor(ci(1) - ci(3));
% %         miny = floor(ci(2) - ci(3));
% %         maxx = ceil(ci(1) + ci(3));
% %         maxy = ceil(ci(2) + ci(3));
% %         
% %         if minx < 1
% %             minx = 1;
% %         end
% %         if miny < 1
% %             miny = 1;
% %         end
% %         if maxx > imagesize1
% %             maxx = imagesize1;
% %         end
% %         if maxy > imagesize2
% %             maxy = imagesize2;
% %         end
% 
% 
%         % tempI=uint8(ones(imagesize1,imagesize2)*255);
%         %croppedImage=uint8(zeros(size(cImage)));
%         %croppedImage = cImage.*mask;
%         %cImage=croppedImage;
%         %if exist('mask','var')
%         
%         %mask=mask+tempMask;
%         %else
%         
%         %mask=tempMask;
%         %end
%         
%         %%%%Process green Intensity
%         I2=cImage_greenchannel(tempMask);
%         nonZeroElements=length(I2);
%         %imshow(I2)
%         [maxValue,~]=max(I2);
% %         I3=I2; %%% I3 is a new variable that will not contain any zero values. This is just not to get always a minimum of 0
%         %indices = find(I2==0);
% %         I3(I2==0)=[];
%         [minValue,~]=min(I2); %%Get the minimum nonzero value
%         
%         if isempty (minValue)
%             
%             minValue=0;
%         end
%         if isempty (maxValue)
%             
%             maxValue=0;
%         end
%         
%         
%         
%         greenDiff(i)=maxValue-minValue;
%         greenMax(i)=maxValue;
%         greenMin(i)=minValue;
%         averageI=sum(I2)/nonZeroElements;
%         greenAverage(i)=averageI;%%%% Intensity of green channel regarding each centroid "i"
%         
%         %%%%Process Red Intensity
% %         clear I2;
% %         clear I3;
%         I2=cImage_redchannel(tempMask);
%         nonZeroElements=length(I2);
%         %imshow(I2)
%         [maxValue,~]=max(I2);
% %         I3=I2; %%% I3 is a new variable that will not contain any zero values. This is just not to get always a minimum of 0
%         %indices = find(I2==0);
% %         I3(I2==0)=[];
%         [minValue,~]=min(I2); %%Get the minimum nonzero value
%         
%         
%         if isempty(minValue)
%             
%             minValue=0;
%         end
%         if isempty(maxValue)
%             
%             maxValue=0;
%         end
%         
%         
%         redDiff(i)=maxValue-minValue;
%         redMax(i)=maxValue;
%         redMin(i)=minValue;
%         averageR=sum(I2)/nonZeroElements;
%         redAverage(i)=averageR;%%%% Intensity of red channel regarding each centroid "i"
%         
%         %%%%Process red Intensity
%         
% %         clear I2;
% %         clear I3;
%         I2=cImage_redchannel(tempMask);
%         nonZeroElements=length(I2);
%         %imshow(I2)
%         [maxValue,~]=max(I2);
% %         I3=I2; %%% I3 is a new variable that will not contain any zero values. This is just not to get always a minimum of 0
%         %indices = find(I2==0);
% %         I3(I2==0)=[];
%         [minValue,~]=min(I2); %%Get the minimum nonzero value
%         
%         if isempty(minValue)
%             
%             minValue=0;
%         end
%         if isempty(maxValue)
%             
%             maxValue=0;
%         end
%         
%         
%         
%         
%         redDiff(i)=maxValue-minValue;
%         redMax(i)=maxValue;
%         redMin(i)=minValue;
%         averageB=sum(I2)/nonZeroElements;
%         redAverage(i)=averageB;%%%% Intensity of red channel regarding each centroid "i"
%         
%         %%%Process H CHannel
% %         tempMask2=double(tempMask);
% %         clear I2;
% %         clear I3;
%         I2=cImage_Hchannel(tempMask);
%         nonZeroElements=length(I2);
%         %imshow(I2)
%         [maxValue,~]=max(I2);
% %         I3=I2; %%% I3 is a new variable that will not contain any zero values. This is just not to get always a minimum of 0
%         %indices = find(I2==0);
% %         I3(I2==0)=[];
%         [minValue,~]=min(I2); %%Get the minimum nonzero value
%         
%         if isempty(minValue)
%             
%             minValue=0;
%         end
%         if isempty(maxValue)
%             
%             maxValue=0;
%         end
%         
%         
%         
%         
%         HDiff(i)=maxValue-minValue;
%         HMax(i)=maxValue;
%         HMin(i)=minValue;
%         averageH=sum(I2)/nonZeroElements;
%         HAverage(i)=averageH;%%%% Intensity of red channel regarding each centroid "i"
%         
%         %%%Process S CHannel
%         
% %         clear I2;
% %         clear I3;
%         I2=cImage_Schannel(tempMask);
%         nonZeroElements=length(I2);
%         %imshow(I2)
%         [maxValue,~]=max(I2);
% %         I3=I2; %%% I3 is a new variable that will not contain any zero values. This is just not to get always a minimum of 0
%         %indices = find(I2==0);
% %         I3(I2==0)=[];
%         [minValue,~]=min(I2); %%Get the minimum nonzero value
%         
%         
%         if isempty(minValue)
%             
%             minValue=0;
%         end
%         if isempty(maxValue)
%             
%             maxValue=0;
%         end
%         
%         
%         
%         SDiff(i)=maxValue-minValue;
%         SMax(i)=maxValue;
%         SMin(i)=minValue;
%         averageS=sum(I2)/nonZeroElements;
%         SAverage(i)=averageS;%%%% Intensity of red channel regarding each centroid "i"
%         
%         %%%Process V CHannel
%         
% %         clear I2;
% %         clear I3;
%         I2=cImage_Vchannel(tempMask);
%         nonZeroElements=length(I2);
% %         imshow(I2)
%         [maxValue,~]=max(I2);
% %         I3=I2; %%% I3 is a new variable that will not contain any zero values. This is just not to get always a minimum of 0
%         %indices = find(I2==0);
% %         I3(I2==0)=[];
%         [minValue,~]=min(I2); %%Get the minimum nonzero value
%         
%         if isempty(minValue)
%             
%             minValue=0;
%         end
%         if isempty(maxValue)
%             
%             maxValue=0;
%         end
%         
%         
%         
%         
%         VDiff(i)=maxValue-minValue;
%         VMax(i)=maxValue;
%         VMin(i)=minValue;
%         averageV=sum(I2)/nonZeroElements;
%         VAverage(i)=averageV;%%%% Intensity of red channel regarding each centroid "i"
%         
%         %%%Process Y CHannel
%         
% %         clear I2;
% %         clear I3;
%         I2=cImage_Ychannel(tempMask);
%         nonZeroElements=length(I2);
% %         imshow(I2)
%         [maxValue,~]=max(I2);
% %         I3=I2; %%% I3 is a new variable that will not contain any zero values. This is just not to get always a minimum of 0
%         %indices = find(I2==0);
% %         I3(I2==0)=[];
%         [minValue,~]=min(I2); %%Get the minimum nonzero value
%         
%         
%         if isempty(minValue)
%             
%             minValue=0;
%         end
%         if isempty(maxValue)
%             
%             maxValue=0;
%         end
%         
%         
%         
%         YDiff(i)=maxValue-minValue;
%         YMax(i)=maxValue;
%         YMin(i)=minValue;
%         averageY=sum(I2)/nonZeroElements;
%         YAverage(i)=averageY;%%%% Intensity of red channel regarding each centroid "i"
%         
%         %%%Process Cb CHannel
%         
% %         clear I2;
% %         clear I3;
%         I2=cImage_Cbchannel(tempMask);
%         nonZeroElements=length(I2);
% %         imshow(I2)
%         [maxValue,~]=max(I2);
% %         I3=I2; %%% I3 is a new variable that will not contain any zero values. This is just not to get always a minimum of 0
%         %indices = find(I2==0);
% %         I3(I2==0)=[];
%         [minValue,~]=min(I2); %%Get the minimum nonzero value
%         
%         
%         if isempty(minValue)
%             
%             minValue=0;
%         end
%         if isempty(maxValue)
%             
%             maxValue=0;
%         end
%         
%         
%         
%         CbDiff(i)=maxValue-minValue;
%         CbMax(i)=maxValue;
%         CbMin(i)=minValue;
%         averageCb=sum(I2)/nonZeroElements;
%         CbAverage(i)=averageCb;%%%% Intensity of red channel regarding each centroid "i"
%         
%         %%%Process Cr CHannel
%         
% %         clear I2;
% %         clear I3;
%         I2=cImage_Crchannel(tempMask);
%         nonZeroElements=length(I2);
% %         imshow(I2)
%         [maxValue,~]=max(I2);
% %         I3=I2; %%% I3 is a new variable that will not contain any zero values. This is just not to get always a minimum of 0
%         %indices = find(I2==0);
% %         I3(I2==0)=[];
%         [minValue,~]=min(I2); %%Get the minimum nonzero value
%         
%         if isempty(minValue)
%             
%             minValue=0;
%         end
%         if isempty(maxValue)
%             
%             maxValue=0;
%         end
%         
%         
%         
%         
%         CrDiff(i)=maxValue-minValue;
%         CrMax(i)=maxValue;
%         CrMin(i)=minValue;
%         averageCr=sum(I2)/nonZeroElements;
%         CrAverage(i)=averageCr;%%%% Intensity of red channel regarding each centroid "i"
%         
%         
%    
% end
% % toc
% 
% 
% %I2=cImage_redchannel.*mask;
% %imshow(I2)
% %%%Adding intensity to original table red and table red
% 
% 
% % tic
% % maxVals = zeros(M,9);
% % minVals = zeros(M,9);
% % % diffVals = zeros(M,9);
% % averageVals = zeros(M,9);
% % parfor i=1:M
% %     ci = [centers_c(i),centers_r(i),3];
% %     tempMask = poly2mask(ci(3)*cos(t)+ci(2), ci(3)*sin(t)+ci(1), imagesize1, imagesize2);
% % 
% %     I2 = [cImage_redchannel_original(tempMask), ...
% %           cImage_redchannel_original(tempMask), ...
% %           cImage_redchannel_original(tempMask), ...
% %           cImage_Hchannel(tempMask), ...
% %           cImage_Schannel(tempMask), ...
% %           cImage_Vchannel(tempMask), ...
% %           cImage_Ychannel(tempMask), ...
% %           cImage_Cbchannel(tempMask), ...
% %           cImage_Crchannel(tempMask)];
% %     maxVals(i,:) = max(I2);
% %     minVals(i,:) = min(I2);
% %     averageVals(i,:) = sum(I2)/size(I2,1);
% % end
% % maxVals(isempty(maxVals)) = 0;
% % minVals(isempty(minVals)) = 0;
% % diffVals = maxVals - minVals;
% % toc
% 
% Table_red(:,11) = greenAverage;
% Table_red(:,12) = greenDiff;
% Table_red(:,13) = greenMax;
% Table_red(:,14) = greenMin;
% 
% Table_red(:,15) = redAverage;
% Table_red(:,16) = redDiff;
% Table_red(:,17) = redMax;
% Table_red(:,18) = redMin;
% 
% Table_red(:,19) = redAverage;
% Table_red(:,20) = redDiff;
% Table_red(:,21) = redMax;
% Table_red(:,22) = redMin;
% 
% Table_red(:,23) = HAverage;
% Table_red(:,24) = HDiff;
% Table_red(:,25) = HMax;
% Table_red(:,26) = HMin;
% 
% Table_red(:,27) = SAverage;
% Table_red(:,28) = SDiff;
% Table_red(:,29) = SMax;
% Table_red(:,30) = SMin;
% 
% Table_red(:,31) = VAverage;
% Table_red(:,32) = VDiff;
% Table_red(:,33) = VMax;
% Table_red(:,34) = VMin;
% 
% Table_red(:,35) = YAverage;
% Table_red(:,36) = YDiff;
% Table_red(:,37) = YMax;
% Table_red(:,38) = YMin;
% 
% Table_red(:,39) = CbAverage;
% Table_red(:,40) = CbDiff;
% Table_red(:,41) = CbMax;
% Table_red(:,42) = CbMin;
% 
% Table_red(:,43) = CrAverage;
% Table_red(:,44) = CrDiff;
% Table_red(:,45) = CrMax;
% Table_red(:,46) = CrMin;
% 
% Table_red(:,47) = redAverage-redAverage;
% Table_red(:,48) = redDiff-redDiff;
% Table_red(:,49) = redMax-redMax;
% Table_red(:,50) = redMin-redMin;
% 
% Table_red(:,51) = HAverage-SAverage;
% Table_red(:,52) = HDiff-SDiff;
% Table_red(:,53) = HMax-SMax;
% Table_red(:,54) = HMin-SMin;
% 
% Table_red(:,55) = HAverage-VAverage;
% Table_red(:,56) = HDiff-VDiff;
% Table_red(:,57) = HMax-VMax;
% Table_red(:,58) = HMin-VMin;
% 
% Table_red(:,59) = SAverage-VAverage;
% Table_red(:,60) = SDiff-VDiff;
% Table_red(:,61) = SMax-VMax;
% Table_red(:,62) = SMin-VMin;
% 
% Table_red(:,63) = YAverage-CbAverage;
% Table_red(:,64) = YDiff-CbDiff;
% Table_red(:,65) = YMax-CbMax;
% Table_red(:,66) = YMin-CbMin;
% 
% Table_red(:,67) = CbAverage-CrAverage;
% Table_red(:,68) = CbDiff-CrDiff;
% Table_red(:,69) = CbMax-CrMax;
% Table_red(:,70) = CbMin-CrMin;
% 
% Table_red(:,71) = YAverage-CrAverage;
% Table_red(:,72) = YDiff-CrDiff;
% Table_red(:,73) = YMax-CrMax;
% Table_red(:,74) = YMin-CrMin;
% 
% 
% 
finalMatrix=Table_red;
[M,N]=size(finalMatrix);
columnzeros=zeros(M,1);
finalMatrix=[columnzeros, finalMatrix];
% %%%Save it to a .mat file
% % filename='WP_20140505_16_49_36_Raw__highres.mat';
% %  save(fullFileName, 'finalMatrix')