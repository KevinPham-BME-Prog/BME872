function out = spatialFilter(img, h)


% Pad image with zeros from centre pixel of 

dime = size(h);
dim_img = size(img);
%dimensions(1) = rows
%dimensions(2) = columns
        paddingheight = floor(dime(1)/2);
        paddingwid = floor(dime(2)/2);  
 

%if dimensions are even
imgZeros = zeros(dim_img(1) + 2*paddingheight, dim_img(2) + 2*paddingwid);
imgZeros((1+ paddingheight): (dim_img(1)+paddingheight), (1 + paddingwid):(dim_img(2) + paddingwid)) = img;
imgPad = imgZeros;
imgP2 = imgPad;


sizeImg = size(imgPad);
for j = (1+paddingheight):(sizeImg(1)-paddingheight)
    for k = (1 + paddingwid):(sizeImg(2) - paddingwid)
        if j >= 25 && k <= 2
            10;
        end
        imgPaddedSection = imgPad((j-paddingheight):(j+paddingheight), (k-paddingwid):(k+paddingwid));
        imgP2(j, k) = sum(sum(imgPaddedSection .* h));
    end
end

out = imgP2((1+paddingheight):(sizeImg(1)-paddingheight),(1 + paddingwid):(sizeImg(2) - paddingwid));



end