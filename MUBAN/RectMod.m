% ����������ģ��
% 

function XX=RectMod(Image,beginX,beginY,length,wide)
% ����1
[M,N,P]=size(Image);
 X=zeros(M,N,P,'uint8');
 X(beginX:beginX+length,beginY:beginY+wide,:)=1;

  XX=X.*Image;

%   return XX;
% 
%   figure;
%   imshow(XX);
%   
  
%   ����2
% ���������ı��ε�Ч��
% n=200;          %% NΪ�����С
% b=80;          %% bΪ�������α߳�
% A=2*ones(n);
% 
% 
% A(n/2-b/2:n/2+b/2, n/2-b/2:n/2+b/2) = 1;
% imshow(A,[])