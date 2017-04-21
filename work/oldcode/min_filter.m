function [output] = min_filter(input,filtersize);
    [h,w] = size(input);
    %计算出这个filter中间位置的下标，以及待会要扩充原图四条边的大小
	center = floor(filtersize / 2) + 1;
    padsize = filtersize - center;
    disp(filtersize);
	disp(center);
    disp(padsize);
    
    %生成一个中间是原图，四周都是0的矩阵
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