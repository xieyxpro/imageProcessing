function [output]=mean_equalize_hist(input)
    R=input(:,:,1);
    G=input(:,:,2);
    B=input(:,:,3);
    
    rh=hist(reshape(R,1,384*256),reshape(0:255,1,256));
    gh=hist(reshape(G,1,384*256),reshape(0:255,1,256));
    bh=hist(reshape(B,1,384*256),reshape(0:255,1,256));
    disp(size(rh));
    ah=(rh+gh+bh)/3;
    disp(size(ah));
    
    ccumulate = zeros(1, 256);
    for i=1:256
       if (i == 1)
           ccumulate(i) = ah(i);
       else
           ccumulate(i) = ccumulate(i - 1) + ah(i);
       end
    end
    
    hash=uint8(255.*(ccumulate/384/256)+0.5);
    
    for i = 1:256
      for j = 1:384
         er(i,j) = hash(R(i,j) + 1);
         eg(i,j) = hash(G(i,j) + 1);
         eb(i,j) = hash(B(i,j) + 1);
      end
    end
    
    output(:,:,1)=er;
    output(:,:,2)=eg;
    output(:,:,3)=eb;
end