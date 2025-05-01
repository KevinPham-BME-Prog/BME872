function [kern_mat_x kern_mat_y] = derivative_kernal(selector)
% derivative_kernal:
% returns a chosen commonly used kernal to estimate a gradient
%
% Consists of four options:
% Central Difference -  |1 0 -1|
%
% Forward Difference -  |0 1 -1|
%
%                       |1 0 -1|
% Prewitt -             |1 0 -1| 
%                       |1 0 -1|
%
%                       |1 0 -1|
% Sobel -               |2 0 -2| 
%                       |1 0 -1|
%
% Input - selector:
% String input
% kern_mat = derivative_kernal('Central')
% Returns the Central difference stored in kern_mat as  [1 0 -1]
%
% kern_mat = derivative_kernal('Forward')
% Returns the Forward difference stored in kern_mat as  [0 1 -1]
%
% kern_mat = derivative_kernal('Prewitt')
% Returns the Prewitt stored in kern_mat as  [1 0 -1; 1 0 -1; 1 0 -1]
%
% kern_mat = derivative_kernal('Sobel')
% Returns the Sobel stored in kern_mat as  [1 0 -1; 2 0 -2; 1 0 -1]
%
% For Invalid Options the function will return 'Invalid Option'

if strcmp(selector, 'Central')
    kern_mat_x = [1 0 -1];
    kern_mat_y = transpose(kern_mat_x);
elseif strcmp(selector, 'Forward')
    kern_mat_x = [0 1 -1];
    kern_mat_y = transpose(kern_mat_x);
elseif strcmp(selector, 'Prewitt')
    kern_mat_x = [1 0 -1; 1 0 -1; 1 0 -1];
    kern_mat_y = transpose(kern_mat_x);
elseif strcmp(selector, 'Sobel')
    kern_mat_x = [1 0 -1; 2 0 -2; 1 0 -1];
    kern_mat_y = transpose(kern_mat_x);
else
    fprintf('Invalid Option')
end
    

