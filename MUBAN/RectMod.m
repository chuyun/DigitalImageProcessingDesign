% 函数：矩形模板
% 

function XX=RectMod(Image,beginX,beginY,length,wide)
% 方法1
[M,N,P]=size(Image);
 X=zeros(M,N,P,'uint8');
 X(beginX:beginX+length,beginY:beginY+wide,:)=1;

  XX=X.*Image;

%   return XX;
% 
%   figure;
%   imshow(XX);
%   
  
%   方法2
% 画出来的四边形的效果
% n=200;          %% N为网格大小
% b=80;          %% b为正三角形边长
% A=2*ones(n);
% 
% 
% A(n/2-b/2:n/2+b/2, n/2-b/2:n/2+b/2) = 1;
% imshow(A,[])