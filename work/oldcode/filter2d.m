function [outputImg] = filter2d(inputImg, givenFilter)
	[h,w] = size(inputImg);
	[m,n] = size(givenFilter);
    
    %���filter�е�������֮��
	total = 0;
	for i = 1:m;
		for j = 1:n
			total = total + givenFilter(i,j);
        end
    end
    
    %��������filter�м�λ�õ��±꣬�Լ�����Ҫ����ԭͼ�����ߵĴ�С
	center = floor(m / 2) + 1;
    padsize = m - center;
    disp(m);
	disp(center);
    disp(padsize);
    disp(total);
    
    %����һ���м���ԭͼ�����ܶ���0�ľ���
    mt = zeros(h+2*padsize,w+2*padsize);
    mt(1+padsize:h+padsize,1+padsize:w+padsize)=inputImg;
	
    %��ȡ�����˾��󣬳��Ը�����filter�������Ͳ�����total���õ���ͼ�ж�Ӧ���ص��ֵ
    for i = 1+padsize:h+padsize;
		for j = 1+padsize:w+padsize
            c = mt(i-padsize:i+padsize,j-padsize:j+padsize).*givenFilter;
            s = sum(sum(c));
            outputImg(i-padsize,j-padsize) = s*1.0/total;
        end
    end
    %����scale��������Ӧ��0~255
    outputImg = uint8(outputImg);
end