function out_img = contrast_trfm_curve(img, Tr)
out_img = img;
dimen = size(img);
for x = 1:dimen(1)
    for y = 1:dimen(2)
        out_img(x,y) = Tr(img(x,y) + 1);
    end
end
out_img = uint8(out_img);
end