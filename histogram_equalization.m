function [out_img, CDF_r] = histogram_equalization(img)
   dimensions = size(img);
   intensities = zeros(1, 256);
   for x = 1:dimensions(2)
       for y = 1:dimensions(1)
           r = double(img(x, y));
           intensities(r+1)= intensities(r+1)+1;
       end
   end
   PDF_r = intensities/(dimensions(1)*dimensions(2));
   CDF_r = zeros(1, 256);
   cdf = 0;
   for r_j = 1:256
       cdf = cdf + PDF_r(r_j);
       CDF_r(r_j) = cdf;
   end
   for x = 1:dimensions(2)
       for y = 1:dimensions(1)
           out_img(x, y) = CDF_r(img(x, y)+1);
       end
   end
   out_img = uint8(255*out_img);
end
