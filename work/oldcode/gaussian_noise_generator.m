function[noise] = gaussian_noise_generator(mean,standard,h,w)
      noise=random('norm',mean,standard,h,w);
end