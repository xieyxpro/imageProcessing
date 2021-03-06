% task2.1
I=imread('11.png');

[N,M] = size(I);

I = im2double(I)*255;
for x = 1:M
   for y = 1:N
       I(y,x) = I(y,x) * ((-1).^(x+y));
   end
end
dft=abs(dft2d(I,1));
imwrite(dft * 2.04,'dft2d.png');

% task2.2
T = imread('11.png');
T = im2double(T);
idft=dft2d(dft2d(T,1),0);
imwrite(idft,'idft2d.png');

% task3.1
K = imread('11.png');
K = im2double(K)*255;
for x = 1:384
   for y = 1:256
      K(y,x) = K(y,x) * ((-1).^(x+y));
   end
end
fft=abs(fft2d(K,1));
imwrite(fft * 2.04,'fft2d.png');

% task3.2
E = imread('11.png');
E = im2double(E);
ifft=fft2d(fft2d(E,1),0);
imwrite(ifft,'ifft2d.png');

% task4.1
Q = imread('11.png');
Q = im2double(Q)*255;
af = ones(7,7)/49;
averag = filter2d_freq(Q,af)*255;
imwrite(averag,'averag.png');

lf = ones(3,3);
lf(2,2)=-8;
lfout=filter2d_freq(Q,lf)*255;
imwrite(lfout,'lfout.png');