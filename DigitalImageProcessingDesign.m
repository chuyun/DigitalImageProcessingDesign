function varargout = DigitalImageProcessingDesign(varargin)
% DIGITALIMAGEPROCESSINGDESIGN MATLAB code for DigitalImageProcessingDesign.fig
%      DIGITALIMAGEPROCESSINGDESIGN, by itself, creates a new DIGITALIMAGEPROCESSINGDESIGN or raises the existing
%      singleton*.
%
%      H = DIGITALIMAGEPROCESSINGDESIGN returns the handle to a new DIGITALIMAGEPROCESSINGDESIGN or the handle to
%      the existing singleton*.
%
%      DIGITALIMAGEPROCESSINGDESIGN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIGITALIMAGEPROCESSINGDESIGN.M with the given input arguments.
%
%      DIGITALIMAGEPROCESSINGDESIGN('Property','Value',...) creates a new DIGITALIMAGEPROCESSINGDESIGN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DigitalImageProcessingDesign_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DigitalImageProcessingDesign_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DigitalImageProcessingDesign

% Last Modified by GUIDE v2.5 21-Jun-2016 08:55:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DigitalImageProcessingDesign_OpeningFcn, ...
                   'gui_OutputFcn',  @DigitalImageProcessingDesign_OutputFcn, ...
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



% --- Executes just before DigitalImageProcessingDesign is made visible.
function DigitalImageProcessingDesign_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DigitalImageProcessingDesign (see VARARGIN)

% Choose default command line output for DigitalImageProcessingDesign
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

 ShowProcessBarFunc();


% axes(handles.axes1);
% 
%  Image=imread('5.jpg'); %��ȡͼ��
%    hImage=image(Image); %��ʾͼ��ͬʱȡ��ͼ��ľ����handle��
% 
% % hImage=getappdata(1,'hAxes1');
% set(hImage,'ButtonDownFcn',@axes1_ButtonDownFcn); % ����ͼ������ButtonDown�ص�����Ϊ�Լ������myCallback
% % 

% Open_Callback(hObject, eventdata, handles);
% handles=guidata(hObject);



% --- Outputs from this function are returned to the command line.
function varargout = DigitalImageProcessingDesign_OutputFcn(hObject, eventdata, handles) 
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
try
picture=selectPicFunc();
catch
  picture=imread('Demo.jpg');
end
% [filename,pathname,~]=uigetfile({'*.jpg';'*.bmp';'*.png'},'ѡ��ͼƬ');
% %�ϳ�·��+�ļ���
% str=[pathname filename]; 
% %��ȡͼƬ
% if isempty(filename)
%     msgbox('û��ѡ��ͼƬ','��ʾ');
% end
% global I;%����ȫ�ֱ���I
%  I=imread(str); 
 setappdata(0,'Image',picture);
%ʹ�õ�һ��axes 
%��ʾͼƬ
axes(handles.axes1);
% haxes1=imshow(I);title('ԭͼ��');
 hImage=image(picture);
 title('ԭͼ��');setappdata(0,'hAxes1ImageMain',hImage);

 hImage1=getappdata(0,'hAxes1ImageMain');
 try
 set(hImage1,'ButtonDownFcn',@axes1_ButtonDownFcn); % ����ͼ������ButtonDown�ص�����Ϊ�Լ������myCallback
 catch
     
 end
 % % 


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
% �رյ�ǰͼ�δ���
close(gcf);
% ��Ҷ��
% --------------------------------------------------------------------
function Shutters_Callback(hObject, eventdata, handles)
% hObject    handle to Shutters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% ��Ҷ��
% --------------------------------------------------------------------
function ShuttersHorizontal_Callback(hObject, eventdata, handles)
% hObject    handle to ShuttersHorizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
g=ShuttersHorizontalFunc(loadImage);
axes(handles.axes3);
% imshow(uint8(g));

hImage3=image(uint8(g));
 setappdata(0,'hAxes3ImageMain',hImage3);
 set(hImage3,'ButtonDownFcn',@axes3_ButtonDownFcn);


% --------------------------------------------------------------------
function ShuttersVertical_Callback(hObject, eventdata, handles)
% hObject    handle to ShuttersVertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
g=ShuttersVerticalFunc(loadImage);
axes(handles.axes4);
% imshow(uint8(g));
% �Ҽ�����
hImage4=image(uint8(g));
 setappdata(0,'hAxes4ImageMain',hImage4);
 set(hImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);


% ?�ֿ���ʾ
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

% ѡ��ͼƬ �ؼ�
% --- Executes on button press in ChoosePic.
function ChoosePic_Callback(hObject, eventdata, handles)
% hObject    handle to ChoosePic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
picture=selectPicFunc();
catch
  picture=imread('Demo.jpg');
