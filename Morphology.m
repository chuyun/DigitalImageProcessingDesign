function varargout = Morphology(varargin)
% MORPHOLOGY MATLAB code for Morphology.fig
%      MORPHOLOGY, by itself, creates a new MORPHOLOGY or raises the existing
%      singleton*.
%
%      H = MORPHOLOGY returns the handle to a new MORPHOLOGY or the handle to
%      the existing singleton*.
%
%      MORPHOLOGY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORPHOLOGY.M with the given input arguments.
%
%      MORPHOLOGY('Property','Value',...) creates a new MORPHOLOGY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Morphology_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Morphology_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morphology

% Last Modified by GUIDE v2.5 19-Jun-2016 21:17:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morphology_OpeningFcn, ...
                   'gui_OutputFcn',  @Morphology_OutputFcn, ...
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


% --- Executes just before Morphology is made visible.
function Morphology_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Morphology (see VARARGIN)

% Choose default command line output for Morphology
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morphology wait for user response (see UIRESUME)
% uiwait(handles.MorphologyTag);
mymsg=msgbox('请鼠标右键选择一张二值图像','提示');
pause(1);
try
close(mymsg);
catch  
end
% global I;
I=imread('BinaryDemo.bmp');
setappdata(0,'BinaryImage',I);

% --- Outputs from this function are returned to the command line.
function varargout = Morphology_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to OpenBinaryPic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%读取图片
% global I;%设置全局变量I
try
[filename,pathname,~]=uigetfile({'*.bmp';'*.jpg';'*.png'},'选择图片');
%合成路径+文件名
str=[pathname filename]; 
img=imread(str); 

catch
  img=imread('starcraft.bmp');
end

 
%使用第一个axes 
%显示图片
axes(handles.axes1);
 setappdata(0,'BinaryImage',img);
hImage1=imshow(img);
% 右键保存图片
%    hImage5=image(BW1);
  setappdata(0,'hAxes1ImageMor',hImage1);
   set(hImage1,'ButtonDownFcn',@axes1_ButtonDownFcn);

% --------------------------------------------------------------------
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=gcf;
DigitalImageProcessingDesign;
close(current);

% --------------------------------------------------------------------
function Morphology_Callback(hObject, eventdata, handles)
% hObject    handle to Morphology (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function Operation_Callback(hObject, eventdata, handles)
% hObject    handle to Operation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Demo_Callback(hObject, eventdata, handles)
% hObject    handle to Demo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function boundary_extraction_Callback(hObject, eventdata, handles)
% hObject    handle to boundary_extraction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
se=strel('square',3);
loadImage=getappdata(0,'BinaryImage');
if isempty(loadImage)
    loadImage=selectPicFunc();
end
% global I;
I=loadImage;
Ie=imerode(I,se);
Iout=I-Ie;
axes(handles.axes6);
hImage6=imshow(Iout);title('边界提取');
% 右键保存图片
%    hImage5=image(BW1);
  setappdata(0,'hAxes1ImageMor',hImage6);
   set(hImage6,'ButtonDownFcn',@axes6_ButtonDownFcn);

% --------------------------------------------------------------------
function region_filling_Callback(hObject, eventdata, handles)
% hObject    handle to region_filling (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'BinaryImage');
if isempty(loadImage)
    loadImage=selectPicFunc();
end
% global I;
I=loadImage;
BW1=im2bw(I);
axes(handles.axes4);
hImage4=imshow(BW1);
% 右键保存图片
setappdata(0,'hAxes1ImageMor',hImage4);
set(hImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);

BW2=bwfill(BW1,'holes');
axes(handles.axes5);title('区域填充')
hImage5=imshow(BW2);
% 右键保存图片
  setappdata(0,'hAxes1ImageMor',hImage5);
  set(hImage5,'ButtonDownFcn',@axes5_ButtonDownFcn);



% --------------------------------------------------------------------
function thinning_Callback(hObject, eventdata, handles)
% hObject    handle to thinning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function thickening_Callback(hObject, eventdata, handles)
% hObject    handle to thickening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function skeletons_Callback(hObject, eventdata, handles)
% hObject    handle to skeletons (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function pruning_Callback(hObject, eventdata, handles)
% hObject    handle to pruning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenOperation_Callback(hObject, eventdata, handles)
% hObject    handle to OpenOperation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'BinaryImage');
if isempty(loadImage)
    loadImage=selectPicFunc();
end
% global I;
I=loadImage;

Io=imopen(I,ones(6,6));%6*6正方形
axes(handles.axes4);
hImage4=imshow(Io,[]);title('开运算');
% 右键保存图片
%    hImage5=image(BW1);
  setappdata(0,'hAxes1ImageMor',hImage4);
   set(hImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);

% --------------------------------------------------------------------
function CloseOperation_Callback(hObject, eventdata, handles)
% hObject    handle to CloseOperation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'BinaryImage');
if isempty(loadImage)
    loadImage=selectPicFunc();
end
% global I;
I=loadImage;

Io=imclose(I,ones(6,6));%6*6正方形
axes(handles.axes5);
hImage5=imshow(Io,[]);title('闭运算');
% 右键保存图片
%    hImage5=image(BW1);
  setappdata(0,'hAxes1ImageMor',hImage5);
   set(hImage5,'ButtonDownFcn',@axes5_ButtonDownFcn);

