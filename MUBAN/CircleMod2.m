
function rgbROI=CircleMod2(ImageX,radius,centre)

img = imread('6.jpg');
grayimg = rgb2gray(img);
[imgW,imgH] = size(grayimg);
t = linspace(0, 2*pi, 50); 
% r = 150;                      %°ë¾¶
% c = [300 300];               %Ô²ÐÄ×ø±ê

BW = poly2mask(radius*cos(t)+centre(1), radius*sin(t)+centre(2), imgW, imgH);
rgbmask(:,:,1) = BW;
rgbmask(:,:,2) = BW;
rgbmask(:,:,3) = BW;
rgbROI = immultiply(ImageX,rgbmask);
% figure,imshow(BW);
figure,imshow(rgbROI);
