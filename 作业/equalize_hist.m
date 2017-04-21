function [outputImg] = equalize_hist(inputImg)
   [height, width] = size(inputImg);
   
   %进行像素灰度统计
   pixel = zeros(1, 256);
   for i = 1:height
       for j = 1:width
           pixel(inputImg(i,j)+1) = pixel(inputImg(i,j)+1) + 1;%对应灰度值像素点数量增加
       end
   end

   %计算灰度分布密度
   probability = zeros(1, 256);
   for i = 1:256
       probability(i) = pixel(i)*1.0/(height * width);
   end
   
   %计算累计直方图分布
   ccumulate = zeros(1, 256);
   for i = 1:256
       if (i == 1)
           ccumulate(i) = probability(i);
       else
           ccumulate(i) = ccumulate(i - 1) + probability(i);
       end
   end
  
  %取最近的整数
  ccumulate = uint8(255 .* ccumulate + 0.5);

  %生成输出图像
  for i = 1:height
      for j = 1:width
         outputImg(i,j) = ccumulate(inputImg(i,j) + 1);
      end
  end
end