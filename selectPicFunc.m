% ������ѡ��ͼƬ
function picture=selectPicFunc()

[filename,pathname,~]=uigetfile({'*.jpg';'*.bmp';'*.png'},'ѡ��ͼƬ');
%�ϳ�·��+�ļ���
str=[pathname filename]; 
%��ȡͼƬ
% global I;%����ȫ�ֱ���I
if isequal(filename,0)   %�ж��Ƿ�ѡ��
  msg=msgbox('��û��ѡ��ͼ���ļ�,��ʹ��Ĭ��ͼƬ','��ʾ');
   pause(1);
     close(msg);
else
 picture=imread(str); 
 setappdata(0,'Pic',picture);
end
 
  