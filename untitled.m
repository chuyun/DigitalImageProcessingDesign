function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 18-Jun-2016 01:34:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% % 显示进度条
% steps=100;
% hwait=waitbar(0,'请等待...');
% for k=1:steps
%     if steps-k<=5
%         waitbar(k/steps,hwait,'即将完成');
% %          pause(0.05);
%     else
%         str=['资源加载中...',num2str(k),'%'];
%         waitbar(k/steps,hwait,str);
% %          pause(0.05);
%     end
% end
% close(hwait); % 必须添加close函数

% ShowProcessBarFunc();

% 

% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
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
function Transform_Callback(hObject, eventdata, handles)
% hObject    handle to Transform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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

 h=gcf;
 ImageSegmentation;
%  hidden(h);
close(h);


% --------------------------------------------------------------------
function Binary_Callback(hObject, eventdata, handles)
% hObject    handle to Binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=gcf;
Morphology;
close(current);


% --------------------------------------------------------------------
function Translation_Callback(hObject, eventdata, handles)
% hObject    handle to Translation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Zoom_Callback(hObject, eventdata, handles)
% hObject    handle to Zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function Rotate_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Mirror_Callback(hObject, eventdata, handles)
% hObject    handle to Mirror (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Transpose_Callback(hObject, eventdata, handles)
% hObject    handle to Transpose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Special_Callback(hObject, eventdata, handles)
% hObject    handle to Special (see GCBO)
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
 setappdata(0,'Image',I);
%使用第一个axes 
%显示图片
axes(handles.axes1);
imshow(I);title('原图像');



% --------------------------------------------------------------------
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=gcf;
TransformUI;
close(h);


% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 关闭当前图形窗口
close(gcf);
% 百叶窗
% --------------------------------------------------------------------
function Shutters_Callback(hObject, eventdata, handles)
% hObject    handle to Shutters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 百叶窗
% --------------------------------------------------------------------
function ShuttersHorizontal_Callback(hObject, eventdata, handles)
% hObject    handle to ShuttersHorizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
ShuttersHorizontalFunc(loadImage);

% --------------------------------------------------------------------
function ShuttersVertical_Callback(hObject, eventdata, handles)
% hObject    handle to ShuttersVertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
ShuttersVerticalFunc(loadImage);


% ?分块显示
% --------------------------------------------------------------------
function BlockDisplay_Callback(hObject, eventdata, handles)
% hObject    handle to BlockDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');

BlockDisplayFunc(loadImage);


% --------------------------------------------------------------------
function Inflation_Callback(hObject, eventdata, handles)
% hObject    handle to Inflation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Corrosion_Callback(hObject, eventdata, handles)
% hObject    handle to Corrosion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenOperation_Callback(hObject, eventdata, handles)
% hObject    handle to OpenOperation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CloseOperation_Callback(hObject, eventdata, handles)
% hObject    handle to CloseOperation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function EdgeDetection_Callback(hObject, eventdata, handles)
% hObject    handle to EdgeDetection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ThresholdSegmentation_Callback(hObject, eventdata, handles)
% hObject    handle to ThresholdSegmentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function AirspaceEnhancement_Callback(hObject, eventdata, handles)
% hObject    handle to AirspaceEnhancement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FrequencyEnhance_Callback(hObject, eventdata, handles)
% hObject    handle to FrequencyEnhance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ColorEnhancement_Callback(hObject, eventdata, handles)
% hObject    handle to ColorEnhancement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function PseudoColor_Callback(hObject, eventdata, handles)
% hObject    handle to PseudoColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FalseColor_Callback(hObject, eventdata, handles)
% hObject    handle to FalseColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function NatureColor_Callback(hObject, eventdata, handles)
% hObject    handle to NatureColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function LPF_Callback(hObject, eventdata, handles)
% hObject    handle to LPF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function HPF_Callback(hObject, eventdata, handles)
% hObject    handle to HPF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ContrastRaise_Callback(hObject, eventdata, handles)
% hObject    handle to ContrastRaise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ContrastReduce_Callback(hObject, eventdata, handles)
% hObject    handle to ContrastReduce (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function BrightnessRaise_Callback(hObject, eventdata, handles)
% hObject    handle to BrightnessRaise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function BrightnessReduce_Callback(hObject, eventdata, handles)
% hObject    handle to BrightnessReduce (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Invert_Callback(hObject, eventdata, handles)
% hObject    handle to Invert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function GrayStretch_Callback(hObject, eventdata, handles)
% hObject    handle to GrayStretch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ChangedEqualization_Callback(hObject, eventdata, handles)
% hObject    handle to ChangedEqualization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function MeanFilter_Callback(hObject, eventdata, handles)
% hObject    handle to MeanFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function MedianFilter_Callback(hObject, eventdata, handles)
% hObject    handle to MedianFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Interactive_Callback(hObject, eventdata, handles)
% hObject    handle to Interactive (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Iteration_Callback(hObject, eventdata, handles)
% hObject    handle to Iteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Roberts_Callback(hObject, eventdata, handles)
% hObject    handle to Roberts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Sobel_Callback(hObject, eventdata, handles)
% hObject    handle to Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Laplacian_Callback(hObject, eventdata, handles)
% hObject    handle to Laplacian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Help;

% 选择图片 控件
% --- Executes on button press in ChoosePic.
function ChoosePic_Callback(hObject, eventdata, handles)
% hObject    handle to ChoosePic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname,~]=uigetfile({'*.jpg';'*.bmp';'*.png'},'选择图片');
%合成路径+文件名
str=[pathname filename]; 
%读取图片
global I;%设置全局变量I
 I=imread(str); 
  setappdata(0,'Image',I);
%使用第一个axes 
%显示图片
axes(handles.axes1);
imshow(I);title('原图像');


% --- Executes on button press in TranslationBtn.
function TranslationBtn_Callback(hObject, eventdata, handles)
% hObject    handle to TranslationBtn (see GCBO)
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



% --- Executes on button press in RotateBtn.
function RotateBtn_Callback(hObject, eventdata, handles)
% hObject    handle to RotateBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rotateValue=str2num(get(handles.RotateEdit,'String'));
if isempty(rotateValue)
   rotateValue=0;
end

loadImage=getappdata(0,'Image');

rotateImage=imrotate(loadImage,rotateValue,'bilinear');

axes(handles.axes2);
% imshow(loadImage);
imshow(rotateImage);

% --- Executes on button press in ZoomBtn.
function ZoomBtn_Callback(hObject, eventdata, handles)
% hObject    handle to ZoomBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zoomValue=str2num(get(handles.ZoomEdit,'String'));
if isempty(zoomValue)
    zoomValue=1;
end
    
loadImage=getappdata(0,'Image');

zoomImage=imresize(loadImage,zoomValue,'nearest');
% rotateImage=imrotate(loadImage,ZoomValue,'bilinear');
% axes(handles.axes2);
% imshow(loadImage);
figure(1);
imshow(zoomImage);


% --- Executes on button press in MirrorBtnUpDown.
function MirrorBtnUpDown_Callback(hObject, eventdata, handles)
% hObject    handle to MirrorBtnUpDown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
MirrorVImage = ImageMirrorVerticalFunc(loadImage);
% MirrorHImage = unit8(MirrorHImage);
axes(handles.axes2);
imshow(MirrorVImage);

% 转置
% --- Executes on button press in TransposeBtn.
function TransposeBtn_Callback(hObject, eventdata, handles)
% hObject    handle to TransposeBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

loadImage=getappdata(0,'Image');
transposeImage = permute(loadImage,[2 1 3]);
axes(handles.axes2);
imshow(transposeImage);

% 左右镜像
% --- Executes on button press in MirrorBtnLF.
function MirrorBtnLF_Callback(hObject, eventdata, handles)
% hObject    handle to MirrorBtnLF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
MirrorHImage = ImageMirrorHorizontalFunc(loadImage);
% MirrorHImage = unit8(MirrorHImage);
axes(handles.axes2);
imshow(MirrorHImage);

% --- Executes on slider movement.


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


% --- Executes on slider movement.
function RotateSlider_Callback(hObject, eventdata, handles)
% hObject    handle to RotateSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% value=get(handles.RotateSlider,'Value');
% set(handles.RotateEdit,'String',value);
rotateEditValue=(get(handles.RotateSlider,'Value'));
if isempty(rotateEditValue)
    rotateEditValue=0;
end

set(handles.RotateEdit,'String',rotateEditValue);

loadImage=getappdata(0,'Image');

rotateImage=imrotate(loadImage,rotateEditValue,'bilinear');

axes(handles.axes2);
% imshow(loadImage);
imshow(rotateImage);


% --- Executes during object creation, after setting all properties.
function RotateSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RotateSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function RotateEdit_Callback(hObject, eventdata, handles)
% hObject    handle to RotateEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RotateEdit as text
%        str2double(get(hObject,'String')) returns contents of RotateEdit as a double



% --- Executes during object creation, after setting all properties.
function RotateEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RotateEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function ZoomSlider_Callback(hObject, eventdata, handles)
% hObject    handle to ZoomSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
ZoomSliderValue=(get(handles.ZoomSlider,'Value'));
set(handles.ZoomEdit,'String',num2str(ZoomSliderValue));


% --- Executes during object creation, after setting all properties.
function ZoomSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ZoomSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function ZoomEdit_Callback(hObject, eventdata, handles)
% hObject    handle to ZoomEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ZoomEdit as text
%        str2double(get(hObject,'String')) returns contents of ZoomEdit as a double

zoomEditValue=str2num(get(handles.ZoomEdit,'String'));
set(handles.ZoomSlider,'Value',zoomEditValue);

% --- Executes during object creation, after setting all properties.
function ZoomEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ZoomEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
About;
