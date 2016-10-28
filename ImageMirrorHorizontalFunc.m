function MirrorHImage=ImageMirrorHorizontalFunc(image)

I=image;

[M,N,R]=size(I);g=zeros(M,N,R);
for t=1:R
    for i=1:M
         for j=1:N
          g(i,j,t)=I(i,N-j+1,t);
         end 
    end
end
% MirrorHImage=g;
 MirrorHImage=uint8(g);
% subplot(122);imshow(uint8(g));title('Ë®Æ½¾µÏñ');