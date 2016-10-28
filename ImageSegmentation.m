function varargout = ImageSegmentation(varargin)
% IMAGESEGMENTATION MATLAB code for ImageSegmentation.fig
%      IMAGESEGMENTATION, by itself, creates a new IMAGESEGMENTATION or raises the existing
%      singleton*.
%
%      H = IMAGESEGMENTATION returns the handle to a new IMAGESEGMENTATION or the handle to
%      the existing singleton*.
%
%      IMAGESEGMENTATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGESEGMENTATION.M with the given input arguments.
%
%      IMAGESEGMENTATION('Property','Value',...) creates a new IMAGESEGMENTATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImageSegmentation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImageSegmentation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImageSegmentation

% Last Modified by GUIDE v2.5 19-Jun-2016 20:20:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageSegmentation_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageSegmentation_OutputFcn, ...
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


% --- Executes just before ImageSegmentation is made visible.
function ImageSegmentation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImageSegmentation (see VARARGIN)

% Choose default command line output for ImageSegmentation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImageSegmentation wait for user response (see UIRESUME)
% uiwait(handles.figure1);
try
loadImage=getappdata(0,'Image');
if isempty(loadImage)
   loadImage=selectPicFunc();
end

axes(handles.axes1);
hImage1=imshow(loadImage);title('‘≠ÕºœÒ')
% ”“º¸±£¥ÊÕº∆¨
%    hImage5=image(BW1);
  setappdata(0,'hAxes1ImageIS',hImage1);
   set(hImage1,'ButtonDownFcn',@axes1_ButtonDownFcn);

catch
    
end


% --- Outputs from this function are returned to the command line.
function varargout = ImageSegmentation_OutputFcn(hObject, eventdata, handles) 
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
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% πÿ±’µ±«∞Õº–Œ¥∞ø⁄
current=gcf;
DigitalImageProcessingDesign;
close(current);

% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% [filename,pathname,~]=uigetfile({'*.jpg';'*.bmp';'*.png'},'—°‘ÒÕº∆¨');
% %∫œ≥…¬∑æ∂+Œƒº˛√˚
% str=[pathname filename]; 
% %∂¡»°Õº∆¨
% global I;%…Ë÷√»´æ÷±‰¡øI
%  I=imread(str); 
% % π”√µ⁄“ª∏ˆaxes 
% %œ‘ æÕº∆¨
% axes(handles.axes1);
% imshow(I);title('‘≠ÕºœÒ');
try
  loadImage=selectPicFunc();
if isempty(loadImage)
  loadImage=getappdata(0,'Image');
else  
   setappdata(0,'Image',loadImage); 
end

axes(handles.axes1);
hImage1=imshow(loadImage);title('‘≠ÕºœÒ')
% ”“º¸±£¥ÊÕº∆¨
%    hImage5=image(BW1);
  setappdata(0,'hAxes1ImageIS',hImage1);
   set(hImage1,'ButtonDownFcn',@axes1_ButtonDownFcn);
catch
    
end

% --------------------------------------------------------------------
function ImageSegmentation_Callback(hObject, eventdata, handles)
% hObject    handle to ImageSegmentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Thershold_Callback(hObject, eventdata, handles)
% hObject    handle to Thershold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  set(handles.axes2,'Visible','off');
    set(handles.axes3,'Visible','off');
 set(handles.axes4,'Visible','off');
    set(handles.axes5,'Visible','off');

% --------------------------------------------------------------------
function RegionGrowing_Callback(hObject, eventdata, handles)
% hObject    handle to RegionGrowing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
if isempty(loadImage)
   loadImage=selectPicFunc(); 
end
% global I;
myImage=loadImage;

image=myImage;
try
image=rgb2gray(image);
catch
    
end
J = regionGrow(image);

axes(handles.axes4);
hImage4=imshow(J);title(' «¯”ÚÃÓ≥‰');

% ”“º¸±£¥ÊÕº∆¨
%    hImage5=image(BW1);
  setappdata(0,'hAxes5ImageIS',hImage4);
   set(hImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);

% --------------------------------------------------------------------
function choose_Callback(hObject, eventdata, handles)
% hObject    handle to choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
if isempty(loadImage)
   loadImage=selectPicFunc(); 
end
% global I;
myImage=loadImage;

image=myImage;

[width,height]=size((myImage));
 image2=rgb2gray(image);
  axes(handles.axes2);
%  setappdata(handles.axes2,'img2','');
%  getappdata(handles.axes2,'img2');
 imhist(image2);

% prompt={'Input Name','fds'};
 title='«Î ‰»Î„–÷µ';
answer=inputdlg(title,'«Î ‰»Î„–÷µ');
answer2=str2num(answer{1});
for i=1:width
    for j=1:height
            
        if(image(i,j)<answer2)
            BW1(i,j)=0;
        else
             BW1(i,j)=1;
            
        end
            
    end
end
axes(handles.axes3);

  hImage3=imshow(BW1);
% title('»Àπ§—°‘Ò„–÷µ');
% ”“º¸±£¥ÊÕº∆¨
%    hImage3=image(BW1);
  setappdata(0,'hAxes3ImageIS',hImage3);
   set(hImage3,'ButtonDownFcn',@axes3_ButtonDownFcn);

% --------------------------------------------------------------------
function Otsu_Callback(hObject, eventdata, handles)
% hObject    handle to Otsu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
if isempty(loadImage)
   loadImage=selectPicFunc(); 
