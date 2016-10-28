% ∫Ø ˝£∫
% 

function XX=Mod(Image,UserImage,beginX,beginY)

% I=imread('5.jpg');
[M,N,P]=size(Image);
 X=zeros(M,N,P,'uint8');
% X(100:120,100:200,:)=1;
% S=imread('star1.png');
[UM,UN,UP]=size(UserImage);
% prompt1='«Î ‰»Îxx:';
% xx=input(prompt1);
% prompt2='«Î ‰»Îyy:';
% yy=input(prompt2);
% BW=(im2bw(S,0.4));
X(1+beginY:UM+beginY,1+beginX:UN+beginX,:)=UserImage(1:UM,1:UN,:);
%  X=im2bw(X,0.4);
%  X=uint(X);
%  imshow(X);
%  XX=X.*I;

%if you have a matrix A 
idx= X~=1; % find all 0
X(idx)=0; % set 1 to these indexes

%about NaN
idx=find(isnan(X)); % find all  NaN value
X(idx)=1; % set 1 to these indexes
XX=X.*Image;
%   figure;
%   imshow(XX);