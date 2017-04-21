function [output]= i_equalize_hist(input)
    input = double(input);
    
    R=input(:,:,1);
    G=input(:,:,2);
    B=input(:,:,3);
    
%     disp(R(1:3,1:3));
%     disp(G(1:3,1:3));
%     disp(B(1:3,1:3));
    
    theta = acos(0.5*((R-G)+(R-B))./sqrt((R-G).*(R-G)+(R-G).*(G-B)));
    
%     disp(num(1:3,1:3));
%     disp(den(1:3,1:3));
%     disp(theta(1:3,1:3));
    
    if (B <= G) 
        H = theta;
    else
        H = 2*pi - theta;
    end
    
    S = 1 - 3.0.*min(min(R,G),B)./(R+G+B);
    
    I=uint8((R+G+B)/3);
    equal_I=double(equalize_hist(I));
    
    disp(H(1:3,1:3));
    disp(S(1:3,1:3)); 
    disp(I(1:3,1:3));
    
%     HSI=cat(3,H,S,I);
    
%     HSI=double(HSI);
%     H = HSI(:,:,1);
%     S = HSI(:,:,2);
%     I = HSI(:,:,3);
%     
%     disp(H(1:3,1:3));
%     disp(S(1:3,1:3)); 
%     disp(I(1:3,1:3));
    
    nr=zeros(size(input,1),size(input,2));
    ng=zeros(size(input,1),size(input,2));
    nb=zeros(size(input,1),size(input,2));
    
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
    
    output = cat(3, R, G, B);
    
%     id=find( H<2*pi/3 );
%     disp(size(id));
%     nb(id)=I(id) .* (1-S(id));
%     nr(id)=I(id) .* (1+S(id) .* cos(H(id)) ./ cos(pi/3-H(id)));
%     ng(id)=3*I(id)-(nr(id)+nb(id));
%     
%     id=find( (2*pi/3<=H) & (H<4*pi/3) );
%     disp(size(id));
%     nr(id)=I(id).*(1-S(id));
%     ng(id)=I(id).*(1+S(id).*cos(H(id)-2*pi/3)./cos(pi-H(id)));
%     nb(id)=3*I(id)-(R(id)+G(id));
%     
%     id=find( (4*pi/3<=H) & (H<=2*pi) );
%     disp(size(id));
%     ng(id)=I(id).*(1-S(id));
%     nb(id)=I(id).*(1+S(id).*cos(H(id)-4*pi/3)./cos(5*pi/3-H(id)));
%     nr(id)=3*I(id)-(ng(id)+nb(id));
   
%     output=max(min(output,1),0);
%     disp(output(1:6,1:6,1));
%     disp(output(1:6,1:6,2));
%     disp(output(1:6,1:6,3));


% hsi=rgb2hsi(input);
% H = hsi(:,:,1);
% S = hsi(:,:,2);
% I = hsi(:,:,3)
% I=equalize_hist(uint8(I));
% K=cat(3,H,S,I);
% output=hsi2rgb(K);
end