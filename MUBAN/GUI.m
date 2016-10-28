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

% ��ʾ������
steps=100;
hwait=waitbar(0,'��ȴ�...');
for k=1:steps
    if steps-k<=5
        waitbar(k/steps,hwait,'�������');
%          pause(0.05);
    else
        str=['��Դ������...',num2str(k),'%'];
        waitbar(k/steps,hwait,str);
%          pause(0.05);
    end
end
close(hwait); % �������close����


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
[filename,pathname,~]=uigetfile({'*.jpg';'*.bmp';'*.png'},'ѡ��ͼƬ');
%�ϳ�·��+�ļ���
str=[pathname filename]; 
%��ȡͼƬ
global I;%����ȫ�ֱ���I
 I=imread(str); 
%ʹ�õ�һ��axes 
%��ʾͼƬ
axes(handles.axes1);
imshow(I);

% --- Executes on button press in ChooseImage.
function ChooseImage_Callback(hObject, eventdata, handles)%ѡ��ͼƬ�ؼ�
% hObject    handle to ChooseImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ѡ��ͼƬ·��
[filename,pathname,~]=uigetfile({'*.jpg';'*.bmp';'*.png'},'ѡ��ͼƬ');
%�ϳ�·��+�ļ���
str=[pathname filename]; 
%��ȡͼƬ
global I;%����ȫ�ֱ���I
 I=imread(str); 

%ʹ�õ�һ��axes 
%��ʾͼƬ
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
            set(handles.xx,'String','��ʼ��X����');
            set(handles.edit5,'String','����');
            set(handles.yy,'String','��ʼ��Y����');  
            set(handles.edit6,'String','���');
            set(handles.text3,'String','X����');
            set(handles.text4,'String','Y����');
            set(handles.edit5,'Visible','on');
             set(handles.edit6,'Visible','on');
         
      case 2
            set(handles.edit5,'Visible','off');
            set(handles.text3,'String','Բ�İ뾶');
            set(handles.text4,'String','Բ��λ��');
            set(handles.xx,'String','Բ�İ뾶');
            set(handles.yy,'String','Բ������X');
            set(handles.edit6,'String','Բ������Y');
              
      case 3
            set(handles.edit5,'Visible','off');
            set(handles.text3,'String','���ű���');
            set(handles.text4,'String','λ��');
            set(handles.xx,'String','���������');
            set(handles.yy,'String','����X');
            set(handles.edit6,'String','����Y');
                
      case 4
            set(handles.edit5,'Visible','off');
            set(handles.text3,'String','���ű���');
            set(handles.text4,'String','λ��');
            set(handles.xx,'String','���������');
            set(handles.yy,'String','����X');
             set(handles.edit6,'String','����Y');
%              ��ȡģ��
        [filename,pathname,~]=uigetfile({'*.png';'*.jpg';'*.bmp'},'ѡ��ͼƬ');
        %�ϳ�·��+�ļ���
         str2=[pathname filename]; 
        %��ȡͼƬ
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

%���ַ�������ʽ���洢�����ı���1������. ����ַ����������֡�
% ����ʵ�հ�����
input=str2num(get(hObject,'String'));
%��������Ƿ�Ϊ��. ���Ϊ��,��Ĭ����ʾΪ0
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
         %����ģ��
 %���� �Զ��庯��������
XX=RectMod(I,xx,yy,xx1,yy1)
   axes(handles.axes1);
 imshow(XX);
 
     case 2
%       Բ��ģ��
     radius=xx;
     centre=yy;
    rgbmask=CircleMod(I,radius,yy,yy1);
     
    XX= immultiply(I,rgbmask);
       axes(handles.axes1);
     imshow(XX);
     
     case 3
%        �û��Զ���ģ��1���˴�ѡ��Ϊ����ǣ�
UserImage=imread('star1.png');
beginX=yy;
beginY=yy1;

XX=UserMod(I,UserImage,beginX,beginY,xx);
 axes(handles.axes1);
   
 imshow(XX);
      case 4
          %        �û��Զ���ģ�壨���ļ���ѡ�񣩶�ģ��ͼ��������Ҫ��
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

% --- Executes on button press in Translation.ͼ���ƽ�Ʋ���
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
global I;%global ȫ�ֱ���
ImageX=I;
% ImageX=imread('swift.jpg');
% % se = translate(strel(1), [tx ty]);%ƽ��ͼ��
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
figure,subplot(221),imshow(A,[]),title('ԭͼ��')
subplot(222),imshow(H,[]),title('������ͼ��'),hold on

subplot(223),hist(double(A),16),title('ԭͼ���ֱ��ͼ'),subplot(224),hist(double(H),16),title('������ֱ��ͼ')


% --------------------------------------------------------------------
function FanZhuan_Callback(hObject, eventdata, handles)
% hObject    handle to FanZhuan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;
  axes(handles.axes1);
   A=rgb2gray(I);%��ͼ��תΪ�Ҷ�ͼ
  imshow(A);title('ԭʼͼ��');
  img2=imcomplement(A);
  
  axes(handles.axes2);
  imshow(img2);title('��תͼ��');
 
% ��ת�任����2:
%  axes(handles.axes1);
%  A=rgb2gray(I);
%  imshow(A);title('ԭʼͼ��');
% JJ=imadjust(A,[0 1],[1 0]);
% axes(handles.axes2);
% imshow(JJ,[]);title('��תͼ��');


% --------------------------------------------------------------------
function XianXin_Callback(hObject, eventdata, handles)
% hObject    handle to XianXin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;
A=rgb2gray(I);
 imshow(A);title('ԭʼͼ��');
 img2=imcomplement(A);
J=imadjust(A);
 axes(handles.axes2);
 imshow(J);title('�Ҷ�������ͼ��');

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

% �رյ�ǰͼ�δ���
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
% �����任:
global I;
 axes(handles.axes1);
 
 Im=LogEnFun(I);
  axes(handles.axes2);
 imshow(Im,[]);
 
%    A=rgb2gray(I);%��ͼ��תΪ�Ҷ�ͼ
% imshow(A);
% Image=log(1+double(A));
%  axes(handles.axes2);
% imshow(Image,[]);


% --------------------------------------------------------------------
function PowerEn_Callback(hObject, eventdata, handles)
% hObject    handle to PowerEn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% �ݱ任
% ���ز��ֿؼ�

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
% A=rgb2gray(A);%��ͼ��תΪ�Ҷ�ͼ
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
