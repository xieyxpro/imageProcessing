function q = guidedfilter(I,p,r)
	[height,width]=size(I);

	N=squarefilter(ones(height,width),r);

	meanI=squarefilter(I,r)./N;
	meanp=squarefilter(p,r)./N;
	meanIP=squarefilter(I.*p,r)./N;
	meanII=squarefilter(I.*I,r)./N;

	covIP=meanIP-meanI.*meanp;
	varI=meanII-meanI.*meanI;

	a=covIP./(varI+eps);
	b=meanp-a.*meanI;

	meana=squarefilter(a,r)./N;
	meanb=squarefilter(b,r)./N;

	q=meana.*I+meanb;
end