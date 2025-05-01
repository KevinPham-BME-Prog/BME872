function out = image_threshold(img, T)
%under the assumption that the img is a value from 0 to 1 as it is
%converted to a double

out = imbinarize(img, T);
