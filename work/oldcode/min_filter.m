function [output] = min_filter(input,filtersize);
    [h,w] = size(input);
    %��������filter�м�λ�õ��±꣬�Լ�����Ҫ����ԭͼ�����ߵĴ�С
	center = floor(filtersize / 2) + 1;
    padsize = filtersize - center;
    disp(filtersize);
	disp(center);
    disp(padsize);
    
    %����һ���м���ԭͼ�����ܶ���0�ľ���
    mt = zeros(h+2*padsize,w+2*padsize);
    mt(1+padsize:h+padsize,1+padsize:w+padsize)=input;
    
     for i = 1+padsize:h+padsize;
		for j = 1+padsize:w+padsize
            o = mt(i-padsize:i+padsize,j-padsize:j+padsize);
            output(i-padsize,j-padsize)=min(min(o));
        end
     end
    output = uint8(output);
end