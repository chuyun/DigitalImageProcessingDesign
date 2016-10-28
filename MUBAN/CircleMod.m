
function rgbmask=CircleMod(ImageX,radius,centreX,centreY)

% img = imread('6.jpg');
grayimg = rgb2gray(ImageX);
[imgW,imgH] = size(grayimg);
t = linspace(0, 2*pi, 50); 
% r = 150;                      %°ë¾¶
% c = [300 300];               %Ô²ÐÄ×ø±ê
BW = poly2mask(radius*cos(t)+centreX, radius*sin(t)+centreY, imgW, imgH);
rgbmask(:,:,1) = BW;
rgbmask(:,:,2) = BW;
rgbmask(:,:,3) = BW;
% rgbROI=ImageX.*rgbmask;
 rgbROI = immultiply(ImageX,rgbmask);
% figure,imshow(BW);
% figure,imshow(rgbROI);
