% 函数：选择图片
function picture=selectPicFunc()

[filename,pathname,~]=uigetfile({'*.jpg';'*.bmp';'*.png'},'选择图片');
%合成路径+文件名
str=[pathname filename]; 
%读取图片
% global I;%设置全局变量I
if isequal(filename,0)   %判断是否选择
  msg=msgbox('您没有选择图像文件,将使用默认图片','提示');
   pause(1);
     close(msg);
else
 picture=imread(str); 
 setappdata(0,'Pic',picture);
end
 
  