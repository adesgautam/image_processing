% Unsharp Maskingclear all;clc;pkg load image; img = imread("lena.png");gry = double(rgb2gray(img));% LPFlpf = (1/9)*ones(3,3);res = imfilter(gry, lpf);% Original image - Blurred imagemask = gry-res;% Original Image - mask(difference)final = gry+mask;figure;imshow(uint8(gry));figure;imshow(uint8(final));imwrite(uint8(final), "results/unshap_masking.jpg");