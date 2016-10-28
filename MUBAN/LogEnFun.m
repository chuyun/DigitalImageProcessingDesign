
%  LogEn

function A2=LogEnFun(Image)

A=rgb2gray(Image);%将图像转为灰度图
imshow(A);
A2=log(1+double(A));
%  axes(handles.axes2);
% imshow(A2,[]);