
function  PowerEnFun(Image)
 
A=Image;
A=rgb2gray(A);%将图像转为灰度图
x=0:255;
a=90,b=1.5,c=0.008;
B=b.^(c.*(double(A)-a))-1;
y=b.^(c.*(x-a))-1;
figure(1);
subplot(2,2,1)
imshow(A)
subplot(2,2,2)
imhist(A)
subplot(2,2,3)
imshow(B)
subplot(2,2,4)
imhist(B)
figure,plot(x,y)