end
% [filename,pathname,~]=uigetfile({'*.jpg';'*.bmp';'*.png'},'ѡ��ͼƬ');
% %�ϳ�·��+�ļ���
% str=[pathname filename]; 
% %��ȡͼƬ
% if isempty(filename)
%     msgbox('û��ѡ��ͼƬ','��ʾ');
% end
% global I;%����ȫ�ֱ���I
%  I=imread(str); 
 setappdata(0,'Image',picture);
%ʹ�õ�һ��axes 
%��ʾͼƬ
axes(handles.axes1);
% haxes1=imshow(I);title('ԭͼ��');
 hImage=image(picture);
 title('ԭͼ��');setappdata(0,'hAxes1ImageMain',hImage);

 hImage1=getappdata(0,'hAxes1ImageMain');
 try
 set(hImage1,'ButtonDownFcn',@axes1_ButtonDownFcn); % ����ͼ������ButtonDown�ص�����Ϊ�Լ������myCallback
 catch
     
 end

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
% global I;%global ȫ�ֱ���
ImageX=getappdata(0,'Image');
% ImageX=imread('swift.jpg');
%  se = translate(strel(1), [tx ty]);%ƽ��ͼ��
% J = imdilate(ImageX,se);
%��������if ���ʵ��
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
% imshow(g);

 hImage2=image(g);
 setappdata(0,'hAxes2ImageMain',hImage2);

 hImage2=getappdata(0,'hAxes2ImageMain');
 try
 set(hImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);
 catch
     
 end

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
% imshow(rotateImage);


 hImage2=image(rotateImage);
 setappdata(0,'hAxes2ImageMain',hImage2);

 hImage2=getappdata(0,'hAxes2ImageMain');
 try
 set(hImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);
 catch
     
 end


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
% imshow(zoomImage);


 hImage2=image(zoomImage);
 setappdata(0,'hAxes2ImageMain',hImage2);

 hImage2=getappdata(0,'hAxes2ImageMain');
 try
 set(hImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);
 catch
     
 end



% --- Executes on button press in MirrorBtnUpDown.
function MirrorBtnUpDown_Callback(hObject, eventdata, handles)
% hObject    handle to MirrorBtnUpDown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
MirrorVImage = ImageMirrorVerticalFunc(loadImage);
% MirrorHImage = unit8(MirrorHImage);
axes(handles.axes2);
% imshow(MirrorVImage);

 hImage2=image(MirrorVImage);
 setappdata(0,'hAxes2ImageMain',hImage2);

 hImage2=getappdata(0,'hAxes2ImageMain');
 try
 set(hImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);
 catch
     
 end


% ת��
% --- Executes on button press in TransposeBtn.
function TransposeBtn_Callback(hObject, eventdata, handles)
% hObject    handle to TransposeBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

loadImage=getappdata(0,'Image');
transposeImage = permute(loadImage,[2 1 3]);
axes(handles.axes2);
% imshow(transposeImage);


 hImage2=image(transposeImage);
 setappdata(0,'hAxes2ImageMain',hImage2);

 hImage2=getappdata(0,'hAxes2ImageMain');
 try
 set(hImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);
 catch
     
 end


% ���Ҿ���
% --- Executes on button press in MirrorBtnLF.
function MirrorBtnLF_Callback(hObject, eventdata, handles)
% hObject    handle to MirrorBtnLF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
MirrorHImage = ImageMirrorHorizontalFunc(loadImage);
% MirrorHImage = unit8(MirrorHImage);
axes(handles.axes2);
% imshow(MirrorHImage);


 hImage2=image(MirrorHImage);
 setappdata(0,'hAxes2ImageMain',hImage2);

 hImage2=getappdata(0,'hAxes2ImageMain');
 try
 set(hImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);
 catch
     
 end

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

% set(handles.RotateEdit,'String',rotateEditValue);
set(handles.RotateEdit,'String',num2str(get(hObject,'Value')));

loadImage=getappdata(0,'Image');

rotateImage=imrotate(loadImage,rotateEditValue,'bilinear');

axes(handles.axes2);
% imshow(loadImage);
% imshow(rotateImage);


 hImage2=image(rotateImage);
 setappdata(0,'hAxes2ImageMain',hImage2);
try
  set(hImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);
catch
    
end

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

% set(handles.RotateEdit,'String',rotateEditValue);
set(handles.RotateSlider,'Value',str2num(get(hObject,'String')));
rotateEditValue=str2num(get(handles.RotateEdit,'String'));
loadImage=getappdata(0,'Image');

rotateImage=imrotate(loadImage,rotateEditValue,'bilinear');

