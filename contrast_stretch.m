function [newimage, Imin, Imax] = contrast_stretch(img)

Imin = double(min(img(img > 0)));
Imax = double(max(img(img <= 256)));
img = double(img);
p1 = 1/ (Imax - Imin) *img;
p2 = p1 - (Imin/(Imax - Imin));
newimage = p2 * 255;
newimage = uint8(newimage); %must convert to uint8 as this is proper format

end