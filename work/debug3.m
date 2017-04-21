I=double(imread('cat.bmp'))/255;
p=I;

ogf=guidedfilter(I,p,4,0.2^2);
fgf=faster_guided_filter(I,p,4,0.2^2,4);
% imwrite(ogf,'ogf_cat.bmp');
% imwrite(fgf,'fgf_cat.bmp');

% T=double(imread('tulips.bmp'))/255;
% p=T;
% q=zeros(size(T));
% q(:, :, 1)=guidedfilter(T(:,:,1),p(:,:,1),16,0.1^2);
% q(:, :, 2)=guidedfilter(T(:,:,2),p(:,:,2),16,0.1^2);
% q(:, :, 3)=guidedfilter(T(:,:,3),p(:,:,3),16,0.1^2);
% enhance=(T-q)*5+q;
% imwrite(q,'ogf_tulips.bmp');
% imwrite(enhance,'ogf_tulips_enhance.bmp');

% qpai=zeros(size(T));
% qpai(:, :, 1)=faster_guided_filter(T(:,:,1),p(:,:,1),16,0.1^2,4);
% qpai(:, :, 2)=faster_guided_filter(T(:,:,2),p(:,:,2),16,0.1^2,4);
% qpai(:, :, 3)=faster_guided_filter(T(:,:,3),p(:,:,3),16,0.1^2,4);
% fgf_enhance=(T-qpai)*5+qpai;
% imwrite(qpai,'fgf_tulips.bmp');
% imwrite(fgf_enhance,'fgf_tulips_enhance.bmp');