function lut = stretch_lut(img)
img = double(img);
I_min = min(img(img > 0));
I_max = max(img(:));
lut = (0:255) *(1/ (I_max - I_min)) - I_min / (I_max - I_min);
lut = 255 * lut;
lut = uint8(lut);

end