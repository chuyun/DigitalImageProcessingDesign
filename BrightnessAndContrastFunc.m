% 
function image=BrightnessAndContrastFunc(image,a,b)
% image=imread('swift.jpg');

%  a=get(handles.ContrastSlider,'Value');

%  b=get(handles.BrightnessSlider,'Value');


if isempty(image)
    image=selectPicFunc();
end


I=image;
[M,N,R]=size(I);g=zeros(M,N,R);
for t=1:R
   for i=1:M
         for j=1:N
       

% g(i,j,t)=I(i,j,t);

g(i,j,t)=a*I(i,j,t)+b;
             
         end 
    end
end

% imshow(uint8(g));
image=(g);
 figure(1);
 imshow(uint8(g));
