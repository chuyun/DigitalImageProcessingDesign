function varargout = ImageEnhancement(varargin)
% IMAGEENHANCEMENT MATLAB code for ImageEnhancement.fig
%      IMAGEENHANCEMENT, by itself, creates a new IMAGEENHANCEMENT or raises the existing
%      singleton*.
%
%      H = IMAGEENHANCEMENT returns the handle to a new IMAGEENHANCEMENT or the handle to
%      the existing singleton*.
%
%      IMAGEENHANCEMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEENHANCEMENT.M with the given input arguments.
%
%      IMAGEENHANCEMENT('Property','Value',...) creates a new IMAGEENHANCEMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImageEnhancement_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImageEnhancement_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImageEnhancement

% Last Modified by GUIDE v2.5 19-Jun-2016 16:51:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageEnhancement_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageEnhancement_OutputFcn, ...
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


% --- Executes just before ImageEnhancement is made visible.
function ImageEnhancement_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImageEnhancement (see VARARGIN)

% Choose default command line output for ImageEnhancement
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImageEnhancement wait for user response (see UIRESUME)
% uiwait(handles.figure1);

loadImage=getappdata(0,'Image');
if isempty(loadImage)
    try
    loadImage=selectPicFunc();
    catch
        
    end
end

axes(handles.axes1);
% imshow(loadImage);title('原始图像');


 hIEImage1=image(loadImage);title('原始图像');
 setappdata(0,'hAxes1ImageIE',hIEImage1);

 hIEImage1=getappdata(0,'hAxes1ImageIE');
 set(hIEImage1,'ButtonDownFcn',@axes1_ButtonDownFcn);


% --- Outputs from this function are returned to the command line.
function varargout = ImageEnhancement_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 val=get(handles.popupmenu1,'Value');
 
 loadImage=getappdata(0,'Image');
if isempty(loadImage)
    loadImage=selectPicFunc();
end

% global ImageX;
ImageX=loadImage;

switch val
    case 2
        %均值滤波        
        img=rgb2gray(ImageX);
        img=ImageX;
       img_noise=(imnoise(img,'salt & pepper',0.06));
         axes(handles.axes2);
%         imshow(img_noise),
         hIEImage2=image(img_noise);title('加椒盐噪声后的图像');
 setappdata(0,'hAxes2ImageIE',hIEImage2);

 hIEImage2=getappdata(0,'hAxes2ImageIE');
 set(hIEImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);

        
       img_smoothed=imfilter(img_noise,fspecial('average',5));
       axes(handles.axes5);
       imshow(img_smoothed);
        hIEImage5=image(img_smoothed);title('均值滤波后的图像');
 setappdata(0,'hAxes5ImageIE',hIEImage5);

 hIEImage5=getappdata(0,'hAxes5ImageIE');
 set(hIEImage5,'ButtonDownFcn',@axes5_ButtonDownFcn);
      
    case 3
   
  %中值滤波
   myImage=getappdata(0,'Image');
             img=rgb2gray(myImage);
%          img=ImageX;
       img_noise=(imnoise(img,'salt & pepper',0.06));
        axes(handles.axes2);
       hIEImage2=imshow(img_noise),title('加椒盐噪声后的图像');
       setappdata(0,'hAxes2ImageIE',hIEImage2);
         set(hIEImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);
        
        img_smooth=medfilt2(img_noise,[3,3]);%中值滤波
        axes(handles.axes5);
      hIEImage5=imshow(img_smooth);title('中值滤波后的图像');
       setappdata(0,'hAxes5ImageIE',hIEImage5);
         set(hIEImage5,'ButtonDownFcn',@axes5_ButtonDownFcn);
       
       
    case 4
       %锐化滤波
       % 基于Robert交叉梯度的图像锐化
I=rgb2gray(ImageX);

