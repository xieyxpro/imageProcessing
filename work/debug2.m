I=double(imread('starynight.bmp'))/255;
p=I;

q=zeros(size(I));
q(:, :, 1)=guidedfilter(I(:,:,1),p(:,:,1),16,0.1^2);
q(:, :, 2)=guidedfilter(I(:,:,2),p(:,:,2),16,0.1^2);
q(:, :, 3)=guidedfilter(I(:,:,3),p(:,:,3),16,0.1^2);

enhance=(I-q)*5+q;

% imshow(I);
% figure();
% imshow(q);
% figure();
% imshow(enhance);

imwrite(q,'starynight_q.bmp');
imwrite(enhance,'starynight_enhance.bmp');