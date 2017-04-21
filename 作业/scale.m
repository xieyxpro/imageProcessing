%return the new photo
%the first param is the old photo, the rest are width and height
function [outputImg]= scale(inputImg, a, b)
	m = size(inputImg, 1);%get the height of old photo
	n = size(inputImg, 2);%get the width of old photo
	for i = 1:b
	    for j = 1:a
	        x = (i+0.5)*m/b-0.5;%get the coordinate of the correspond point
	        y = (j+0.5)*n/a-0.5;
	        
	        if floor(x) < 1     %check the coordinate is legal
	            x0 = 1;
	        else
	            x0 = floor(x);
	        end
	        
	        if (x0 + 1) > m
	            x0 = m-1;
	        end
	        
	        if floor(y) < 1
	            y0 = 1;
	        else
	            y0 = floor(y);
	        end
	        if (y0 + 1) > n
	            y0 = n-1;
	        end
	       
	        
	        u = x-x0;
	        v = y-y0;
	        outputImg(i,j)=(1-u)*(1-v)*inputImg(x0,y0) + (1-u)*v*inputImg(x0,y0+1) + u*(1-v)*inputImg(x0+1,y0) + u*v*inputImg(x0+1,y0+1);
	    end
	end
end

