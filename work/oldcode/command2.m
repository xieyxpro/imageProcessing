B=imread('picture.png');

T=equalize_hist(B);

if (T == B)
    disp('equal!');
else
    disp('not equal!');
end