% I = imread('bacteria.bmp');
I = double(I); % 转换为double型，这样可以保存负值，否则uint8型会把负值截掉
w1 = [-1 0; 0 1];
w2 = [0 -1; 1 0];
G1 =  imfilter(I, w1, 'corr', 'replicate'); % 以重复方式填充边界
G2 =  imfilter(I, w2, 'corr', 'replicate');
G = abs(G1) + abs(G2); % 计算Robert梯度 
 axes(handles.axes2);
       imshow(G,[]);title('基于Robert交叉梯度的图像锐化');

    case 5
        % 基于Sobel梯度的图像锐化
I=rgb2gray( ImageX);

% I = imread('bacteria.bmp'); %读入原图像
w1 = fspecial('sobel') %得到水平sobel模板
w2 = w1' %转置得到竖直soble模板
G1 =  imfilter(I, w1); %水平Sobel梯度
G2 =  imfilter(I, w2); %竖直Sobel梯度
G = abs(G1) + abs(G2); %Sobel梯度
 axes(handles.axes2);
%        imshow(G,[]);
        hIEImage2=image(G);title('基于Sobel梯度的图像锐化');
 setappdata(0,'hAxes2ImageIE',hIEImage2);

 hIEImage2=getappdata(0,'hAxes2ImageIE');
 set(hIEImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);

    case 6
        
 % 基于3种拉普拉斯模板的滤波 
I=rgb2gray( ImageX);
I = double(I);
w1 = [0 -1 0; -1 4 -1; 0 -1 0];
L1 = imfilter(I, w1, 'corr', 'replicate');
w2 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
L2 = imfilter(I, w2, 'corr', 'replicate');

 axes(handles.axes5);
   imshow(abs(L1),[]);title('基于W1模板的普拉斯锐化');
    
   

w3 = [1 4 1; 4 -20 4; 1 4 1];
L3 = imfilter(I, w3, 'corr', 'replicate');
axes(handles.axes3);
       imshow(abs(L3), []);title('基于W3模板的普拉斯锐化')
       
end

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

val2=get(handles.popupmenu2,'Value');

 loadImage=getappdata(0,'Image');
if isempty(loadImage)
    loadImage=selectPicFunc();
end

% global ImageX;
ImageX=loadImage;
switch val2
%    
    case 2
%         低通滤波
        I=(ImageX);
        I1=fftshift(fft2(I));
        [M,N]=size(I1);
        n=2;d0=30;
        n1=floor(M/2);
        n2=floor(N/2);
        for i=1:M
            for j=1:N
             d=sqrt((i-n1)^2+(j-n2)^2);
             H=1/(1+(d/d0)^(2*n));
                I2(i,j)=H*I1(i,j);
            end
        end
        
        I2=ifftshift(I2);
        I3=real(ifft2(I2));
         axes(handles.axes3);

%         imshow(I3,[]);
         hIEImage3=image(I3);
 setappdata(0,'hAxes3ImageIE',hIEImage3);

 hIEImage3=getappdata(0,'hAxes3ImageIE');
 set(hIEImage3,'ButtonDownFcn',@axes3_ButtonDownFcn);
    
    case 3
%         高通滤波
I=(ImageX);
        I1=fftshift(fft2(I));
        [M,N]=size(I1);
        n=2;d0=30;
        n1=floor(M/2);
        n2=floor(N/2);
        for i=1:M
            for j=1:N
             d=sqrt((i-n1)^2+(j-n2)^2);
             H=1/(1+(d0/d)^(2*n));
                I2(i,j)=H*I1(i,j);
            end
        end
        
        I2=ifftshift(I2);
        I3=real(ifft2(I2));
         axes(handles.axes3);

%         imshow(I3,[]);
    hIEImage3=image(I3);
 setappdata(0,'hAxes3ImageIE',hIEImage3);

 hIEImage3=getappdata(0,'hAxes3ImageIE');
 set(hIEImage3,'ButtonDownFcn',@axes3_ButtonDownFcn);
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
val3=get(handles.popupmenu3,'Value');
 loadImage=getappdata(0,'Image');
if isempty(loadImage)
    loadImage=selectPicFunc();
end

% global ImageX;
ImageX=loadImage;

switch val3
    
    case 2
        I =rgb2gray (ImageX);
