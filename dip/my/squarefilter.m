function output = squarefilter(imsrc, r)
	[height, width] = size(imsrc);
	temp = zeros(height,width);

	cum = cumsum(imsrc,2);
	temp(:,1:r+1)=cum(:,1+r:2*r+1);
	temp(:,r+2:width-r)=cum(:,2*r+2:width)-cum(:,1:width-2*r-1);
	temp(:,width-r+1:width)=repmat(cum(:,width),1,r)-cum(:,width-2*r:width-r-1);

	output = zeros(height,width);
	temp2 = cumsum(temp,1);
	
	output(1:r+1,:)=temp2(1+r:2*r+1,:);
	output(r+2:height-r,:)=temp2(2*r+2:height,:)-temp2(1:height-2*r-1,:);
	output(height-r+1:height,:)=repmat(output(height,:),r,1)-temp2(height-2*r:height-r-1,:);
end