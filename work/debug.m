I=double(imread('beauty_with_freckle.bmp'))/255;
p=I;
q1=guidedfilter(I,p,2,0.1^2);
q2=guidedfilter(I,p,2,0.2^2);
q3=guidedfilter(I,p,2,0.4^2);

q4=guidedfilter(I,p,4,0.1^2);
q5=guidedfilter(I,p,4,0.2^2);
q6=guidedfilter(I,p,4,0.4^2);

q7=guidedfilter(I,p,8,0.1^2);
q8=guidedfilter(I,p,8,0.2^2);
q9=guidedfilter(I,p,8,0.4^2);

imshow(I);
figure();
imshow([q1,q2,q3]);
figure();
imshow([q4 q5 q6]);
figure();
imshow([q7,q8,q9]);

imwrite(q1,'beauty1.bmp');
imwrite(q2,'beauty2.bmp');
imwrite(q3,'beauty3.bmp');
imwrite(q4,'beauty4.bmp');
imwrite(q5,'beauty5.bmp');
imwrite(q6,'beauty6.bmp');
imwrite(q7,'beauty7.bmp');
imwrite(q8,'beauty8.bmp');
imwrite(q9,'beauty9.bmp');