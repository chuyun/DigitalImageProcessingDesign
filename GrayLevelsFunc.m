% 函数：线性灰度变换函数
function GrayLevelsFunc(Image)
%-----------------------------------------------------
% I = imread('5.jpg');
I=Image;
I=rgb2gray(I);
I = im2double(I);
[row, col] = size(I);

figure(1);
subplot(2, 4, 1);
imshow(I); title('原图');
figure(1);
subplot(245);
[H, x] = imhist(I, 64);%计算64个小区间的灰度直方图
stem(x, (H/row/col), '.'); title('原图直方图');


%-----------------------------------------------------
% Db = f(Da) = fa * Da + fb
% fa > 1 时, 输出图像的对比度将增大; 当fa < 1时, 对比度减小.
% 当fa = 1, fb != 0时, 操作使所有像素的灰度值上下移, 整个图
% 变得更亮或者更暗

%增加对比度
Fa = 2; Fb = -55;
o = Fa .* I + Fb / 255;

figure(1);
subplot(2, 4, 2);
imshow(o); title('Fa = 2; Fb = -55;');
% 
figure(1);
subplot(246);
[H, x] = imhist(o, 64);%计算64个小区间的灰度直方图
stem(x, (H/row/col), '.'); title('增加对比度后的直方图');

%减小对比度
Fa = 0.5; Fb = -55;
o = Fa .* I + Fb / 255;

figure(1);
subplot(2, 4, 3);
imshow(o); title('Fa = 0.5; Fb = -55;');
% 
figure(1);
subplot(247);
[H, x] = imhist(o, 64);%计算64个小区间的灰度直方图
stem(x, (H/row/col), '.'); title('减小对比度后的直方图');
% 
%相反显示
Fa = -1; Fb = 255;
o = Fa .* I + Fb / 255;

figure(1);
subplot(2, 4,4);
imshow(o); title('Fa = -1; Fb = 255;');
figure(1);
subplot(248);
[H, x] = imhist(o, 64);%计算64个小区间的灰度直方图
stem(x, (H/row/col), '.'); title('相反显示的直方图');



