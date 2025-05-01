function out = non_max_suppress(img, H, W)
dim = size(img);
%need to have a few if statements
%check 1 when reading matrix is not close to end
%check 2 if vcounter + H is greater than dimension of image
%check 3 if counter + w is greater thanm dimension of image
%in theory check 2 and 3 should be able to cover the bottom right  
out = zeros(dim(1), dim(2));
for counter_A = 1:H:dim(1)
    for counter_B = 1:W:dim(2)
        ender_A = counter_A + H;
        ender_B = counter_B + W;
        if (ender_A) > dim(1)
            ender_A = dim(1);
        end
        if (ender_B) > dim(2)
            ender_B = dim(2);
        end
        temp_mat = img([counter_A ender_A], [counter_B ender_B]);
        temp_mat(temp_mat < max(temp_mat)) = 0;
        out([counter_A ender_A], [counter_B ender_B]) = temp_mat;
    end
end

