function out_img = contrast_pieceswise(in_img, a,b)
%slope 1 
%notes s is output intensity, r is input intensity from 0 to a(1) = r
a = double(a);
b = double(b);
slope1 = a(2)/a(1);
%slope 2 from input r a(1) -> b(1) wiht output s a(2) -> b(2)
slope2 = (b(2) - a(2)) / ( b(1) - a(1));
%slope 3 from b(1) -> 255 and b(2) -> 255
slope3 = double((255 - b(2)) / (255 - b(1)));
transform = zeros(1,256);
for r = 1:255
    if r <= a(1)
        transform(r) = slope1*r;
    elseif r <= b(1)
        transform(r) = slope2 * (r -a(1)) + a(2);
    elseif r <= 255
        transform(r) = slope3 * (r- b(1)) + b(2);
    end 
end

contrast_tf = uint8(transform);
dim_img = size(in_img);
for x = 1:dim_img(1)
    for y = 1:dim_img(2)
        if in_img (x,y) < 1
            in_img(x,y) = 1;
        else
            transform(x,y) = contrast_tf(in_img(x,y));
        end
    end
end
out_img = uint8(transform);
end
