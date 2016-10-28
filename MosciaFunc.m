
function ReImage=MosciaFunc(img,n,m)

% img=imread('swift.jpg');

R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);

% MosciaBasicFunc(rgb2gray(img));
 RR=MosciaBasicFunc(R,n,m);
 RG=MosciaBasicFunc(G,n,m);
 RB=MosciaBasicFunc(B,n,m);
 
 ReImage(:,:,1)=RR;
  ReImage(:,:,2)=RG;
   ReImage(:,:,3)=RB;
   
   ReImage=uint8(ReImage);
   
   figure(2);
   imshow(ReImage);
  