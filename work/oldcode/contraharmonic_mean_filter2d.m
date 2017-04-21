function [outputImg] = contraharmonic_mean_filter2d(inputImg, filtersize,q)
	[h,w] = size(inputImg);
    
    %计算出这个filter中间位置的下标，以及待会要扩充原图四条边的大小
	center = floor(filtersize / 2) + 1;
    padsize = filtersize - center;
    disp(filtersize);
	disp(center);
    disp(padsize);
    disp(q);
    
    %生成一个中间是原图，四周都是0的矩阵
    mt = zeros(h+2*padsize,w+2*padsize);
    mt(1+padsize:h+padsize,1+padsize:w+padsize)=inputImg;
	
    %先取出待乘矩阵，乘以给定的filter，最后求和并除以total，得到新图中对应像素点的值
    for i = 1+padsize:h+padsize;
		for j = 1+padsize:w+padsize
%             c = mt(i-padsize:i+padsize,j-padsize:j+padsize).*givenFilter;
%             s = sum(sum(c));
%             outputImg(i-padsize,j-padsize) = s*1.0/total;
              fenzi = 0.0;
              fenmu = 0.0;
              for k = i-padsize:i+padsize
                  for t = j-padsize:j+padsize
                      fenzi = fenzi + power(mt(k,t),q+1);
                      fenmu = fenmu + power(mt(k,t),q);
                  end
              end
              if fenmu == 0 outputImg(i-padsize,j-padsize)=0;
              else outputImg(i-padsize,j-padsize)=fenzi/fenmu;
              end
        end
    end
    %将其scale处理，对应到0~255
    outputImg = uint8(outputImg);
end