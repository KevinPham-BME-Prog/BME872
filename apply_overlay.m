function overlayImg = apply_overlay(img,mask,color,transparency)
% allows the use of color and transparency to view binary mask and image
% at the same time (overlayed)
    if nargin < 4
        transparency = 0.5; % Default transparency
    end
    if nargin < 3
        color = [1, 0, 0]; % Default color (red)
    end

    % Check if the image is grayscale or color
    if size(img, 3) == 1
        img = cat(3, img, img, img); % Convert to RGB
    end
    
    % Create an RGB representation of the mask
    maskRGB = cat(3, color(1) * mask, color(2) * mask, color(3) * mask);

    % Overlay the mask on the image
    overlayImg = uint8(transparency * double(maskRGB) + (1 - transparency) * double(img));

end