axes(handles.axes2);
% imshow(loadImage);
% imshow(rotateImage);


 hImage2=image(rotateImage);
 setappdata(0,'hAxes2ImageMain',hImage2);
try
 set(hImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);
catch
    
end



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
if isempty(ZoomSliderValue)
    ZoomSliderValue=1
end
set(handles.ZoomEdit,'String',num2str(get(hObject,'Value')));

loadImage=getappdata(0,'Image');

zoomImage=imresize(loadImage,ZoomSliderValue,'nearest');
% rotateImage=imrotate(loadImage,ZoomValue,'bilinear');
% axes(handles.axes2);
% imshow(loadImage);
figure(1);
% imshow(zoomImage);


 hImage2=image(zoomImage);
 setappdata(0,'hAxes2ImageMain',hImage2);

 hImage2=getappdata(0,'hAxes2ImageMain');
 try
 set(hImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);
 catch
     
 end


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
% set(handles.ZoomSlider,'Value',str2num(hObject,'String'));


loadImage=getappdata(0,'Image');

zoomImage=imresize(loadImage,zoomEditValue,'nearest');
% rotateImage=imrotate(loadImage,ZoomValue,'bilinear');
% axes(handles.axes2);
% imshow(loadImage);
figure(1);
% imshow(zoomImage);


 hImage2=image(zoomImage);
 setappdata(0,'hAxes2ImageMain',hImage2);

 hImage2=getappdata(0,'hAxes2ImageMain');
 try
 set(hImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);
 catch
     
 end
 

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


% --------------------------------------------------------------------
function MenuR_Callback(hObject, eventdata, handles)
% hObject    handle to MenuR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
% function SaveFirst_Callback(hObject, eventdata, handles)
% hObject    handle to SaveFirst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 
% c=uicontrol(gca,'style','text','String','SaveFirst');
% uicontrol(c);

%  set(gcf,'CurrentAxes',handles.axes1);           %������Ҫ�����axes
%   pic=getimage(gca) 
%   set(handles.axes1,'UIContextMenu','CavePic');
%   [x,y,w,h]=get(handles.axes1,'Position',[x,y,width,height])
%   
%   
% [filename,pathname]=uiputfile('*.jpg','������ͼ������');
% pathfile=[pathname filename];
% imwrite(pic,pathfile,'jpeg')

% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Enhancement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
imshow(loadImage);



% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
 function axes1_ButtonDownFcn(hObject, eventdata, handles)
 % hObject    handle to axes1 (see GCBO)
 % eventdata  reserved - to be defined in a future version of MATLAB
 % handles    structure with handles and user data (see GUIDATA)

hImage=getappdata(0,'hAxes1ImageMain');
pic=getimage(hImage);
SaveImageFunc(pic);


% --- Executes on mouse press over axes background.
function axes2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
hImage=getappdata(0,'hAxes2ImageMain');
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
hImage=getappdata(0,'hAxes3ImageMain');
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
hImage=getappdata(0,'hAxes4ImageMain');
pic=getimage(hImage);
SaveImageFunc(pic);
catch
    
end


