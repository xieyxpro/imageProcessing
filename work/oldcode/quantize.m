%return new image
%the first param is the old image, the second is the gray level
function [outputImg] = quantize(inputImg, level)
	m = size(inputImg, 1);%get the width and height of image
	n = size(inputImg, 2);
	%disp(level);
	fact = floor(255 / (level - 1));%to group the 256
	disp(fact);
	for i = 1:m;
		for j = 1:n;
			outputImg(i, j) = floor(inputImg(i, j) / 256 * level - 1) * fact;
		end
	end
end