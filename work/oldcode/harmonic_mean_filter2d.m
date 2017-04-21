function [outputImg] = harmonic_mean_filter2d(inputImg, filtersize)
	[h,w] = size(inputImg);
    
    %计算出这个filter中间位置的下标，以及待会要扩充原图四条边的大小
	center = floor(filtersize / 2) + 1;
    padsize = filtersize - center;
    disp(filtersize);
	disp(center);
    disp(padsize);
    
    %生成一个中间是原图，四周都是0的矩阵
    mt = zeros(h+2*padsize,w+2*padsize);
    mt(1+padsize:h+padsize,1+padsize:w+padsize)=inputImg;
	
    %先取出待乘矩阵，乘以给定的filter，最后求和并除以total，得到新图中对应像素点的值
    for i = 1+padsize:h+padsize;
		for j = 1+padsize:w+padsize
%             c = mt(i-padsize:i+padsize,j-padsize:j+padsize).*givenFilter;
%             s = sum(sum(c));
%             outputImg(i-padsize,j-padsize) = s*1.0/total;
              total = 0.0;
              for k = i-padsize:i+padsize
                  for t = j-padsize:j+padsize
                      if mt(k,t) == 0 total = total + 255;
                      else total = total + (1 / mt(k,t));
                      end
                  end
              end
              outputImg(i-padsize,j-padsize)=filtersize*filtersize/total;
        end
    end
    %将其scale处理，对应到0~255
    outputImg = uint8(outputImg);
end