function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI
% Last Modified by GUIDE v2.5 07-Oct-2015 12:50:26
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;
 
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% 显示进度条
steps=100;
hwait=waitbar(0,'请等待...');
for k=1:steps
    if steps-k<=5
        waitbar(k/steps,hwait,'即将完成');
%          pause(0.05);
    else
        str=['资源加载中...',num2str(k),'%'];
        waitbar(k/steps,hwait,str);
%          pause(0.05);
    end
end
close(hwait); % 必须添加close函数


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname,~]=uigetfile({'*.jpg';'*.bmp';'*.png'},'选择图片');
%合成路径+文件名
str=[pathname filename]; 
%读取图片
global I;%设置全局变量I
 I=imread(str); 
%使用第一个axes 
%显示图片
axes(handles.axes1);
imshow(I);

% --- Executes on button press in ChooseImage.
function ChooseImage_Callback(hObject, eventdata, handles)%选择图片控件
% hObject    handle to ChooseImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%选择图片路径
[filename,pathname,~]=uigetfile({'*.jpg';'*.bmp';'*.png'},'选择图片');
%合成路径+文件名
str=[pathname filename]; 
%读取图片
global I;%设置全局变量I
 I=imread(str); 

%使用第一个axes 
%显示图片
axes(handles.axes1);
imshow(I);


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

 list=get(handles.popupmenu1,'String');
 val=get(handles.popupmenu1,'Value');

  switch val
     case  1
            set(handles.xx,'String','起始点X坐标');
            set(handles.edit5,'String','长度');
            set(handles.yy,'String','起始点Y坐标');  
            set(handles.edit6,'String','宽度');
            set(handles.text3,'String','X坐标');
            set(handles.text4,'String','Y坐标');
            set(handles.edit5,'Visible','on');
             set(handles.edit6,'Visible','on');
         
      case 2
            set(handles.edit5,'Visible','off');
            set(handles.text3,'String','圆的半径');
            set(handles.text4,'String','圆心位置');
            set(handles.xx,'String','圆的半径');
            set(handles.yy,'String','圆心坐标X');
            set(handles.edit6,'String','圆心坐标Y');
              
      case 3
            set(handles.edit5,'Visible','off');
            set(handles.text3,'String','缩放比例');
            set(handles.text4,'String','位置');
            set(handles.xx,'String','比例需合理');
            set(handles.yy,'String','坐标X');
            set(handles.edit6,'String','坐标Y');
                
      case 4
            set(handles.edit5,'Visible','off');
            set(handles.text3,'String','缩放比例');
            set(handles.text4,'String','位置');
            set(handles.xx,'String','比例需合理');
            set(handles.yy,'String','坐标X');
             set(handles.edit6,'String','坐标Y');
%              读取模板
        [filename,pathname,~]=uigetfile({'*.png';'*.jpg';'*.bmp'},'选择图片');
        %合成路径+文件名
         str2=[pathname filename]; 
        %读取图片
            global Mod;
            Mod=imread(str2); 
  end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2



function xx_Callback(hObject, eventdata, handles)
% hObject    handle to xx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xx as text
%        str2double(get(hObject,'String')) returns contents of xx as a double

%以字符串的形式来存储数据文本框1的内容. 如果字符串不是数字。
% 则现实空白内容
input=str2num(get(hObject,'String'));
%检查输入是否为空. 如果为空,则默认显示为0
if (isempty(input))
     set(hObject,'String','0')
end

guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function xx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yy_Callback(hObject, eventdata, handles)
% hObject    handle to yy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yy as text
%        str2double(get(hObject,'String')) returns contents of yy as a double


% --- Executes during object creation, after setting all properties.
function yy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Compose.
function Compose_Callback(hObject, eventdata, handles)
% hObject    handle to Compose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

xx=str2num(get(handles.xx,'String'));
yy=str2num(get(handles.yy,'String'));
xx1=str2num(get(handles.edit5,'String'));
yy1=str2num(get(handles.edit6,'String'));