% --------------------------------------------------------------------
function Erosion_Callback(hObject, eventdata, handles)
% hObject    handle to Erosion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% image=getappdata(0,'Image');
set(handles.slider1,'Visible','on');
set(handles.text2,'Visible','on');
set(handles.text3,'Visible','on');

% --------------------------------------------------------------------
function Dilation_Callback(hObject, eventdata, handles)
% hObject    handle to Dilation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider2,'Visible','on');
set(handles.text4,'Visible','on');
set(handles.text5,'Visible','on');

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
v=get(handles.slider1,'Value');
str=sprintf('%d',v);

set(handles.text3,'String',str);
 str2=str2double(str);
% setappdata(0,'str',v);
loadImage=getappdata(0,'BinaryImage');
if isempty(loadImage)
    loadImage=selectPicFunc();
end
% global I;
I=loadImage;

se=strel('square',(str2));%5*5的正方形结构元素
ImageErosion=imerode(I,se);

axes(handles.axes2);

 hImage2=imshow(ImageErosion);title('腐蚀')
% 右键保存图片
%     hImage2=image(ImageErosion);title('腐蚀')
  setappdata(0,'hAxes1ImageMor',hImage2);
   set(hImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
v=get(handles.slider2,'Value');
str=sprintf('%d',v);
set(handles.text5,'String',str);
 str2=str2double(str);
% setappdata(0,'str',v);
loadImage=getappdata(0,'BinaryImage');
if isempty(loadImage)
    loadImage=selectPicFunc();
end
% global I;
I=loadImage;

se=strel('square',(str2));%5*5的正方形结构元素
ImageDilate=imdilate(I,se);
axes(handles.axes3);
hImage3=imshow(ImageDilate);title('膨胀')

% 右键保存图片
%    hImage5=image(BW1);
  setappdata(0,'hAxes1ImageMor',hImage3);
   set(hImage3,'ButtonDownFcn',@axes3_ButtonDownFcn);


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --------------------------------------------------------------------
function Enhancement_Callback(hObject, eventdata, handles)
% hObject    handle to Enhancement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=gcf;
ImageEnhancement;
close(current);

% --------------------------------------------------------------------
function Segmentation_Callback(hObject, eventdata, handles)
% hObject    handle to Segmentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=gcf;
ImageSegmentation;
close(current);


% --------------------------------------------------------------------
function Transform_Callback(hObject, eventdata, handles)
% hObject    handle to Transform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=gcf;
DigitalImageProcessingDesign;
close(current);


% --------------------------------------------------------------------
function OpenBinaryPic_Callback(hObject, eventdata, handles)
% hObject    handle to OpenBinaryPic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global I;%设置全局变量I
try
[filename,pathname,~]=uigetfile({'*.bmp';'*.jpg';'*.png'},'选择图片');
%合成路径+文件名
str=[pathname filename]; 
 I=imread(str);
catch
   I=imread('BinaryDemo.bmp');  
end
 img=I;
axes(handles.axes1);
setappdata(0,'BinaryImage',img);
hImage1=imshow(img);
% 右键保存图片
setappdata(0,'hAxes1ImageMor',hImage1);
set(hImage1,'ButtonDownFcn',@axes1_ButtonDownFcn);



% --------------------------------------------------------------------
function OpenPic_Callback(hObject, eventdata, handles)
% hObject    handle to OpenPic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function BinaryHelp_Callback(hObject, eventdata, handles)
% hObject    handle to BinaryHelp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Help;


% --------------------------------------------------------------------
function AboutMe_Callback(hObject, eventdata, handles)
% hObject    handle to AboutMe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
About;

% --------------------------------------------------------------------
function CloseWindow_Callback(hObject, eventdata, handles)
% hObject    handle to CloseWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=gcf;
DigitalImageProcessingDesign;
close(current);


% --------------------------------------------------------------------
function EnhancementRK_Callback(hObject, eventdata, handles)
% hObject    handle to EnhancementRK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

current=gcf;
ImageEnhancement;
close(current);
% --------------------------------------------------------------------
function TransformRK_Callback(hObject, eventdata, handles)
% hObject    handle to TransformRK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

current=gcf;
DigitalImageProcessingDesign;
close(current);
% --------------------------------------------------------------------
function SegmentationRK_Callback(hObject, eventdata, handles)
% hObject    handle to SegmentationRK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=gcf;
ImageSegmentation;
close(current);


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
hImage=getappdata(0,'hAxes1ImageMor');
pic=getimage(hImage);
SaveImageFunc(pic);
catch
    
end



% --- Executes on mouse press over axes background.
function axes2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
hImage=getappdata(0,'hAxes2ImageMor');
pic=getimage(hImage);
SaveImageFunc(pic);
catch
    
end




% --- Executes on mouse press over axes background.
function axes3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
hImage=getappdata(0,'hAxes3ImageMor');
pic=getimage(hImage);
SaveImageFunc(pic);
catch
    
end



% --- Executes on mouse press over axes background.
function axes4_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
hImage=getappdata(0,'hAxes4ImageMor');
pic=getimage(hImage);
SaveImageFunc(pic);
catch
    
end



% --- Executes on mouse press over axes background.
function axes5_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


try
hImage=getappdata(0,'hAxes5ImageMor');
pic=getimage(hImage);
SaveImageFunc(pic);
catch
    
end


% --- Executes on mouse press over axes background.
function axes6_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
hImage=getappdata(0,'hAxes6ImageMor');
pic=getimage(hImage);
SaveImageFunc(pic);
catch
    
end
