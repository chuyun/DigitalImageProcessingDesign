% 函数：图片的分块显示
function Im=BlockDisplayFunc(image)
if isempty(image)
% clear,clc;
 [filename,filepath] = uigetfile('*.*','Select the image');  
 if isequal(filename,0)||isequal(filepath,0)
     return;
 else
    filefullpath=[filepath,filename];
 end
% %得到文件名，以便建立一个文件夹保存分块图像
 [pathstr,name,ext] = fileparts(filename);
 image=imread(filefullpath);
% imshow(Im)
end
Im=image;
L = size(Im);
%分块大小
height=300;
width=400;
%重叠
x=0.25;
h_val=height*(1-x);
w_val=width*(1-x);
max_row = (L(1)-height)/h_val+1;
max_col = (L(2)-width)/w_val+1;
%判断能否完整分块
if max_row==fix(max_row)%判断是否能够整分
    max_row=max_row;
else
    max_row=fix(max_row+1);
end
if max_col==fix(max_col)%判断是否能够整分
    max_col=max_col;
else
    max_col=fix(max_col+1);
end
seg = cell(max_row,max_col);
for row = 1:max_row      
    for col = 1:max_col        
        if ((width+(col-1)*w_val)>L(2)&&((row-1)*h_val+height)<=L(1))%判断最右边不完整的部分
    seg(row,col)= {Im((row-1)*h_val+1:height+(row-1)*h_val,(col-1)*w_val+1:L(2),:)};
        elseif((height+(row-1)*h_val)>L(1)&&((col-1)*w_val+width)<=L(2))%判断最下边不完整的部分
    seg(row,col)= {Im((row-1)*h_val+1:L(1),(col-1)*w_val+1:width+(col-1)*w_val,:)}; 
        elseif((width+(col-1)*w_val)>L(2)&&((row-1)*h_val+height)>L(1))%判断最后一张
    seg(row,col)={Im((row-1)*h_val+1:L(1),(col-1)*w_val+1:L(2),:)};       
        else
     seg(row,col)= {Im((row-1)*h_val+1:height+(row-1)*h_val,(col-1)*w_val+1:width+(col-1)*w_val,:)}; %其余完整部分  
        end
    end
end 
 imshow(Im);
 hold on
 system(['mkdir ','name']);%创建与图片名相同的文件用来保存图片
paths=[pwd,'\','name']; %获取指定文件夹目录
 %保存子图
for i=1:max_row
    for j=1:max_col
 imwrite(seg{i,j},[paths,'\',strcat(int2str(i),'行',int2str(j),'列','.bmp')]);   %把第i帧的图片写为'mi.bmp'
    end
end

% 画框显示
 for row = 1:max_row      
    for col = 1:max_col  
    c=rand(1,3);%随机颜色
     rectangle('Position',[w_val*(col-1),h_val*(row-1),width,height],...
         'LineWidth',2,'LineStyle','-','EdgeColor',c);
    end
 end 
  figure
  imshow(Im);
 for row = 1:max_row      
    for col = 1:max_col  
    c=rand(1,3);%随机颜色
     rectangle('Position',[w_val*(col-1),h_val*(row-1),width,height],...
         'LineWidth',2,'LineStyle','-','EdgeColor',c);
    end
 end 