if isempty(xx)
    xx=1;
end
if isempty(yy)
    yy=1;
end
if isempty(xx1)
    xx1=1;
end
if isempty(yy1)
    yy1=1;
end

 list=get(handles.popupmenu1,'String');
 val=get(handles.popupmenu1,'Value');
  
 global I;
  switch val
     case  1
         %矩形模板
 %调用 自定义函数并返回
XX=RectMod(I,xx,yy,xx1,yy1)
   axes(handles.axes1);
 imshow(XX);
 
     case 2
%       圆形模板
     radius=xx;
     centre=yy;
    rgbmask=CircleMod(I,radius,yy,yy1);
     
    XX= immultiply(I,rgbmask);
       axes(handles.axes1);
     imshow(XX);
     
     case 3
%        用户自定义模板1（此处选择为五角星）
UserImage=imread('star1.png');
beginX=yy;
beginY=yy1;

XX=UserMod(I,UserImage,beginX,beginY,xx);
 axes(handles.axes1);
   
 imshow(XX);
      case 4
          %        用户自定义模板（从文件中选择）对模板图像有特殊要求
global Mod;
          
beginX=yy;
beginY=yy1;
% Mod=imresize(Mod,xx)
XX=UserMod(I,Mod,beginX,beginY,xx);
 axes(handles.axes1);
 imshow(XX);
            
  end
 

function tx_Callback(hObject, eventdata, handles)
% hObject    handle to tx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tx as text
%        str2double(get(hObject,'String')) returns contents of tx as a double


% --- Executes during object creation, after setting all properties.
function tx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ty_Callback(hObject, eventdata, handles)
% hObject    handle to ty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ty as text
%        str2double(get(hObject,'String')) returns contents of ty as a double


% --- Executes during object creation, after setting all properties.
function ty_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Translation.图像的平移操作
function Translation_Callback(hObject, eventdata, handles)
% hObject    handle to Translation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tx=str2num(get(handles.tx,'String'));
ty=str2num(get(handles.ty,'String'));
if isempty(tx)
    tx=1;
end
if isempty(ty)
    ty=1;
end
global I;%global 全局变量
ImageX=I;
% ImageX=imread('swift.jpg');
% % se = translate(strel(1), [tx ty]);%平移图像
% J = imdilate(ImageX,se);
%接下来用if 语句实现
[M,N,P]=size(ImageX);g=zeros(M,N,P,'uint8');
a=ty;b=tx;
for i=1:M
    for j=1:N
      for xx=1:P
%      1  
if(a>=0&&b>=0)
     if((i-a>0)&&(i-a<M)&&(j-b>0)&&(j-b<N))
        g(i,j,xx)=ImageX(i-a,j-b,xx);
     else
         g(i,j,xx)=0;
     end
end
%    2
if(a<=0&&b>=0)

     if((i>0)&&(i-a<M)&&(j-b>0)&&(j-b<N))
       g(i,j,xx)=ImageX(i-a,j-b,xx); 
    else
        g(i,j,xx)=0;
     end
end
% 3
if(a>=0&&b<=0)
     if((i-a>0)&&(i-a<M)&&(j>0)&&(j-b<N))
       g(i,j,xx)=ImageX(i-a,j-b,xx);
    else
        g(i,j,xx)=0;
     end
end
% 4
if(a<=0&&b<=0) 
     if((i>0)&&(i-a<M)&&(j>0)&&(j-b<N))
       g(i,j,xx)=ImageX(i-a,j-b,xx);
    else
        g(i,j,xx)=0;
     end
end

      end  
    end
end

axes(handles.axes2);
imshow(g);

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function ImageEnhancement_Callback(hObject, eventdata, handles)
% hObject    handle to ImageEnhancement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function GrayLevels_Callback(hObject, eventdata, handles)
% hObject    handle to GrayLevels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function HistogramProcessing_Callback(hObject, eventdata, handles)
% hObject    handle to HistogramProcessing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;

