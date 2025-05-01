function [bins, freq] = intensityHistogram(img, options, plot, norm)
%INTENSITYHISTOGRAM computes graylevel histogram for a volume or a slice of
%a volume
%   accepts a volume (option: 3d) and can take middle slice of volume (option: 2dms)
%   can take a single image (option: 2d), also can specify it's 8 bit
%   (option: 2d8bit)
%   outputs the bins (intensities) and frequencies (# of occurences)

    
if strcmp(options, '2d8bit')
    maxintensity = 255; 
    bins = 1:(maxintensity+1);
    freq = zeros(1, maxintensity+1);
    else
    maxintensity = max(img(:));
    bins = 1:(maxintensity+1);
    freq = zeros(1, maxintensity+1);
end

% all images were thresholded in part 1, and do not need to be for part 2

dim = size(img, [1, 2, 3]);
%if 2d desired, use middle slice of volume 
if strcmp(options, '2d')  || strcmp(options, '2d8bit')  
    for j = 1:dim(2)
        for k = 1:dim(1)
            int = img(k, j);  
             %looking at middle slice
            freq(int+1) = freq(int+1)+1;
        end
    end
end

if strcmp(options, '2dms')
    ms = round(dim(3)/2); 
    for j = 1:dim(2)
        for k = 1:dim(1)
            int = img(k, j, ms);
            freq(int+1) = freq(int+1)+1;
        end 
    end 
end

if strcmp(options, '3d')
    for i = 1:dim(3) 
        for j = 1:dim(2)
            for k = 1:dim(1)
                int = img(k, j, i);
                freq(int+1) = freq(int+1)+1;
            end
        end
    end
end 

[~, index] = max(freq(:)); 
freq(index) = 0;

if plot 
    
    if norm 
        if strcmp(options, '3d')
        freq = freq./(prod(dim));
        else 
        freq = freq./(prod(dim(1)*dim(2)));
        end
        
    end

    bar(bins, freq, 'black');
   
    if norm 
        title('Normalized Intensity Histogram (PDF)');
    else
        title('Intensity Histogram');
    end

    xlabel('Intensities');
    ylabel('Frequency');
    colormap gray; axis('tight');
    colorbar('location', 'southoutside')

%     clim([0, maxintensity]);
        %TickLabels=[0:400:maxintensity]);
    if strcmp(options, '2d8bit')
        clim([0, 255]);
    else 
        clim([0, maxintensity]);
    end

end



end