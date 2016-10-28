function MirrorVImage=ImageMirrorHorizontalFunc(image)

I=image;

[M,N,R]=size(I);g=zeros(M,N,R);
for t=1:R
   for i=1:M
         for j=1:N
        g(i,j,t)=I(M-i+1,j,t);
         end 
    end
end

MirrorVImage=uint8(g);
% subplot(122);imshow(uint8(g));title('Ë®Æ½¾µÏñ');