[m,n] = size(I);
J = double(I);
L = 256;
for i = 1:m
    for j = 1:n
        if J(i,j) < L/4
            R(i,j) = 0;
            G(i,j) = 4*J(i,j);
            B(i,j) = L;
        elseif J(i,j) < L/2
            R(i,j) = 0;
            G(i,j) = L;
            B(i,j) = -4*(J(i,j)-L/2);
        elseif J(i,j) < 3*L/4
            R(i,j) = 4*(J(i,j)-L/2);
            G(i,j) = L;
            B(i,j) = 0;
        else 
            R(i,j) = L;
            G(i,j) = -4*(J(i,j)-L);
            B(i,j) = 0;
        end
    end
end
image2 = repmat(I,[1 1 3]);
for i = 1:m
    for j = 1:n
        image2(i,j,1) = R(i,j);
        image2(i,j,2) = G(i,j);
        image2(i,j,3) = B(i,j);
    end
end
 axes(handles.axes4);
% imshow(image2);
 hIEImage4=image(image2); title('伪色彩增强图像');
 setappdata(0,'hAxes4ImageIE',hIEImage4);

 hIEImage4=getappdata(0,'hAxes4ImageIE');
 set(hIEImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);
    case 3
%        假彩色增强
  I =rgb2gray (ImageX);
[size1_I,size2_I]=size(I);
M=im2double(I);%
D1=M;
FF=fft2(M);
FF=fftshift(FF);
H2=ones(size1_I,size2_I);
H2(round(size1_I/2)-3:round(size1_I/2)+3,round(size2_I/2)-3:round(size2_I/2)+3)=-1;%
C2=H2.*FF;
D2=ifft2(C2);
D2=abs(D2);
G(:,:,1)=M;
G(:,:,2)=D1;
G(:,:,3)=D2;
axes(handles.axes4);
% imshow(G);
 hIEImage4=image(G);title('假色彩增强图像');
 setappdata(0,'hAxes4ImageIE',hIEImage4);

 hIEImage4=getappdata(0,'hAxes4ImageIE');
 set(hIEImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);

    case 4
%         真彩色图像增强
   X=ImageX;
   X(:,:,1)= X(:,:,1)+30;
   X(:,:,2)= X(:,:,2)-30;
   X(:,:,3)= X(:,:,3)+20;
   
       axes(handles.axes4);
% imshow(X);
 hIEImage4=image(X);title('真色彩增强图像');
 setappdata(0,'hAxes4ImageIE',hIEImage4);

 hIEImage4=getappdata(0,'hAxes4ImageIE');
 set(hIEImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);
        
end
        
% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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
current=gcf;
DigitalImageProcessingDesign;
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
function Binary_Callback(hObject, eventdata, handles)
% hObject    handle to Binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=gcf;
Morphology;
close(current);

% --------------------------------------------------------------------
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=gcf;
DigitalImageProcessingDesign;
close(current);

% --------------------------------------------------------------------
function Enhancement_Callback(hObject, eventdata, handles)
% hObject    handle to Enhancement (see GCBO)
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

loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end
set(handles.popupmenu3,'Value',2);
% global ImageX;
ImageX=loadImage;
I =rgb2gray (ImageX);
[m,n] = size(I);
J = double(I);
L = 256;
for i = 1:m
    for j = 1:n
        if J(i,j) < L/4
            R(i,j) = 0;
            G(i,j) = 4*J(i,j);
            B(i,j) = L;
        elseif J(i,j) < L/2
            R(i,j) = 0;
            G(i,j) = L;
            B(i,j) = -4*(J(i,j)-L/2);
        elseif J(i,j) < 3*L/4
            R(i,j) = 4*(J(i,j)-L/2);
            G(i,j) = L;
            B(i,j) = 0;
        else 
            R(i,j) = L;
            G(i,j) = -4*(J(i,j)-L);
            B(i,j) = 0;
        end
    end
end
image2 = repmat(I,[1 1 3]);
for i = 1:m
    for j = 1:n
        image2(i,j,1) = R(i,j);
        image2(i,j,2) = G(i,j);
        image2(i,j,3) = B(i,j);
    end
end
 axes(handles.axes4);
