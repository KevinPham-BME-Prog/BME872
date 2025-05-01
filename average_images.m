function out_img = average_images(varargin)
% This function calculates the synchronized average of any number of images.
% It assumes all images are the same size and are passed as arguments.

    img_sum = double(varargin{1});
    for i=2:nargin
        img = varargin{i};
        img_sum = img_sum + double(img);
    end

    out_img = img_sum ./ nargin;
end