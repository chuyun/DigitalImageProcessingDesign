% ������ѡ�ļ�
function SaveImageFunc(pic)

[filename,pathname]=uiputfile('*.jpg','������ͼ������');
 pathfile=[pathname filename];
if isequal(filename,0)   %�ж��Ƿ�ѡ��
  msg=msgbox('��û�������ļ���');
   pause(1);
   close(msg);
% elseif isequal(0,pathname) 
%     msgbox('��û�������ļ���');
 else
     imwrite(pic,pathfile,'jpeg')
 end