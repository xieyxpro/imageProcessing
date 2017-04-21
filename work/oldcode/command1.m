A=imread('11.png');
figure;
imhist(A);

I=equalize_hist(A);
%imshow(I);
figure;
imhist(I);
imwrite(I,'picture.png');