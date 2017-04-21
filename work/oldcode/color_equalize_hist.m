function [output] = color_equalize_hist(input)
    R=input(:,:,1);
    G=input(:,:,2);
    B=input(:,:,3);
    er=equalize_hist(R);
    eg=equalize_hist(G);
    eb=equalize_hist(B);
    
    output(:,:,1)=er;
    output(:,:,2)=eg;
    output(:,:,3)=eb;
end