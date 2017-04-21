A=imread('task_1.png');
f1=ones(3,3);
imwrite(filter2d(A,f1),'tk11.png');

f2=ones(9,9);
imwrite(filter2d(A,f2),'tk12.png');

imwrite(harmonic_mean_filter2d(A,3),'tk13.png');
imwrite(harmonic_mean_filter2d(A,9),'tk14.png');

imwrite(contraharmonic_mean_filter2d(A,3,1.5),'tk15.png');
imwrite(contraharmonic_mean_filter2d(A,9,1.5),'tk16.png');

B=imread('task_2.png');
B=rgb2gray(B);
I=add_gaussian_noise(B,0,40);
imwrite(I,'gaussian_noise.png');

f3=ones(3,3);
imwrite(filter2d(I,f3),'gaussian_noise_arithmetic.png');
imwrite(geometric_mean_filter(I,3),'gaussian_noise_geometic.png');
imwrite(median_filter(I,3),'gaussian_noise_median.png');

T=add_salt_pepper_noise(B,0.2,0);
imwrite(T,'salt0.2_noise.png');

imwrite(min_filter(T,3),'min_filter.png');
imwrite(harmonic_mean_filter2d(T,3),'salt_noise_harmonic.png');
imwrite(contraharmonic_mean_filter2d(T,3,1.5),'contraharmonic1.5.png');
imwrite(contraharmonic_mean_filter2d(T,3,-1.5),'contraharmonic-1.5.png');

W=add_salt_pepper_noise(B,0.2,0.2);
imwrite(W,'salt_pepper_noise.png');

f4 = ones(3,3);
imwrite(filter2d(W,f4),'salt_pepper_noise_arithmetic.png');
imwrite(geometric_mean_filter(W,3),'salt_pepper_noise_geometic.png');
imwrite(harmonic_mean_filter2d(W,3),'salt_pepper_noise_harmonic.png');
imwrite(median_filter(W,3),'salt_pepper_noise_median.png');

Q=imread('11.png');
imwrite(color_equalize_hist(Q),'color_equalize_hist.png');
imwrite(mean_equalize_hist(Q),'mean_equalize_hist.png');
D=uint8(real(i_equalize_hist(Q)));
imwrite(D,'i_equalize_hist.png');