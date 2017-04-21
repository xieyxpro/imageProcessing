function [outputImg] = harmonic_mean_filter2d(inputImg, filtersize)
	[h,w] = size(inputImg);
    
    %��������filter�м�λ�õ��±꣬�Լ�����Ҫ����ԭͼ�����ߵĴ�С
	center = floor(filtersize / 2) + 1;
    padsize = filtersize - center;
    disp(filtersize);
	disp(center);
    disp(padsize);
    
    %����һ���м���ԭͼ�����ܶ���0�ľ���
    mt = zeros(h+2*padsize,w+2*padsize);
    mt(1+padsize:h+padsize,1+padsize:w+padsize)=inputImg;
	
    %��ȡ�����˾��󣬳��Ը�����filter�������Ͳ�����total���õ���ͼ�ж�Ӧ���ص��ֵ
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
    %����scale������Ӧ��0~255
    outputImg = uint8(outputImg);
end