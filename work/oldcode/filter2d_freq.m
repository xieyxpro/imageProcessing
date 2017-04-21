function [output_img] = filter2d_freq(input_img,filter)
    dft=dft2d(input_img,1);
    newfilter=zeros(256,384);
    [N,M] = size(filter);
    disp(size(filter));
    newfilter(1:M,1:M)=filter;
    dftfilter=dft2d(newfilter,1);
    
    for x=1:384
        for y=1:256
            output_img(y,x)=dftfilter(y,x)*dft(y,x);
        end
    end
    
    output_img = dft2d(output_img,0);
end