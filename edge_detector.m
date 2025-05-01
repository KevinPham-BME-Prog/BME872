function edges = edge_detector(img, H, T, wndsz)
%checks for edges in a image

%inputs:
%img being processed (greyscale or RGB)
%H: filtering kernal (approximate horizontal derivative)
%T: option - trhreshold byt edge detector (defualt 0.1)
%wndsz: option determine size of NMS filter window (default:5)
%outputs:
%edges: binary image where '1' indicates an image edge

img = im2double(img);

%check if image is a rgb 
if size(img, 3) > 1
    img = rgb2gray(img);
end

%nargin return number of input arguments (set def7ualts)

if nargin == 2
    T = 0.1;
    wndsz = 5;
end

h = 1/331 * [1 4 7 4 1; 4 20 33 20 4; 7 33 55 33 7; 4 20 33 20 4; 1 4 7 4 1];

img = spatial_filter(img, h);

help derivative_kernal
response = input('Enter Kernal type: ');
[kernalx, kernaly] = derivative_kernal(response);