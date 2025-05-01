direct = pwd;
%r = 'Mammo1\mdb103.pgm';
%r = 'Mammo1\mdb154.pgm';
r = 'Mammo1\mdb229.pgm';
pather = strcat(direct, '\',r);

[mammo, ~] = imageRead(pather, 'pgm', 'single');

%% 1 a) 
figure(1);
subplot(121);
imshow(mammo, [0 255]);
title('Mammogram 229'); 
subplot(122);
intensityHistogram(mammo, '2d8bit', true, false);
%% 1 b) 
figure(2)
subplot(221);
imshow(mammo, [0 255]);
title('Mammogram 103'); 
subplot(222);
intensityHistogram(mammo, '2d8bit', true, false);

[stretchedimg, rmin, rmax] = contrast_stretch(mammo);
subplot(223)
imshow(stretchedimg, []); title('Contrast Stretched Mammogram 103'); 
subplot(224)
intensityHistogram(stretchedimg, '2d8bit', true, false);
%% transform 
figure(3)
r = 0:255; 
t_r = 255*((r-rmin)/(rmax-rmin));
plot(t_r); 
title('Contrast Stretching Transform T(r) 154'); axis('tight'); 
ylabel('Output Intensities, s'); xlabel('Input Intensities, r');

%% 2 piecewise 
a = [80, 0];
b = [200, 230];
[pieimg, slopes] = contrast_pieceswise(mammo, a, b); 

figure(2)
subplot(223)
imshow(pieimg, []); title('Piecewise Contrast Stretched Mammogram 103'); 
subplot(224)
intensityHistogram(pieimg, '2d8bit', true, false);

%% transform piecewise
figure(3)
t_h = zeros(1, 256);
for r = 1:a(1)
    t_h(r) = slopes(1)*r;
end
for r = a(1):b(1)
    t_h(r) = slopes(2)*(r-a(1)) + a(2);
end
for r = b(1):256
    t_h(r) = slopes(3)*(r-b(1))+ b(2) ;
end
plot(t_h); 
title('Piecewise Contrast Transform 103'); axis([0 255 0 255]); 
ylabel('Output Intensities, s'); xlabel('Input Intensities, r');


%% 3 highlight 
lower = 100; 
upper = 220; 
Imin = 100; 

highimg = contrast_highlight(mammo, lower, upper, Imin);
figure(2); 

subplot(223)
imshow(highimg, []); title('Contrast Highlighted Mammogram 103'); 
subplot(224)
intensityHistogram(highimg, '2d8bit', true, false);
%% highlight t
figure(3); 
t_h = zeros(1, 256);
for r = 1:lower
    t_h(r) = Imin;
end
for r = lower:upper
    t_h(r) = r;
end
for r = upper:256
    t_h(r) = Imin;
end
plot(t_h); 
title('Contrast Highlight Transform'); axis([0 255 0 255]); 
ylabel('Output Intensities, s'); xlabel('Input Intensities, r');

%% 4 LUT
lut1 = stretch_lut(mammo);
lutim = contrast_trfm_curve(mammo, lut1);
figure(2); 
subplot(221)
imshow(mammo, []); title('Mammogram 229'); 
subplot(222)
intensityHistogram(mammo, '2d8bit', true, false);
subplot(223)
imshow(lutim, []); title('Contrast Stretched by LUT Mammogram 229'); 
subplot(224)
intensityHistogram(lutim, '2d8bit', true, false);

%% 5 hist equalization

[out_img, cdf] = histogram_equalization(mammo);
subplot(221)
imshow(mammo, []); title('Mammogram 103'); 

subplot(222)
intensityHistogram(mammo, '2d8bit', true, false);


subplot(223)
imshow(out_img, []); title('Histogram Equalized Mammogram 229'); 
subplot(224)
intensityHistogram(out_img, '2d8bit', true, false);
figure(6)
plot((255* cdf))
ylabel('Output Intensities, s'); xlabel('Input Intensities, r');
