direct = pwd;
r = "glaucoma\glaucoma\01_g.jpg";
pather = strcat(direct, '\',r);
img = imread(pather);
img = im2double(img);
img = rgb2gray(img);
figure(1)
imshow(img)

h = 1/331 .* [1 4 7 4 1; 4 20 33 20 4; 7 33 55 33 7; 4 20 33 20 4; 1 4 7 4 1];
%%
smoothed = spatial_filter(img, h);
figure(2)
imshow(smoothed, [])

%%
[kern_mat_x, kern_mat_y] = derivative_kernal('Central');
figure(3)
subplot(221)
imshow(img)
title('Orignal Image')
subplot(222)
kern_mat_image1 = spatial_filter(img, kern_mat_x);
imshow(kern_mat_image1, [])
title('X Gradient Image')

subplot(223)
kern_mat_image2 = spatial_filter(img, kern_mat_y);
imshow(kern_mat_image2, [])
title('Y Gradient Image')

subplot(224)
kern_mat_image3 = sqrt(kern_mat_image1.^2 + kern_mat_image2.^2);
imshow(kern_mat_image3, [])
title('Gradient Magnitude Image')

%%
[kern_mat_x, kern_mat_y] = derivative_kernal('Forward');
figure(4)
subplot(2,2, 1)
imshow(img)
title('Orignal Image')
subplot(2,2, 2)
kern_mat_image1 = spatial_filter(img, kern_mat_x);
imshow(kern_mat_image1, [])
title('X Gradient Image')

subplot(2,2, 3)
kern_mat_image2 = spatial_filter(img, kern_mat_y);
imshow(kern_mat_image2, [])
title('Y Gradient Image')

subplot(2,2, 4)
kern_mat_image3 = sqrt(kern_mat_image1.^2 + kern_mat_image2.^2);
imshow(kern_mat_image3, [])
title('Gradient Magnitude Image')

%%
[kern_mat_x, kern_mat_y] = derivative_kernal('Prewitt');
figure(5)
subplot(2,2, 1)
imshow(img)
title('Orignal Image')
subplot(2,2, 2)
kern_mat_image1 = spatial_filter(img, kern_mat_x);
imshow(kern_mat_image1, [])
title('X Gradient Image')

subplot(2,2, 3)
kern_mat_image2 = spatial_filter(img, kern_mat_y);
imshow(kern_mat_image2, [])
title('Y Gradient Image')

subplot(2,2, 4)
kern_mat_image3 = sqrt(kern_mat_image1.^2 + kern_mat_image2.^2);
imshow(kern_mat_image3, [])
title('Gradient Magnitude Image')

%%
[kern_mat_x, kern_mat_y] = derivative_kernal('Sobel');
figure(6)
subplot(2,2, 1)
imshow(img)
title('Orignal Image')
subplot(2,2, 2)
kern_mat_image1 = spatial_filter(img, kern_mat_x);
imshow(kern_mat_image1, [])
title('X Gradient Image')

subplot(2,2, 3)
kern_mat_image2 = spatial_filter(img, kern_mat_y);
imshow(kern_mat_image2, [])
title('Y Gradient Image')

subplot(2,2, 4)
kern_mat_image3 = sqrt(kern_mat_image1.^2 + kern_mat_image2.^2);
imshow(kern_mat_image3, [])
title('Gradient Magnitude Image')

%%

figure(7)
subplot(3,2, 1)
imshow(kern_mat_image3, [])
title('Edge Gradient Magnitude Image')

subplot(3,2, 2)
window_1_img = non_max_suppress(kern_mat_image3, 3, 3);
imshow(window_1_img, [])
title('NMS Image 3 x 3 Window')

subplot(3,2, 3)
window_2_img = non_max_suppress(kern_mat_image3, 3, 1);
imshow(window_2_img, [])
title('NMS Image 3 x 1 Window')

subplot(3,2, 4)
window_3_img = non_max_suppress(kern_mat_image3, 1, 3);
imshow(window_3_img, [])
title('NMS Image 1 x 3 Window')

subplot(3,2, 5)
window_4_img = non_max_suppress(window_1_img, 1, 3);
imshow(window_4_img, [])
title('NMS Image 3x1 then 1 x 3 Window')

%%
figure(8)
subplot(3,2, 1)
imshow(kern_mat_image3, [])
title('Edge Gradient Magnitude Image')

subplot(3,2, 2)
window_1_img = non_max_suppress(kern_mat_image3, 7, 7);
imshow(window_1_img, [])
title('NMS Image 7 x 7 Window')

subplot(3,2, 3)
window_2_img = non_max_suppress(kern_mat_image3, 7, 1);
imshow(window_2_img, [])
title('NMS Image 7 x 1 Window')

subplot(3,2, 4)
window_3_img = non_max_suppress(kern_mat_image3, 1, 7);
imshow(window_3_img, [])
title('NMS Image 1 x 7 Window')

subplot(3,2, 5)
window_4_img = non_max_suppress(window_2_img, 1, 7);
imshow(window_4_img, [])
title('NMS Image 7 x 1 then 1 x 7 Window')

%%
figure(9)
subplot(3,2, 1)
imshow(kern_mat_image3, [])
title('Edge Gradient Magnitude Image')

subplot(3,2, 2)
window_1_img = non_max_suppress(kern_mat_image3, 3, 7);
imshow(window_1_img, [])
title('NMS Image 3 x 7 Window')

subplot(3,2, 3)
window_2_img = non_max_suppress(kern_mat_image3, 3, 1);
imshow(window_2_img, [])
title('NMS Image 3 x 1 Window')

subplot(3,2, 4)
window_3_img = non_max_suppress(kern_mat_image3, 1, 7);
imshow(window_3_img, [])
title('NMS Image 1 x 7 Window')

subplot(3,2, 5)
window_4_img = non_max_suppress(window_2_img, 1, 7);
imshow(window_4_img, [])
title('NMS Image 3 x 1 then 1 x 7 Window')

%%
thresh_25 = image_threshold(window_2_img, 0.25);
figure(10)
imshow(thresh_25)
title('Image at Threshold 0.25')

thresh_50 = image_threshold(window_2_img, 0.5);
figure(11)
imshow(thresh_50)
title('Image at Threshold 0.5')

thresh_75 = image_threshold(window_2_img, 0.75);
figure(12)
imshow(thresh_75)
title('Image at Threshold 0.75')

%%
figure(11)
direct = pwd;
r = "healthy\healthy\01_h.jpg";
pather = strcat(direct, '\',r);
r2 = "healthy_manualsegm\01_h.tif";
pather2 = strcat(direct, '\',r2);
t = Tiff(pather2, 'r');
image_data = read(t);
img = imread(pather);
img = im2double(img);
subplot(2,4,1)
imshow(img)
title('Orignal Normal Retina')
img = rgb2gray(img);
subplot(2,4,2)
imshow(img)
title('Grayscale Normal Retina')
h = 1/331 .* [1 4 7 4 1; 4 20 33 20 4; 7 33 55 33 7; 4 20 33 20 4; 1 4 7 4 1];
smoothed = spatial_filter(img, h);
subplot(2,4,3)
imshow(smoothed, [])
title('Noise reduced Image')
[kern_mat_x, kern_mat_y] = derivative_kernal('Sobel');
kern_mat_image1 = spatial_filter(smoothed, kern_mat_x);
kern_mat_image2 = spatial_filter(smoothed, kern_mat_y);
subplot(2,4, 4)
kern_mat_image3 = sqrt(kern_mat_image1.^2 + kern_mat_image2.^2);
imshow(kern_mat_image3, [])
title('Gradient Magnitude Image')
window_2_img = non_max_suppress(kern_mat_image3, 3, 1);
subplot(2,4, 5)
imshow(window_2_img, [])
title('NMS Image 3 x 1 Window')

thresh_01 = image_threshold(window_2_img, 0.1);
subplot(2,4, 6)
imshow(thresh_01, [])
title('0.1 Threshold Image')

imageFilled = fillVeins(thresh_01);
subplot(2,4, 7)
imshow(imageFilled, [])
title('Filled in image')

subplot(2,4, 8)
imshow(image_data, [])
title('Manual  Segmented image')
%%
dsc = calculateDSC(uint8(imageFilled), image_data)
%%
figure(12)
direct = pwd;
r = "glaucoma\glaucoma\02_g.jpg";
pather = strcat(direct, '\',r);
r2 = "glaucoma_manualsegm\02_g.tif";
pather2 = strcat(direct, '\',r2);
t = Tiff(pather2, 'r');
image_data = read(t);
img = imread(pather);
img = im2double(img);
subplot(2,4,1)
imshow(img)
title('Orignal Glaucoma Retina')
img = rgb2gray(img);
subplot(2,4,2)
imshow(img)
title('Grayscale Glaucoma Retina')
h = 1/331 .* [1 4 7 4 1; 4 20 33 20 4; 7 33 55 33 7; 4 20 33 20 4; 1 4 7 4 1];
smoothed = spatial_filter(img, h);
subplot(2,4,3)
imshow(smoothed, [])
title('Noise reduced Image')
[kern_mat_x, kern_mat_y] = derivative_kernal('Sobel');
kern_mat_image1 = spatial_filter(smoothed, kern_mat_x);
kern_mat_image2 = spatial_filter(smoothed, kern_mat_y);
subplot(2,4, 4)
kern_mat_image3 = sqrt(kern_mat_image1.^2 + kern_mat_image2.^2);
imshow(kern_mat_image3, [])
title('Gradient Magnitude Image')
window_2_img = non_max_suppress(kern_mat_image3, 3, 1);
subplot(2,4, 5)
imshow(window_2_img, [])
title('NMS Image 3 x 1 Window')

thresh_01 = image_threshold(window_2_img, 0.1);
subplot(2,4, 6)
imshow(thresh_01, [])
title('0.1 Threshold Image')

imageFilled = fillVeins(thresh_01);
subplot(2,4, 7)
imshow(imageFilled, [])
title('Filled in image')

subplot(2,4, 8)
imshow(image_data, [])
title('Manual Segmented image')
%%
dsc = calculateDSC(imageFilled, image_data)
%%

figure(13)
direct = pwd;
r = "diabetic_retinopathy\01_dr.JPG";
pather = strcat(direct, '\',r);
r2 = "diabetic_retinopathy_manualsegm\01_dr.tif";
pather2 = strcat(direct, '\',r2);
t = Tiff(pather2, 'r');
image_data = read(t);
img = imread(pather);
img = im2double(img);
subplot(2,4,1)
imshow(img)
title('Orignal Diabetic Retina')
img = rgb2gray(img);
subplot(2,4,2)
imshow(img)
title('Grayscale Diabetic Retina')
h = 1/331 .* [1 4 7 4 1; 4 20 33 20 4; 7 33 55 33 7; 4 20 33 20 4; 1 4 7 4 1];
smoothed = spatial_filter(img, h);
subplot(2,4,3)
imshow(smoothed, [])
title('Noise reduced Image')
[kern_mat_x, kern_mat_y] = derivative_kernal('Sobel');
kern_mat_image1 = spatial_filter(smoothed, kern_mat_x);
kern_mat_image2 = spatial_filter(smoothed, kern_mat_y);
subplot(2,4, 4)
kern_mat_image3 = sqrt(kern_mat_image1.^2 + kern_mat_image2.^2);
imshow(kern_mat_image3, [])
title('Gradient Magnitude Image')
window_2_img = non_max_suppress(kern_mat_image3, 3, 1);
subplot(2,4, 5)
imshow(window_2_img, [])
title('NMS Image 3 x 1 Window')

thresh_01 = image_threshold(window_2_img, 0.1);
subplot(2,4, 6)
imshow(thresh_01, [])
title('0.1 Threshold Image')

imageFilled = fillVeins(thresh_01);
subplot(2,4, 7)
imshow(imageFilled, [])
title('Filled in image')

subplot(2,4, 8)
imshow(image_data, [])
title('Manual Segmented image')
%%
dsc = calculateDSC(imageFilled, image_data)