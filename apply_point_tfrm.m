function out_img = apply_point_tfrm(in_img, C, B)
% INTENSITY SCALING AND SHIFTING
%   performs the operation: O(x,y) = C*I(x,y) + B
%   C - scaling value that can be any real number
%   B - any real number | 0 <= B <= 255
    % if ((B>=0) && (B<=255))
        out_img = C.*in_img + B;
    % else
    %     print("B is not valid");
    % end
end