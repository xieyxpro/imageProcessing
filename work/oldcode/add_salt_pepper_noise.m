function [output] = add_salt_pepper_noise(input,saltrate,pepperrate)
    if saltrate < 0 || pepperrate < 0 || saltrate + pepperrate > 1
        return
    end
    
    disp(saltrate);
    disp(pepperrate);
    
    [h,w] = size(input);
    
    saltsize = h * w * saltrate;
    peppersize = h * w * pepperrate;
    
    disp(saltsize);
    disp(peppersize);
    
    randomplace = unidrnd(h*w,1,saltsize);
    output = input;
    for i=1:saltsize
        x = floor(randomplace(i)/w)+1;
        y = mod(randomplace(i),w);
        if y == 0
            y = w;
        end
        output(x,y) = 255;
    end
    
    randomplace = unidrnd(h*w,1,saltsize);
    for i=1:peppersize
        x = floor(randomplace(i)/w)+1;
        y = mod(randomplace(i),w);
        if y == 0
            y = w;
        end
        output(x,y) = 0;
    end
end