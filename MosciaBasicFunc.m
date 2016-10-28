
function imageAero=MosciaBasicFunc(img,n,m)


% img=imread('lena.jpg');
imshow(img,[]);

[h w r]=size(img);
imgn=zeros(h,w,r);

% n=12;
nw=floor(w/n)*n;
nh=floor(h/n)*n;

for y=1:n:nh
    for x=1:n:nw
        imgn(y:y+n-1,x:x+n-1)=mean(mean(img(y:y+n-1,x:x+n-1)));       
    end

    imgn(y:y+n-1,nw+1:w)=mean(mean(img(y:y+n-1,nw+1:w)));   %处理最后一列
    imgn(y,1:w)=m; 
end

for x=1:n:nw
    imgn(nh+1:h,x:x+n-1)=mean(mean(img(nh+1:h,x:x+n-1)));   %处理最后一行
    imgn(1:h,x)=m;    
end

imgn(nh+1:h,nw+1:w)=mean(mean(img(nh+1:h,nw+1:w)));     %处理最后一个角

imgn(1:h,nw)=m;
imgn(1:h,w)=m;

imgn(nh,1:w)=m;
imgn(h,1:w)=m;

imageAero=imgn;
%  imshow(imageAero,[]);


% figure;imshow(imgn,[])