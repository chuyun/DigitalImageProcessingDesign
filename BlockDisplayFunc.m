% ������ͼƬ�ķֿ���ʾ
function Im=BlockDisplayFunc(image)
if isempty(image)
% clear,clc;
 [filename,filepath] = uigetfile('*.*','Select the image');  
 if isequal(filename,0)||isequal(filepath,0)
     return;
 else
    filefullpath=[filepath,filename];
 end
% %�õ��ļ������Ա㽨��һ���ļ��б���ֿ�ͼ��
 [pathstr,name,ext] = fileparts(filename);
 image=imread(filefullpath);
% imshow(Im)
end
Im=image;
L = size(Im);
%�ֿ��С
height=300;
width=400;
%�ص�
x=0.25;
h_val=height*(1-x);
w_val=width*(1-x);
max_row = (L(1)-height)/h_val+1;
max_col = (L(2)-width)/w_val+1;
%�ж��ܷ������ֿ�
if max_row==fix(max_row)%�ж��Ƿ��ܹ�����
    max_row=max_row;
else
    max_row=fix(max_row+1);
end
if max_col==fix(max_col)%�ж��Ƿ��ܹ�����
    max_col=max_col;
else
    max_col=fix(max_col+1);
end
seg = cell(max_row,max_col);
for row = 1:max_row      
    for col = 1:max_col        
        if ((width+(col-1)*w_val)>L(2)&&((row-1)*h_val+height)<=L(1))%�ж����ұ߲������Ĳ���
    seg(row,col)= {Im((row-1)*h_val+1:height+(row-1)*h_val,(col-1)*w_val+1:L(2),:)};
        elseif((height+(row-1)*h_val)>L(1)&&((col-1)*w_val+width)<=L(2))%�ж����±߲������Ĳ���
    seg(row,col)= {Im((row-1)*h_val+1:L(1),(col-1)*w_val+1:width+(col-1)*w_val,:)}; 
        elseif((width+(col-1)*w_val)>L(2)&&((row-1)*h_val+height)>L(1))%�ж����һ��
    seg(row,col)={Im((row-1)*h_val+1:L(1),(col-1)*w_val+1:L(2),:)};       
        else
     seg(row,col)= {Im((row-1)*h_val+1:height+(row-1)*h_val,(col-1)*w_val+1:width+(col-1)*w_val,:)}; %������������  
        end
    end
end 
 imshow(Im);
 hold on
 system(['mkdir ','name']);%������ͼƬ����ͬ���ļ���������ͼƬ
paths=[pwd,'\','name']; %��ȡָ���ļ���Ŀ¼
 %������ͼ
for i=1:max_row
    for j=1:max_col
 imwrite(seg{i,j},[paths,'\',strcat(int2str(i),'��',int2str(j),'��','.bmp')]);   %�ѵ�i֡��ͼƬдΪ'mi.bmp'
    end
end

% ������ʾ
 for row = 1:max_row      
    for col = 1:max_col  
    c=rand(1,3);%�����ɫ
     rectangle('Position',[w_val*(col-1),h_val*(row-1),width,height],...
         'LineWidth',2,'LineStyle','-','EdgeColor',c);
    end
 end 
  figure
  imshow(Im);
 for row = 1:max_row      
    for col = 1:max_col  
    c=rand(1,3);%�����ɫ
     rectangle('Position',[w_val*(col-1),h_val*(row-1),width,height],...
         'LineWidth',2,'LineStyle','-','EdgeColor',c);
    end
 end 