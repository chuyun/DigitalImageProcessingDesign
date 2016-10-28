I=imread('6.jpg');
I=rgb2gray(I);
K=16;H=histeq(I,K);
figure,subplot(221),imshow(I,[])
subplot(222),imshow(H,[]),hold on

subplot(223),hist(double(I),16),subplot(224),hist(double(H),16)