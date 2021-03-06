function [output_img] = fft2d(input_img,flag)
    if flag == 1
        %we have known the size of input img is 384*256
        padImg = zeros(256,512);
        padImg(1:256,1:384) = input_img;

        output_img = zeros(256,512);

        for y = 1:256
            for x = 1:512
                temp1(x) = padImg(y,x);
            end

            deal = fft1d(temp1,flag);
            for x = 1:512
                output_img(y,x) = deal(x);
            end
        end

        for x = 1:512
            for y = 1:256
                temp2(y) = output_img(y,x);
            end

            deal = fft1d(temp2,flag);
            for y = 1:256
                output_img(y,x) = deal(y);
            end
        end
        output_img = output_img / 256 / 512;
    else 
        output_img = zeros(256,512);
        for y = 1:256
            for x = 1:512
                temp1(x) = input_img(y,x);
            end

            deal = ifft1d(temp1,flag);
            for x = 1:512
                output_img(y,x) = deal(x);
            end
        end
        
        for x = 1:512
            for y = 1:256
                temp2(y) = output_img(y,x);
            end

            deal = ifft1d(temp2,flag);
            for y = 1:256
                output_img(y,x) = deal(y);
            end
        end
        
        output_img = output_img(1:256,1:384);
        output_img = real(output_img);
    end
end

function [outputArr] = fft1d(oneDimArr,flag)
    [N,M] = size(oneDimArr);
    %disp(size(oneDimArr));
    if M == 1 && N == 1
        outputArr = oneDimArr;
    else
        outputArr = zeros(1,M);
        mid = M/2;
        xeven = zeros(1,mid);
        xodd = zeros(1,mid);
        for t = 1:mid
            xeven(t) = oneDimArr(2*t-1);
        end
        %disp(xeven);
        q = fft1d(xeven,flag);
        
        for t = 1:mid
            xodd(t) = oneDimArr(2*t);
        end
        r = fft1d(xodd,flag);
        
            for t = 1:mid
                factor = exp((-i)*2*pi*(t-1)/M);
                outputArr(t) = q(t)+factor*r(t);
                outputArr(t+mid) = q(t)-factor*r(t);
            end
    end
end

function [outputArr] = ifft1d(oneDimArr,flag)
    [N,M] = size(oneDimArr);
    %disp(size(oneDimArr));
    for w = 1:M
        temp3(w) = conj(oneDimArr(w));
    end
    temp3 = fft1d(temp3,1);
    
    for w = 1:M
        outputArr(w) = conj(temp3(w));
    end
end