% imshow(image2);
 hIEImage4=image(image2); title('伪色彩增强图像');
 setappdata(0,'hAxes4ImageIE',hIEImage4);

 hIEImage4=getappdata(0,'hAxes4ImageIE');
 set(hIEImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);
    

% --------------------------------------------------------------------
function FalseColor_Callback(hObject, eventdata, handles)
% hObject    handle to FalseColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end

% global ImageX;
ImageX=loadImage;
set(handles.popupmenu3,'Value',3);
%        假彩色增强
  I =rgb2gray (ImageX);
[size1_I,size2_I]=size(I);
M=im2double(I);%
D1=M;
FF=fft2(M);
FF=fftshift(FF);
H2=ones(size1_I,size2_I);
H2(round(size1_I/2)-3:round(size1_I/2)+3,round(size2_I/2)-3:round(size2_I/2)+3)=-1;%
C2=H2.*FF;
D2=ifft2(C2);
D2=abs(D2);
G(:,:,1)=M;
G(:,:,2)=D1;
G(:,:,3)=D2;
axes(handles.axes4);
% imshow(G);
 hIEImage4=image(G);title('假色彩增强图像');
 setappdata(0,'hAxes4ImageIE',hIEImage4);

 hIEImage4=getappdata(0,'hAxes4ImageIE');
 set(hIEImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);

% --------------------------------------------------------------------
function NatureColor_Callback(hObject, eventdata, handles)
% hObject    handle to NatureColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end

% global ImageX;
X=loadImage;
%         真彩色图像增强
  
set(handles.popupmenu3,'Value',4);
   X(:,:,1)= X(:,:,1)+30;
   X(:,:,2)= X(:,:,2)-30;
   X(:,:,3)= X(:,:,3)+20;
   
       axes(handles.axes4);
% imshow(X);
 hIEImage4=image(X);title('真色彩增强图像');
 setappdata(0,'hAxes4ImageIE',hIEImage4);

 hIEImage4=getappdata(0,'hAxes4ImageIE');
 set(hIEImage4,'ButtonDownFcn',@axes4_ButtonDownFcn);


% --------------------------------------------------------------------
function LPF_Callback(hObject, eventdata, handles)
% hObject    handle to LPF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end

% global ImageX;

set(handles.popupmenu2,'Value',2);
ImageX=loadImage;
%         低通滤波
        I=(ImageX);
        I1=fftshift(fft2(I));
        [M,N]=size(I1);
        n=2;d0=30;
        n1=floor(M/2);
        n2=floor(N/2);
        for i=1:M
            for j=1:N
             d=sqrt((i-n1)^2+(j-n2)^2);
             H=1/(1+(d/d0)^(2*n));
                I2(i,j)=H*I1(i,j);
            end
        end
        
        I2=ifftshift(I2);
        I3=real(ifft2(I2));
        axes(handles.axes3);

%         imshow(I3,[]);
     hIEImage3=image(I3);
 setappdata(0,'hAxes3ImageIE',hIEImage3);

 hIEImage3=getappdata(0,'hAxes3ImageIE');
 set(hIEImage3,'ButtonDownFcn',@axes3_ButtonDownFcn);


% --------------------------------------------------------------------
function HPF_Callback(hObject, eventdata, handles)
% hObject    handle to HPF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end
set(handles.popupmenu2,'Value',3);
% global ImageX;
ImageX=loadImage;
I=(ImageX);
        I1=fftshift(fft2(I));
        [M,N]=size(I1);
        n=2;d0=30;
        n1=floor(M/2);
        n2=floor(N/2);
        for i=1:M
            for j=1:N
             d=sqrt((i-n1)^2+(j-n2)^2);
             H=1/(1+(d0/d)^(2*n));
             I2(i,j)=H*I1(i,j);
            end
        end
        
        I2=ifftshift(I2);
        I3=real(ifft2(I2));
        axes(handles.axes3);

%         imshow(I3,[]);
 hIEImage3=image(I3);
 setappdata(0,'hAxes3ImageIE',hIEImage3);

 hIEImage3=getappdata(0,'hAxes3ImageIE');
 set(hIEImage3,'ButtonDownFcn',@axes3_ButtonDownFcn);
   