A=rgb2gray(I);
K=16;H=histeq(A,K);
figure,subplot(221),imshow(A,[]),title('原图像')
subplot(222),imshow(H,[]),title('均衡后的图像'),hold on

subplot(223),hist(double(A),16),title('原图像的直方图'),subplot(224),hist(double(H),16),title('均衡后的直方图')


% --------------------------------------------------------------------
function FanZhuan_Callback(hObject, eventdata, handles)
% hObject    handle to FanZhuan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;
  axes(handles.axes1);
   A=rgb2gray(I);%将图像转为灰度图
  imshow(A);title('原始图像');
  img2=imcomplement(A);
  
  axes(handles.axes2);
  imshow(img2);title('反转图像');
 
% 反转变换方法2:
%  axes(handles.axes1);
%  A=rgb2gray(I);
%  imshow(A);title('原始图像');
% JJ=imadjust(A,[0 1],[1 0]);
% axes(handles.axes2);
% imshow(JJ,[]);title('反转图像');


% --------------------------------------------------------------------
function XianXin_Callback(hObject, eventdata, handles)
% hObject    handle to XianXin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;
A=rgb2gray(I);
 imshow(A);title('原始图像');
 img2=imcomplement(A);
J=imadjust(A);
 axes(handles.axes2);
 imshow(J);title('灰度拉伸后的图像');

% --------------------------------------------------------------------
function FenDuan_Callback(hObject, eventdata, handles)
% hObject    handle to FenDuan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;
FenDuanFun(I);

% --------------------------------------------------------------------
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 关闭当前图形窗口
close(gcf);


% --------------------------------------------------------------------
function XianXin2_Callback(hObject, eventdata, handles)
% hObject    handle to XianXin2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;
GrayLevelsFun(I);


% --------------------------------------------------------------------
function LogEn_Callback(hObject, eventdata, handles)
% hObject    handle to LogEn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 对数变换:
global I;
 axes(handles.axes1);
 
 Im=LogEnFun(I);
  axes(handles.axes2);
 imshow(Im,[]);
 
%    A=rgb2gray(I);%将图像转为灰度图
% imshow(A);
% Image=log(1+double(A));
%  axes(handles.axes2);
% imshow(Image,[]);


% --------------------------------------------------------------------
function PowerEn_Callback(hObject, eventdata, handles)
% hObject    handle to PowerEn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 幂变换
% 隐藏部分控件

%   set(handles.edit5,'Visible','off');
%              set(handles.edit6,'Visible','off');
%              set(handles.xx,'Visible','off');
%              set(handles.yy,'Visible','off');
%              set(handles.tx,'Visible','off');
%              set(handles.ty,'Visible','off');
%              set(handles.axes1,'Visible','off');
%              set(handles.axes2,'Visible','off');
%              set(handles.ChooseImage,'Visible','off');
%              set(handles.text2,'Visible','off');
%               set(handles.popupmenu1,'Visible','off');
%              set(handles.text3,'Visible','off');
%               set(handles.text4,'Visible','off');
%              set(handles.Compose,'Visible','off');
%               set(handles.Translation,'Visible','off');
%               set(handles.text5,'Visible','off');
%                set(handles.text6,'Visible','off');
%               set(handles.text7,'Visible','off');
%       
global I;
 
PowerEnFun(I);

% A=I;
% A=rgb2gray(A);%将图像转为灰度图
% x=0:255;
% a=90,b=1.5,c=0.008;
% B=b.^(c.*(double(A)-a))-1;
% y=b.^(c.*(x-a))-1;
% figure(1);
% subplot(2,2,1)
% imshow(A)
% subplot(2,2,2)
% imhist(A)
% subplot(2,2,3)
% imshow(B)
% subplot(2,2,4)
% imhist(B)
% figure,plot(x,y)
