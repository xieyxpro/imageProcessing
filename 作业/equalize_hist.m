function [outputImg] = equalize_hist(inputImg)
   [height, width] = size(inputImg);
   
   %�������ػҶ�ͳ��
   pixel = zeros(1, 256);
   for i = 1:height
       for j = 1:width
           pixel(inputImg(i,j)+1) = pixel(inputImg(i,j)+1) + 1;%��Ӧ�Ҷ�ֵ���ص���������
       end
   end

   %����Ҷȷֲ��ܶ�
   probability = zeros(1, 256);
   for i = 1:256
       probability(i) = pixel(i)*1.0/(height * width);
   end
   
   %�����ۼ�ֱ��ͼ�ֲ�
   ccumulate = zeros(1, 256);
   for i = 1:256
       if (i == 1)
           ccumulate(i) = probability(i);
       else
           ccumulate(i) = ccumulate(i - 1) + probability(i);
       end
   end
  
  %ȡ���������
  ccumulate = uint8(255 .* ccumulate + 0.5);

  %�������ͼ��
  for i = 1:height
      for j = 1:width
         outputImg(i,j) = ccumulate(inputImg(i,j) + 1);
      end
  end
end