% --------------------------------------------------------------------
function Untitled_15_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_15 (see GCBO)
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
 loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end

% global ImageX;
I=loadImage;

A=rgb2gray(I);
K=16;H=histeq(A,K);
figure,subplot(221),imshow(A,[]),title('原图像')
subplot(222),imshow(H,[]),title('均衡后的图像'),hold on

subplot(223),hist(double(A),16),title('原图像的直方图'),subplot(224),hist(double(H),16),title('均衡后的直方图')



A=rgb2gray(I);
K=16;H=histeq(A,K);
figure,subplot(221),imshow(A,[]),title('原图像')
subplot(222),imshow(H,[]),title('均衡后的图像'),hold on

subplot(223),hist(double(A),16),title('原图像的直方图'),subplot(224),hist(double(H),16),title('均衡后的直方图')




% --------------------------------------------------------------------
function MeanFilter_Callback(hObject, eventdata, handles)
% hObject    handle to MeanFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end
 
% global ImageX;
ImageX=loadImage;
set(handles.popupmenu1,'Value',2);
%均值滤波        
        img=rgb2gray(ImageX);
        img=ImageX;
       img_noise=(imnoise(img,'salt & pepper',0.06));
         axes(handles.axes5);
%         imshow(img_noise),
          hIEImage5=image(img_noise);title('加椒盐噪声后的图像');
 setappdata(0,'hAxes5ImageIE',hIEImage5);

 hIEImage5=getappdata(0,'hAxes5ImageIE');
 set(hIEImage5,'ButtonDownFcn',@axes5_ButtonDownFcn);
 
       img_smoothed=imfilter(img_noise,fspecial('average',5));
       axes(handles.axes2);
       imshow(img_smoothed);
        hIEImage2=image(img_smoothed);title('均值滤波后的图像');
 setappdata(0,'hAxes2ImageIE',hIEImage2);

 hIEImage2=getappdata(0,'hAxes2ImageIE');
 set(hIEImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);


% --------------------------------------------------------------------
function MedianFilter_Callback(hObject, eventdata, handles)
% hObject    handle to MedianFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end
 
% global ImageX;
ImageX=loadImage;
set(handles.popupmenu1,'Value',3);
   %中值滤波
       img=rgb2gray(ImageX);
%          img=ImageX;
       img_noise=(imnoise(img,'salt & pepper',0.06));
        axes(handles.axes5);
       hIEImage5=imshow(img_noise);title('加椒盐噪声后的图像');
%         hIEImage5=image(img_noise);title('加椒盐噪声后的图像');
 setappdata(0,'hAxes5ImageIE',hIEImage5);
 set(hIEImage5,'ButtonDownFcn',@axes5_ButtonDownFcn);
        
        img_smooth=medfilt2(img_noise,[3,3]);%中值滤波
        axes(handles.axes2);
%        imshow(img_smooth);
        hIEImage2=image(img_smooth);title('中值滤波后的图像');
 setappdata(0,'hAxes2ImageIE',hIEImage2);

 hIEImage2=getappdata(0,'hAxes2ImageIE');
 set(hIEImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);


% --- Executes on slider movement.
function ContrastSlider_Callback(hObject, eventdata, handles)
% hObject    handle to ContrastSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% y=a*x+b

  a=get(handles.ContrastSlider,'Value');
  b=get(handles.BrightnessSlider,'Value');
  
  set(handles.CT,'String',a);
loadImage=getappdata(0,'Image');
imageX=BrightnessAndContrastFunc(loadImage,a,b);
axes(handles.axes5);
% I=imshow(uint8(imageX));

  hIEImage5=image(uint8(imageX));
 setappdata(0,'hAxes5ImageIE',hIEImage5);

 hIEImage5=getappdata(0,'hAxes5ImageIE');
 set(hIEImage5,'ButtonDownFcn',@axes5_ButtonDownFcn);

% --- Executes during object creation, after setting all properties.
function ContrastSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ContrastSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function BrightnessSlider_Callback(hObject, eventdata, handles)
% hObject    handle to BrightnessSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% y=a*x+b
  a=get(handles.ContrastSlider,'Value');
  b=get(handles.BrightnessSlider,'Value');
  set(handles.BT,'String',b);
