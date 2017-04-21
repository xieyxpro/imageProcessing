function output = myupsample(input,s)
    [m,n]=size(input);
    a = m*s;
    b = n*s;
    
    for i = 1:a
	    for j = 1:b
	        x = (i+0.5)*m/a-0.5;%get the coordinate of the correspond point
	        y = (j+0.5)*n/b-0.5;
	        
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
            
            output(i,j)=(1-u)*(1-v)*input(x0,y0)+(1-u)*v*input(x0,y0+1)+u*(1-v)*input(x0+1,y0)+u*v*input(x0+1,y0+1);
        end
    end
end