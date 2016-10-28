% 保存所选文件
function SaveImageFunc(pic)

[filename,pathname]=uiputfile('*.jpg','请输入图像名字');
 pathfile=[pathname filename];
if isequal(filename,0)   %判断是否选择
  msg=msgbox('您没有设置文件名');
   pause(1);
   close(msg);
% elseif isequal(0,pathname) 
%     msgbox('您没有设置文件名');
 else
     imwrite(pic,pathfile,'jpeg')
 end