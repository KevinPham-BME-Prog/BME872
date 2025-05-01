function imageFilled = fillVeins(inImg)

    SE = strel('square', 4);
    imgClose = imclose(inImg, SE);
    SE2 = strel('square', 8);
    imgClose2 = imclose(imgClose,SE2);
    imgClose3 = imclose(imgClose2, SE2);
    SE3 = strel('square', 8);
    imgClose3 = imclose(imgClose3, SE3);
    imgClose4 = imclose(imgClose3, SE3);
    imgClose5 = imclose(imgClose4, SE3);

  for i = 1:10
         imgClose5 = imclose(imgClose5, SE3);

  end

    imageFilled = imgClose5;
end