loadImage=getappdata(0,'Image');
imageX=BrightnessAndContrastFunc(loadImage,a,b);

axes(handles.axes5);
hIEImage5=image(uint8(imageX));
%  imshow(uint8(imageX));
 
 setappdata(0,'hAxes5ImageIE',hIEImage5);

 hIEImage5=getappdata(0,'hAxes5ImageIE');
 set(hIEImage5,'ButtonDownFcn',@axes5_ButtonDownFcn);


% --- Executes during object creation, after setting all properties.
function BrightnessSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BrightnessSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function Invert_Callback(hObject, eventdata, handles)
% hObject    handle to Invert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end

% global ImageX;
I=loadImage;

  axes(handles.axes1);
   A=rgb2gray(I);%将图像转为灰度图
%   imshow(A);title('原始图像');

 hIEImage1=image(A);title('原始图像');
 setappdata(0,'hAxes1ImageIE',hIEImage1);

 hIEImage1=getappdata(0,'hAxes1ImageIE');
 set(hIEImage1,'ButtonDownFcn',@axes1_ButtonDownFcn);

  img2=imcomplement(A);
  
  axes(handles.axes5);
%   imshow(img2);

 hIEImage5=image(img2);title('反转图像');
 setappdata(0,'hAxes5ImageIE',hIEImage5);

 hIEImage5=getappdata(0,'hAxes5ImageIE');
 set(hIEImage5,'ButtonDownFcn',@axes5_ButtonDownFcn);

 
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
loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end

% global ImageX;
I=loadImage;

A=rgb2gray(I);
axes(handles.axes2);
%  imshow(A);
 
  hIEImage2=image(A);title('灰度图像');
 setappdata(0,'hAxes2ImageIE',hIEImage2);

 hIEImage2=getappdata(0,'hAxes2ImageIE');
 set(hIEImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);

 
 img2=imcomplement(A);
J=imadjust(A);
 axes(handles.axes3);
%  imshow(J);
  hIEImage3=image(J);title('灰度拉伸后的图像');
 setappdata(0,'hAxes3ImageIE',hIEImage3);

 hIEImage3=getappdata(0,'hAxes3ImageIE');
 set(hIEImage3,'ButtonDownFcn',@axes3_ButtonDownFcn);

% --------------------------------------------------------------------
function XianXin2_Callback(hObject, eventdata, handles)
% hObject    handle to XianXin2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end

% global ImageX;
I=loadImage;

GrayLevelsFunc(I);

% --------------------------------------------------------------------
function FenDuan_Callback(hObject, eventdata, handles)
% hObject    handle to FenDuan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end

% global ImageX;
I=loadImage;

FenDuanFunc(I);

% --------------------------------------------------------------------
function LogEn_Callback(hObject, eventdata, handles)
% hObject    handle to LogEn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 对数变换:
loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end

% global ImageX;
I=loadImage;

 axes(handles.axes2);
   A=rgb2gray(I);%将图像转为灰度图
% imshow(A);
 hIEImage2=image(A);title('灰度图像');
 setappdata(0,'hAxes2ImageIE',hIEImage2);

 hIEImage2=getappdata(0,'hAxes2ImageIE');
 set(hIEImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);


Image=log(1+double(A));

 axes(handles.axes3);
% imshow(Image,[]);
 hIEImage3=image(Image);title('LogEn');
 setappdata(0,'hAxes3ImageIE',hIEImage3);

 hIEImage3=getappdata(0,'hAxes3ImageIE');
 set(hIEImage3,'ButtonDownFcn',@axes3_ButtonDownFcn);



% --------------------------------------------------------------------
function PowerEn_Callback(hObject, eventdata, handles)
% hObject    handle to PowerEn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 幂变换
loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end

% global ImageX;
I=loadImage;
 
A=I;
A=rgb2gray(A);%将图像转为灰度图
x=0:255;
a=90,b=1.5,c=0.008;
B=b.^(c.*(double(A)-a))-1;
y=b.^(c.*(x-a))-1;

