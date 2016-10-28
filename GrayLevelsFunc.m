% ���������ԻҶȱ任����
function GrayLevelsFunc(Image)
%-----------------------------------------------------
% I = imread('5.jpg');
I=Image;
I=rgb2gray(I);
I = im2double(I);
[row, col] = size(I);

figure(1);
subplot(2, 4, 1);
imshow(I); title('ԭͼ');
figure(1);
subplot(245);
[H, x] = imhist(I, 64);%����64��С����ĻҶ�ֱ��ͼ
stem(x, (H/row/col), '.'); title('ԭͼֱ��ͼ');


%-----------------------------------------------------
% Db = f(Da) = fa * Da + fb
% fa > 1 ʱ, ���ͼ��ĶԱȶȽ�����; ��fa < 1ʱ, �Աȶȼ�С.
% ��fa = 1, fb != 0ʱ, ����ʹ�������صĻҶ�ֵ������, ����ͼ
% ��ø������߸���

%���ӶԱȶ�
Fa = 2; Fb = -55;
o = Fa .* I + Fb / 255;

figure(1);
subplot(2, 4, 2);
imshow(o); title('Fa = 2; Fb = -55;');
% 
figure(1);
subplot(246);
[H, x] = imhist(o, 64);%����64��С����ĻҶ�ֱ��ͼ
stem(x, (H/row/col), '.'); title('���ӶԱȶȺ��ֱ��ͼ');

%��С�Աȶ�
Fa = 0.5; Fb = -55;
o = Fa .* I + Fb / 255;

figure(1);
subplot(2, 4, 3);
imshow(o); title('Fa = 0.5; Fb = -55;');
% 
figure(1);
subplot(247);
[H, x] = imhist(o, 64);%����64��С����ĻҶ�ֱ��ͼ
stem(x, (H/row/col), '.'); title('��С�ԱȶȺ��ֱ��ͼ');
% 
%�෴��ʾ
Fa = -1; Fb = 255;
o = Fa .* I + Fb / 255;

figure(1);
subplot(2, 4,4);
imshow(o); title('Fa = -1; Fb = 255;');
figure(1);
subplot(248);
[H, x] = imhist(o, 64);%����64��С����ĻҶ�ֱ��ͼ
stem(x, (H/row/col), '.'); title('�෴��ʾ��ֱ��ͼ');



