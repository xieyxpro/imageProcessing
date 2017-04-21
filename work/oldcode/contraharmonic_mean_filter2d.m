function [outputImg] = contraharmonic_mean_filter2d(inputImg, filtersize,q)
	[h,w] = size(inputImg);
    
    %��������filter�м�λ�õ��±꣬�Լ�����Ҫ����ԭͼ�����ߵĴ�С
	center = floor(filtersize / 2) + 1;
    padsize = filtersize - center;
    disp(filtersize);
	disp(center);
    disp(padsize);
    disp(q);
    
    %����һ���м���ԭͼ�����ܶ���0�ľ���
    mt = zeros(h+2*padsize,w+2*padsize);
    mt(1+padsize:h+padsize,1+padsize:w+padsize)=inputImg;
	
    %��ȡ�����˾��󣬳��Ը�����filter�������Ͳ�����total���õ���ͼ�ж�Ӧ���ص��ֵ
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
    %����scale������Ӧ��0~255
    outputImg = uint8(outputImg);
end