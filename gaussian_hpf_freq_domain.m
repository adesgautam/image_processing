clear all;close all;clc;pkg load image;gry = double(rgb2gray(imread("lena.png")));% Show Original Imagefigureimshow(uint8(gry));title("Original Image");imwrite(uint8(gry), "results/frequency_domain/gaussian_hpf/original.jpg");% Convert into Freq Domainfreq_gry = fft2(gry);imwrite(mat2gray(freq_gry), "results/frequency_domain/gaussian_hpf/fft.jpg");freq_gry = fftshift(freq_gry);imwrite(mat2gray(freq_gry), "results/frequency_domain/gaussian_hpf/fft_shift.jpg");% Show image in freq domainfigurefreq_gry_disp = log(1+abs(freq_gry));imshow(mat2gray(freq_gry_disp));title("Image in Freq Domain");imwrite(mat2gray(freq_gry_disp), "results/frequency_domain/gaussian_hpf/fft+fft_shift.jpg");% Create Gaussian Mask [M N] = size(gry);filtr = zeros(M,N);sigma = 10; % Sigma Values for Gaussian Filterfor i = 1:M  for j = 1:N    dist= (i-M/2)^2 + (j-N/2)^2;    filtr(i,j) = 1 - exp(-(dist)/(2*(sigma)^2));  endendfigureimshow(filtr);title("Gaussian Mask");imwrite(filtr, "results/frequency_domain/gaussian_hpf/gaussian_mask.jpg");% Apply mask on the image in freq domainresult = freq_gry .* filtr;figureresult_disp = log(1+abs(result));imshow(mat2gray(result_disp));title("Gaussian on the image");imwrite(mat2gray(result_disp), "results/frequency_domain/gaussian_hpf/gaussian_mask_on_fft.jpg");% Inverse Fourier Transforminv_result = ifftshift(result);imwrite(uint8(abs(inv_result)), "results/frequency_domain/gaussian_hpf/inv_fft_shift.jpg");inv_result = ifft2(inv_result);imwrite(uint8(abs(inv_result)), "results/frequency_domain/gaussian_hpf/inv_fft.jpg");