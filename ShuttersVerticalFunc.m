% º¯Êý£º´¹Ö±°ÙÒ¶´°
function g=ShuttersVerticalFunc(image)
if isempty(image)
    image=selectPicFunc();
end


I=image;
[M,N,R]=size(I);g=zeros(M,N,R);
for t=1:R
   for i=1:M
         for j=1:N
       
%             
if mod(i,4)==0 || mod(i,4)==1;

g(i,j,t)=I(i,j,t);
else
 g(i,j,t)=0;   

end
             
         end 
    end
end

% imshow(uint8(g));

figure
imshow(uint8(g));