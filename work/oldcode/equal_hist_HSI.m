function [ output_img ] = equal_hist_HSI( input_img )
%EQUAL_HIST_HSI 此处显示有关此函数的摘要

    input_img = double(input_img);     
    
    R = input_img(:,:,1);
    G = input_img(:,:,2);
    B = input_img(:,:,3);
    
    theta = acos(0.5*((R-G)+(R-B))./sqrt((R-G).*(R-G)+(R-G).*(G-B)));
    
    if (B <= G) 
        H = theta;
    else
        H = 2*pi - theta;
    end
    %H = H/(2*pi);
    
    S = 1 - 3.0.*min(min(R,G),B)./(R+G+B);
    I = (R+G+B)/3;

    equal_I = double(equalize_hist(uint8(I)));
    
    %RG Sector
    id = find((0 <= H) & (H < 2*pi/3));
    B(id) = equal_I(id).*(1-S(id));
    R(id) = equal_I(id).*(1+S(id).*cos(H(id))./cos(pi/3-H(id)));
    G(id) = 3*equal_I(id)-(R(id)+B(id));
    
    %GB Sector
    id = find((2*pi/3 <= H) & (H < 4*pi/3));
    R(id) = equal_I(id).*(1-S(id));
    G(id) = equal_I(id).*(1+S(id).*cos(H(id)-2*pi/3)./cos(pi-H(id)));
    B(id) = 3*equal_I(id)-(R(id)+G(id));
    
    %BR Sector
    id = find((4*pi/3 <= H) & (H < 2*pi));
    G(id) = equal_I(id).*(1-S(id));
    B(id) = equal_I(id).*(1+S(id).*cos(H(id)-4*pi/3)./cos(5*pi/3-H(id)));
    R(id) = 3*equal_I(id)-(G(id)+B(id));
    
    output_img = cat(3, R, G, B);
    
end

