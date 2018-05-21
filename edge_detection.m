clear all;    % clear all variablesclose all;    % close all figuresclc;          % clear command window  % import image packagepkg load image; % read imageimg = imread("lena.png");  % convert to grayscalegry = rgb2gray(img);figuresubplot(3,2,1);% Sobel edge detectionsobel = edge(gry, "Sobel");imshow(sobel);title("Sobel Edge Detection"); %[-1 -2 -1;0 0 0;-1 -2 -1]subplot(3,2,2);% prewitt edge detectionprewitt = edge(gry, "Prewitt");imshow(prewitt);title("Prewitt Edge Detection"); %[-1 -1 -1;0 0 0;-1 -1 -1]subplot(3,2,3);% roberts edge detectionroberts = edge(gry, "Roberts");imshow(roberts);title("Roberts Edge Detection");subplot(3,2,4);% canny edge detectioncanny = edge(gry, "Canny");imshow(canny);title("Canny Edge Detection");