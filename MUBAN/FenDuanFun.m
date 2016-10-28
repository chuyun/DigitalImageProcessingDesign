%函数：分段线性变换 

function  FenDuanFun(Image)

b=Image;
% b=imread('5.jpg');%
i=rgb2gray(b); %
di=double(i);
imhist(i);
a=min(min(di));
b=max(max(di));
c=120.0;d=150.0;
a1=0.0;b1=255.0;
c1=30.0;d1=171.0;
n1=find(di>=a&di<c);
n2=find(di>=c&di<d);
n3=find(di>=d&di<b);
di2=di;
di2(n1)=(di(n1)-a)*(c1-a1)/(c-a)+a1;
di2(n2)=(di(n2)-c)*(d1-c1)/(d-c)+c1;
di2(n3)=(di(n3)-d)*(b1-d1)/(b-d)+d1;
i2=uint8(di2);

figure(2);
subplot(221),imshow(i);title('原图')
figure(2);
subplot(222),imshow(i2);title('分段线性变换')
figure(2);
subplot(223),imhist(i);title('原图直方图')
figure(2);
subplot(224),imhist(i2);title('分段线性变换直方图')

