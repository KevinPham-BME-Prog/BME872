function [img, info] = imageRead(filepath, imgformat, options) 
%notes Lab1 - BrainMRI1 is a folder that when combined is a volume of a patient tho header info changes slightly
%for the files you have to use the absolute path of the functions 

if contains(imgformat, 'mhd') %need to adjust this one
    [img, info] = read_mhd(filepath); %for file path ensure it is the absolute path for it and must the folders containing the files must be within the same folder of the overall fucntion

%needs folder path
elseif contains(imgformat, 'dcm') %dicom setup
    if strcmp(options, 'volume') 
        imagedir = dir(filepath);
        imagefilenm =struct2cell(imagedir(3:end)); 
        img = [];
        info = [];
        for i = imagefilenm(1,:)
            r = char(i);
            r2  = strcat(filepath, '/',r);
            img = cat(3,img, dicomread(r2));
            info = cat(2, info,dicominfo(r2));
        end
        % end result creates a n by m by i matrix, n by m is the picture
        % dimension while i is the number of pictures in volume
    else
        %this section of the code is if we need to open the files one by one
        img = dicomread(filepath); %this makes a array that stores the pixel values in greyscale
        info = dicominfo(filepath); %this creates a struct that consists of multiple sections
    end

elseif contains(imgformat, 'png')
    img = imread(filepath, 'png');
    info = imageinfo(filepath);
elseif contains(imgformat, 'pgm')
    img = imread(filepath, 'pgm');
    info = imageinfo(filepath);
else
    fprintf('Invalid Option')
    img = [];
    info = [];

end