end
% global I;
myImage=loadImage;


image=myImage;
T2=graythresh(myImage);
BW2=im2bw(image,T2);
axes(handles.axes4);
hImage4=imshow(BW2);title(' OtsuÀ„∑®«Û„–÷µ');
% ”“º¸±£¥ÊÕº∆¨
%  hImage4=image(BW2);title('OtsuÀ„∑®«Û„–÷µ');
 setappdata(0,'hAxes4ImageIS',hImage4);
 set(hImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);


% --------------------------------------------------------------------
function diedai_Callback(hObject, eventdata, handles)
% hObject    handle to diedai (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
if isempty(loadImage)
   loadImage=selectPicFunc(); 
end
% global I;
myImage=loadImage;

image=myImage;
f=double(image);
T=(min(f(:))+max(f(:)))/2;
done=false;
i=0;
while ~done
    r1=find(f<=T);
    r2=find(f>T);
    Tnew=(mean(f(r1))+mean(f(r2)))/2;
    done=abs(Tnew-T)<1
    T=Tnew;
    i=i+1;
end
f(r1)=0;
f(r2)=1;
axes(handles.axes5);
hImage5=imshow(f);title(' µ¸¥˙∑®«Û„–÷µ');
% ”“º¸±£¥ÊÕº∆¨
%  hImage5=image(f);title('µ¸¥˙∑®«Û„–÷µ');
 setappdata(0,'hAxes5ImageIS',hImage5);
 set(hImage5,'ButtonDownFcn',@axes5_ButtonDownFcn);

% --------------------------------------------------------------------
function Roberts_Callback(hObject, eventdata, handles)
% hObject    handle to Roberts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
if isempty(loadImage)
   loadImage=selectPicFunc(); 
end
% global I;
myImage=loadImage;

image=rgb2gray(myImage);
bw1=edge(image,'roberts');
axes(handles.axes2);
hImage2=imshow(bw1);title('Roberts±ﬂ‘µÕº');
% ”“º¸±£¥ÊÕº∆¨
%  hImage2=image(bw1);title('Roberts±ﬂ‘µÕº');
 setappdata(0,'hAxes3ImageIS',hImage2);
 set(hImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);
 
 
% --------------------------------------------------------------------
function Sobel_Callback(hObject, eventdata, handles)
% hObject    handle to Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
if isempty(loadImage)
   loadImage=selectPicFunc(); 
end
% global I;
myImage=loadImage;

image=rgb2gray(myImage);
bw1=edge(image,'sobel');

axes(handles.axes3);
hImage3=imshow(bw1);title('Sobel±ﬂ‘µÕº');
% ”“º¸±£¥ÊÕº∆¨
%  hImage3=image(bw1);title('Sobel±ﬂ‘µÕº');
 setappdata(0,'hAxes3ImageIS',hImage3);
 set(hImage3,'ButtonDownFcn',@axes3_ButtonDownFcn);

% --------------------------------------------------------------------
function Laplacian_Callback(hObject, eventdata, handles)
% hObject    handle to Laplacian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
if isempty(loadImage)
   loadImage=selectPicFunc(); 
end
% global I;
myImage=loadImage;

image=rgb2gray(myImage);
bw1=edge(image,'log');

axes(handles.axes4);
hImage4=imshow(bw1);title('Log±ﬂ‘µÕº');
% ”“º¸±£¥ÊÕº∆¨
%  hImage4=image(bw1);title('Log±ﬂ‘µÕº');
 setappdata(0,'hAxes5ImageIS',hImage4);
 set(hImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);
 


% --------------------------------------------------------------------
function Kirsch_Callback(hObject, eventdata, handles)
% hObject    handle to Kirsch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

loadImage=getappdata(0,'Image');
if isempty(loadImage)
   loadImage=selectPicFunc(); 
end
% global I;
myImage=loadImage;
image=rgb2gray(myImage);
bw1=edge(image,'prewitt');
axes(handles.axes5);
hImage5=imshow(bw1);title('Prewitt±ﬂ‘µÕº');
% ”“º¸±£¥ÊÕº∆¨
%  hImage5=image(bw1);title('Prewitt±ﬂ‘µÕº');
 setappdata(0,'hAxes5ImageIS',hImage5)
 set(hImage5,'ButtonDownFcn',@axes5_ButtonDownFcn);


% --------------------------------------------------------------------
function Transform_Callback(hObject, eventdata, handles)
% hObject    handle to Transform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=gcf;
DigitalImageProcessingDesign;
close(current);


% --------------------------------------------------------------------
function Binary_Callback(hObject, eventdata, handles)
% hObject    handle to Binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=gcf;
Morphology;
close(current);


% --------------------------------------------------------------------
function Enhancement_Callback(hObject, eventdata, handles)
% hObject    handle to Enhancement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=gcf;
ImageEnhancement;
close(current);


% --------------------------------------------------------------------
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
About;

% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Help;

% --------------------------------------------------------------------
function ISR_Callback(hObject, eventdata, handles)
% hObject    handle to ISR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
hImage=getappdata(0,'hAxes1ImageIS');
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
hImage=getappdata(0,'hAxes2ImageIS');
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
hImage=getappdata(0,'hAxes3ImageIS');
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
hImage=getappdata(0,'hAxes4ImageIS');
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
hImage=getappdata(0,'hAxes5ImageIS');
pic=getimage(hImage);
SaveImageFunc(pic);
catch
    
end
