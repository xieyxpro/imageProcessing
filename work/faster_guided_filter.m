function q = faster_guided_filter(I,p,r,e,s)
    Ipai=subsample(I,s);
    ppai=subsample(p,s);
    rpai=r/s;
    
    [height,width]=size(Ipai);

	N=squarefilter(ones(height,width),rpai);

	meanI=squarefilter(Ipai,rpai)./N;
	meanp=squarefilter(ppai,rpai)./N;
	meanIP=squarefilter(Ipai.*ppai,rpai)./N;
	meanII=squarefilter(Ipai.*Ipai,rpai)./N;
    
    covIP=meanIP-meanI.*meanp;
	varI=meanII-meanI.*meanI;
    
    a=covIP./(varI+e);
	b=meanp-a.*meanI;
    
    meana=squarefilter(a,rpai)./N;
	meanb=squarefilter(b,rpai)./N;
    
    meana_pai=myupsample(meana,s);
    meanb_pai=myupsample(meanb,s);
    q=meana_pai.*I+meanb_pai;
end