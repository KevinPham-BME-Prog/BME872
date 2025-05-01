function out_img = image_subtraction(img1,img2)
% subtracts two images
    out_img = img1 - img2;
    out_img(out_img<0) = 0;
end