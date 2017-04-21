function [output] = geometric_mean_filter(input,filtersize)
    [h,w] = size(input);
    center = floor(filtersize / 2) + 1;
    padsize = filtersize - center;
    mt = zeros(h+2*padsize,w+2*padsize);
    mt(1+padsize:h+padsize,1+padsize:w+padsize)=input;
    
    for i = 1+padsize:h+padsize;
		for j = 1+padsize:w+padsize
            total = 1;
              for k = i-padsize:i+padsize
                  for t = j-padsize:j+padsize
                    total = total * mt(k,t);
                  end
              end
              output(i-padsize,j-padsize)=total^(1/filtersize/filtersize);
        end
    end
    output=uint8(output);
end