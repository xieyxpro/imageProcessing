function [output] = add_gaussian_noise(input,mean,standard)
    [h,w] = size(input);
    %disp(size(input));
    disp(h);
    disp(w);
    noise = gaussian_noise_generator(mean,standard,h,w);
    for i=1:h
        for j=1:w
            output(i,j)=noise(i,j)+input(i,j);
        end
    end
    disp(size(output));
    output = uint8(output);
end