figure(1);
subplot(2,2,1)
imshow(A)
subplot(2,2,2)
imhist(A)
subplot(2,2,3)
imshow(B)
subplot(2,2,4)

imhist(B)
figure,plot(x,y)


% --------------------------------------------------------------------
function Filters_Callback(hObject, eventdata, handles)
% hObject    handle to Filters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end
 
set(handles.popupmenu1,'Value',6);
      % 基于3种拉普拉斯模板的滤波 
I=rgb2gray(loadImage);
I = double(I);
w1 = [0 -1 0; -1 4 -1; 0 -1 0]
L1 = imfilter(I, w1, 'corr', 'replicate');
w2 = [-1 -1 -1; -1 8 -1; -1 -1 -1]
L2 = imfilter(I, w2, 'corr', 'replicate');

 axes(handles.axes5);
       imshow(abs(L1), []);title('基于W1模板的普拉斯锐化');

 axes(handles.axes2);
 imshow(abs(L2), []);title('基于W2模板的普拉斯锐化');
 
w3 = [1 4 1; 4 -20 4; 1 4 1]
L3 = imfilter(I, w3, 'corr', 'replicate');
axes(handles.axes3);
    imshow(abs(L3), []);title('基于W3模板的普拉斯锐化')
 
% --------------------------------------------------------------------
function RobertFilters_Callback(hObject, eventdata, handles)
% hObject    handle to RobertFilters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end
 set(handles.popupmenu1,'Value',4);
 %锐化滤波
       % 基于Robert交叉梯度的图像锐化
I=rgb2gray(loadImage);

% I = imread('bacteria.bmp');
I = double(I); % 转换为double型，这样可以保存负值，否则uint8型会把负值截掉
w1 = [-1 0; 0 1];
w2 = [0 -1; 1 0];
G1 =  imfilter(I, w1, 'corr', 'replicate'); % 以重复方式填充边界
G2 =  imfilter(I, w2, 'corr', 'replicate');
G = abs(G1) + abs(G2); % 计算Robert梯度 
 axes(handles.axes2);
%       imshow(G,[]);title('基于Robert交叉梯度的图像锐化');

%        imshow(G,[]);
  hIEImage2=image(G);title('基于Robert交叉梯度的图像锐化');
 setappdata(0,'hAxes2ImageIE',hIEImage2);

 hIEImage2=getappdata(0,'hAxes2ImageIE');
 set(hIEImage2,'ButtonDownFcn',@axes2_ButtonDownFcn);
      
% --------------------------------------------------------------------
function Sharpen_Callback(hObject, eventdata, handles)
% hObject    handle to Sharpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function SobelFilters_Callback(hObject, eventdata, handles)
% hObject    handle to SobelFilters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

loadImage=getappdata(0,'Image');
if isempty(loadImage)
	loadImage=selectPicFunc();
end
 
set(handles.popupmenu1,'Value',5);


%   % 基于Sobel梯度的图像锐化
%  I=rgb2gray(loadImage);
%  
%  % I = imread('bacteria.bmp'); %读入原图像
%  w1 = fspecial('sobel') %得到水平sobel模板
%  w2 = w1' %转置得到竖直soble模板
%  G1 =  imfilter(I, w1); %水平Sobel梯度
%  G2 =  imfilter(I, w2); %竖直Sobel梯度
%  G = abs(G1) + abs(G2); %Sobel梯度
%   axes(handles.axes2);
%  imshow(G,[]);title('基于Sobel梯度的图像锐化');


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
hImage=getappdata(0,'hAxes1ImageIE');
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
hImage=getappdata(0,'hAxes5ImageIE');
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
hImage=getappdata(0,'hAxes2ImageIE');
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
hImage=getappdata(0,'hAxes3ImageIE');
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
hImage=getappdata(0,'hAxes4ImageIE');
pic=getimage(hImage);
SaveImageFunc(pic);
catch
    
end


% --------------------------------------------------------------------
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
About;

% --------------------------------------------------------------------
function IER_Callback(hObject, eventdata, handles)
% hObject    handle to IER (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
