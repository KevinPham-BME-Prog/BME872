function out_img = apply_mask(img,img_mask)
% masks input image and returns the image where mask > 0
    out_img = img .* img_mask;
end