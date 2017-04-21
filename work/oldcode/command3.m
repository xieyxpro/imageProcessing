A=imread('11.png');

filter_ave3 = ones(3,3);
I3=filter2d(A,filter_ave3);
imwrite(I3,'averaging3.png');

filter_ave7 = ones(7,7);
I7=filter2d(A,filter_ave7);
imwrite(I7,'averaging7.png');

filter_ave11 = ones(11,11);
I11=filter2d(A,filter_ave11);
imwrite(I11,'averaging11.png');

laplacian_filter = zeros(3,3) - ones(3,3);
laplacian_filter(2,2)=9;
Isharpen=filter2d(A,laplacian_filter);
imwrite(Isharpen,'sharpen.png');

Blur=ones(3,3);
Blured=filter2d(A,Blur);
Mask=A-Blured;
k=5;
G=A+k*Mask;
imwrite(G,'highboost.png');