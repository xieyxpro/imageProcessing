function [output_img] = dft2d(input_img, flags)
	[N, M] = size(input_img);  

	output_img = zeros(N,M);
%     disp(N);
%     disp(M);
	if flags == 1
          f = input_img;
    
        Fxv = zeros(N,M);
		for u = 1:M
			for v = 1:N
                for y = 1:N
                    Fxv(v,u) = Fxv(v,u) + f(y,u)*exp((-i)*2*pi*(v-1)*(y-1)/N);
                end
			end
        end
        
        for u = 1:M
			for v = 1:N
                for x = 1:M
                    output_img(v,u) = output_img(v,u) + Fxv(v,x)*exp((-i)*2*pi*(u-1)*(x-1)/M);
                end
                output_img(v,u) = output_img(v,u) / M / N;
            end
        end
    else
        
        F = input_img;
        
        Fuy = zeros(N,M);
        for x = 1:M
            for y = 1:N
                for v = 1:N
                    Fuy(y,x) = Fuy(y,x) + F(v,x)*exp(i*2*pi*(v-1)*(y-1)/N);
                end
            end
        end
        
        for x = 1:M
            for y = 1:N
                for u = 1:M
                    output_img(y,x) = output_img(y,x) + Fuy(y,u)*exp(i*2*pi*(x-1)*(u-1)/M);
                end
                output_img(y,x) = real(output_img(y,x));
            end
        end

    end
end
