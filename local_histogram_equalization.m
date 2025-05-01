function out_img = local_histogram_equalization(img)
dim_ori = size(img);
intensity = zeros(1, 256);
out_img = img;
img = padarray(img , [4 4] , 0, 'both'); %add zero padding to the img
img = double(img);
for x = 5:dim_ori(1) - 5 %only focusing on orignal image sections
    for y = 5:dimensions(1) - 5
        for i = x-4:x+4 %makes a small patch for local equilization
            for j = y - 4: y +4
                intensity(r+1) = intensity(r +1) + 1;
            end
        end
        curr_PDF = intensity/(dim_ori(1) * dim_ori(2));

        CDF = zeros(1,256);
        curr_CDF = 0;
        for i = 1:256
            cdf = cdf + curr_PDF(i);
            CDF(i) = curr_CDF;
        end

        for h = x - 4: x+4
            for e = y - 4: y +4
                out_img(h , e) = CDF(img(h, e) +1);
            end
        end
    end
end
end