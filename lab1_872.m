direct = pwd;
r= 'Lab1-LungCT\training_post.mhd';
pather = strcat(direct, '\',r);
% 'C:\Users\lkevi\OneDrive\Desktop\BME872\Lab1 - LungCT\training_post.mhd'

[volCT, infoCT] = imageRead(pather, '.mhd', 'single');
imagedata = volCT.data;

% ASK KEVIN WHAT THIS IS FOR 
if min(imagedata(:)) ~= 0
    mingraylevel = min(imagedata(:));
    maxgraylevel = max(imagedata(:));
    imagedata2 = imagedata + abs(mingraylevel);
end

mingraylevel2 = min(imagedata2(:));
maxgraylevel2 = max(imagedata2(:));
sliceViewer(imagedata2, Parent=figure(1));
title("Lung CT Training Post MHD: Volume")
colorbar

%'C:\Users\lkevi\OneDrive\Desktop\BME872\Lab1 - BrainMRI1'
r2 = 'Lab1 - BrainMRI1';
pather2 = strcat(direct, '\',r2);
[volBrain, infoBrain] = imageRead(pather2, '.dcm', 'volume');
sliceViewer(volBrain, Parent = figure(2));
title("Brain MRI: Volume")
colorbar

%% Sandra changing 
r3 = 'Lab1 - BrainMRI1\brain_010.dcm';
path3 = strcat(direct, '\',r3);
[imgB10, info] = imageRead(path3, '.dcm', 'single');
I = dicomread("C:\Users\sygal\Documents\MATLAB\BME872\Lab1 - BrainMRI1\brain_010.dcm");
imhist(I);
%% Part 2 Histograms
%middle slice mri 1
subplot(121)
sgtitle('BrainMRI1 Slice 10')
imshow(volBrain(:, :, 10), []); colorbar;
subplot(122)
intensityHistogram(volBrain, '2d', true, false);

figure(2)
%middle slice lung ct
subplot(121)
sgtitle('LungCT Slice 143')
imshow(imagedata2(:, :, 143), []); colorbar;
subplot(122)
intensityHistogram(volBrain, '2d', true, false);



figure(3)
%volume brain
subplot(121)
sgtitle('BrainMRI1 Volume')
intensityHistogram(volBrain, '3d', true, false);
subplot(122)
intensityHistogram(volBrain, '3d', true, true);

figure(4)
%volume lung
subplot(121)
sgtitle('LungCT Volume')
intensityHistogram(imagedata2, '3d', true, false);
subplot(122)
intensityHistogram(imagedata2, '3d', true, true);

%%
figure(4)
montage(volBrain, 'DisplayRange', []);
title('Brain MRI1: All Slices')


%% this is for making and reading the png file
figure(7) %saved
imageWrite(imagedata2(:,:,78), '.png', 'imgCT_PNG')
pather2 = strcat(direct, '\','imgCT_PNG.png');
[ima, gor] = imageRead(pather2, '.png', 'single');
imshow(ima)
colorbar
figure(8) %original 
imshow((imagedata2(:,:,78)),[])
colorbar

%darkness = air, bright white = bone, grey = heart, shades of grey is
%different due to how often light can be passed/bounced around
%add theory to anser questions in the question