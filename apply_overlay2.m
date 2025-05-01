function overlaidImage = apply_overlay2(baseImage, overlayImage, color, alpha)
    % Validate inputs
    if nargin < 4
        alpha = 0.5; % Default transparency
    end
    if nargin < 3
        color = [1, 0, 0]; % Default color (red)
    end

    % Ensure base image is grayscale
    if size(baseImage, 3) ~= 1
        error('Base image must be a grayscale image.');
    end

    % Handle overlay image
    if size(overlayImage, 3) == 1 % If grayscale, apply color
        % Apply color to grayscale image and convert to uint8
        overlayImage = uint8(cat(3, color(1) * double(overlayImage), color(2) * double(overlayImage), color(3) * double(overlayImage)) * 255);
    elseif size(overlayImage, 3) ~= 3
        error('Overlay image must be either grayscale or RGB.');
    end

    % % Resize overlay image to match base image, if necessary
    % if size(baseImage, 1) ~= size(overlayImage, 1) || size(baseImage, 2) ~= size(overlayImage, 2)
    %     overlayImage = imresize(overlayImage, [size(baseImage, 1), size(baseImage, 2)]);
    % end

    % Convert base image to RGB (if it's grayscale)
    baseImage = repmat(baseImage, [1, 1, 3]);

    % Perform overlay with alpha blending
    overlaidImage = uint8(alpha * double(overlayImage) + (1 - alpha) * double(baseImage));
end