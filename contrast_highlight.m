function out_image = contrast_highlight(image, A_lower, B_higher, Imin)
%safety check to make sure A is lower than B
if A_lower > B_higher
    fprintf('A or %d is not lower than B or %d', A_lower, B_higher)
    fprintf('Swapping A and B')
    C = A_lower;
    A_lower = B_higher;
    B_higher = C;
end
image(img < A_lower) = Imin;
image(img > B_higher) = Imin;
out_image = image;
end