% --------------------------------------------------------------------
function Other_Callback(hObject, eventdata, handles)
% hObject    handle to Other (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Shutter_Callback(hObject, eventdata, handles)
% hObject    handle to Shutter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function AeroGlass_Callback(hObject, eventdata, handles)
% hObject    handle to AeroGlass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadimage=getappdata(0,'Image');
n=get(handles.AeroGlassSlider,'Value');
if isempty(n)
   n=10; 
end
aeroImage=AeroGlassFunc(loadimage,n);

axes(handles.axes4);
hImage4=image(aeroImage);
 setappdata(0,'hAxes4ImageMain',hImage4);
 try
 set(hImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);
 catch
     
 end


% --------------------------------------------------------------------

% --- Executes on slider movement.
function AeroGlassSlider_Callback(hObject, eventdata, handles)
% hObject    handle to AeroGlassSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
loadimage=getappdata(0,'Image');
n=get(handles.AeroGlassSlider,'Value');
% set(handles.AeroGlassEdit,'String',n);
set(handles.AeroGlassEdit,'String',num2str(get(hObject,'Value')));
aeroImage=AeroGlassFunc(loadimage,n);

axes(handles.axes4);
hImage4=image(aeroImage);
 setappdata(0,'hAxes4ImageMain',hImage4);
 try
 set(hImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);
 catch
     
 end
 


% --- Executes during object creation, after setting all properties.
function AeroGlassSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AeroGlassSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function AeroGlassEdit_Callback(hObject, eventdata, handles)
% hObject    handle to AeroGlassEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AeroGlassEdit as text
%        str2double(get(hObject,'String')) returns contents of AeroGlassEdit as a double

set(handles.AeroGlassSlider,'Value',str2num(get(hObject,'String')));

loadimage=getappdata(0,'Image');
n=str2num(get(handles.AeroGlassEdit,'String'));
% set(handles.AeroGlassSlider,'Value',n);
aeroImage=AeroGlassFunc(loadimage,n);

axes(handles.axes4);
hImage4=image(aeroImage);
 setappdata(0,'hAxes4ImageMain',hImage4);
 try
 set(hImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);
 catch
     
 end

% --- Executes during object creation, after setting all properties.
function AeroGlassEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AeroGlassEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function Moscia_Callback(hObject, eventdata, handles)
% hObject    handle to MosaicSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function MosaicSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MosaicSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function MosaicEdit_Callback(hObject, eventdata, handles)
% hObject    handle to MosaicEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MosaicEdit as text
%        str2double(get(hObject,'String')) returns contents of MosaicEdit as a double
set(handles.MosaicSlider,'Value',str2num(get(hObject,'String')));

n=str2num(get(handles.MosaicEdit,'String'));
%  set(handles.MosaicEdit,'String',num2str(get(hObject,'Value')));
 m=get(handles.MosaicMSlider,'Value');
 if isempty(n)
     n=12;
 end
 if isempty(m)
     m=128;
 end

loadImage=getappdata(0,'Image');
MosciaImage=MosciaFunc(loadImage,n,m);

axes(handles.axes4);
hImage4=image(MosciaImage);
 setappdata(0,'hAxes4ImageMain',hImage4);
 try
 set(hImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);
 catch
     
 end

% --- Executes during object creation, after setting all properties.
function MosaicEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MosaicEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% ������Slider
% --- Executes on slider movement.
function MosaicSlider_Callback(hObject, eventdata, handles)
% hObject    handle to MosaicSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

 n=get(handles.MosaicSlider,'Value');
 set(handles.MosaicEdit,'String',num2str(get(hObject,'Value')));
 m=get(handles.MosaicMSlider,'Value');
 if isempty(n)
     n=12;
 end
 if isempty(m)
     m=128;
 end

loadImage=getappdata(0,'Image');
MosciaImage=MosciaFunc(loadImage,n,m);

axes(handles.axes4);
hImage4=image(MosciaImage);
 setappdata(0,'hAxes4ImageMain',hImage4);
 try
 set(hImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);
catch

 end
 
% --- Executes on slider movement.
function MosaicMSlider_Callback(hObject, eventdata, handles)
% hObject    handle to MosaicMSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.MosciaMEdit,'String',num2str(get(hObject,'Value')));

n=(get(handles.MosaicSlider,'Value'));
m=get(handles.MosaicMSlider,'Value');
 if isempty(n)
     n=12;
 end
 if isempty(m)
     m=128;
 end

loadImage=getappdata(0,'Image');
MosciaImage=MosciaFunc(loadImage,n,m);

axes(handles.axes4);
hImage4=image(MosciaImage);
 setappdata(0,'hAxes4ImageMain',hImage4);
 try
 set(hImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);
 catch

 end

function MosciaMEdit_Callback(hObject, eventdata, handles)
% hObject    handle to MosciaMEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MosciaMEdit as text
%        str2double(get(hObject,'String')) returns contents of MosciaMEdit as a double
set(handles.MosaicMSlider,'Value',str2num(get(hObject,'String')));

 n=str2num(get(handles.MosaicEdit,'String'));
%  set(handles.MosaicEdit,'String',num2str(get(hObject,'Value')));
 m=str2num(get(handles.MosciaMEdit,'String'));
 if isempty(n)
     n=12;
 end
 if isempty(m)
     m=128;
 end

loadImage=getappdata(0,'Image');
MosciaImage=MosciaFunc(loadImage,n,m);

axes(handles.axes4);
hImage4=image(MosciaImage);
 setappdata(0,'hAxes4ImageMain',hImage4);
 try
 set(hImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);
 catch
     
 end
 



% --- Executes during object creation, after setting all properties.
function MosciaMEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MosciaMEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function MosaicMSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MosaicMSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function MosaicMenu_Callback(hObject, eventdata, handles)
% hObject    handle to MosaicMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=(get(handles.MosaicSlider,'Value'));

 m=get(handles.MosaicMSlider,'Value');
 if isempty(n)
     n=12;
 end
 if isempty(m)
     m=128;
 end

loadImage=getappdata(0,'Image');
MosciaImage=MosciaFunc(loadImage,n,m);

axes(handles.axes4);
hImage4=image(MosciaImage);
 setappdata(0,'hAxes4ImageMain',hImage4);
 try
 set(hImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);
 catch
     
 end

% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Segmentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% ShowProcessBarFunc();


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
