
source = imread('11.png');
dest = equal_hist_HSI(source);
dest = uint8(real(dest));
imshow(dest);
imwrite(dest, 'aaaaa.png');