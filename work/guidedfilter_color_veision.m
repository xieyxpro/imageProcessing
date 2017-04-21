function q = guidedfilter_color_version(I,p,r)
	[height,width]=size(I);
	N=squarefilter(ones(height,width),r);

	meanIR=squarefilter(I(:,:,1),r)./N;
	meanIG=squarefilter(I(:,:,2),r)./N;
	meanIB=squarefilter(I(:,:,3),r)./N;

	meanP=squarefilter(p,r)./N;

	meanIPR=squarefilter(I(:,:,1).*p,r)./N;
	meanIPG=squarefilter(I(:,:,2).*p,r)./N;
	meanIPB=squarefilter(I(:,:,3).*p,r)./N;

	covIPR=meanIPR-meanIR.*meanP;
	covIPG=meanIPG-meanIG.*meanP;
	covIPB=meanIPB-meanIB.*meanP;

	varIRR=squarefilter(I(:,:,1).*I(:,:,1),r)./N-meanIR.*meanIR;
	varIRG=squarefilter(I(:,:,2).*I(:,:,2),r)./N-meanIR.*meanIG;
	varIRB=squarefilter(I(:,:,3).*I(:,:,3),r)./N-meanIR.*meanIB;
	varIGG=squarefilter(I(:,:,2).*I(:,:,2),r)./N-meanIG.*meanIG;
	varIGB=squarefilter(I(:,:,2).*I(:,:,3),r)./N-meanIG.*meanIB;
	varIBB=squarefilter(I(:,:,3).*I(:,:,3),r)./N-meanIB.*meanIB;

	a=zeros(height,width,3);
	for y=1:height
		for x=1:width
			k=[varIRR(y,x),varIRG(y,x),varIRB(y,x);
				varIRG(y,x),varIGG(y,x),varIGB(y,x);
				varIRB(y,x),varIGB(y,x),varIBB(y,x)];

			covIP=[covIPR(y,x),covIPG(y,x),covIPB(y,x)];
			a(y,x,:)=covIP*inv(k+eps*eye(3));
		end
	end

	b=meanP-a(:,:,1).*meanIR-a(:,:,2).*meanIG-a(:,:,3).*meanIB;
	q=(squarefilter(a(:,:,1),r).*I(:,:,1) + squarefilter(a(:,:,2),r).*I(:,:,2) + squarefilter(a(:,:,3),r).*I(:,:,3) + squarefilter(b,r))./N;
end