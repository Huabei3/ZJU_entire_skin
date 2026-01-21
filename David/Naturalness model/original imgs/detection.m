function varargout = detection(varargin)
% DETECTION MATLAB code for detection.fig
%      DETECTION, by itself, creates a new DETECTION or raises the existing
%      singleton*.
%
%      H = DETECTION returns the handle to a new DETECTION or the handle to
%      the existing singleton*.
%
%      DETECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DETECTION.M with the given input arguments.
%
%      DETECTION('Property','Value',...) creates a new DETECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before detection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to detection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help detection

% Last Modified by GUIDE v2.5 14-Dec-2020 11:05:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @detection_OpeningFcn, ...
                   'gui_OutputFcn',  @detection_OutputFcn, ...
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


% --- Executes just before detection is made visible.
function detection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to detection (see VARARGIN)

% Choose default command line output for detection
handles.output = hObject;

global i;
global sz;
global idtotal;
global skin;
global sky;
global grass;
idtotal = [];
% zju4
% skin = [7 8 18 29 33 40 50 51 54 65 67 77];
% sky = [1 3 4 6 11 13 14 27 39 42 44 45 48 52 55 57 58 63 68 71];
% grass = [1 6 7 16 20 21 43 49 54 55 62 75 76];

% zju5 - hw
% skin = [5 14 17];
% sky = [3 11];
% grass = [12];

% zju5 - oppo
% skin = [13 14 17];
% sky = [9 11 12];
% grass = [3 10];

% kadid
skin = [45 53 67 70 81];
% sky = [1 4 7 9];
sky = [10 11 18 21 22 24 27 33 37 44 51 52 54 62 68 71 73 75 78];
% grass = [2 3 8] ;
grass = [12 13 14 17 19 23 26 31 35 40 43 46 50 56 57 74 76 77];

i = 1;
set(handles.axes1,'visible','off');
%
img = imread(['I',int2str(grass(i)),'.png287.jpg']);
%
img = imresize(img,[512,512]);
sz = size(img);
axes(handles.axes2);
imshow(img);
set(handles.axes2,'visible','off');
img = imgcluster(img);
axes(handles.axes1);
h = imshow(img);
set(h,'ButtonDownFcn',@imgcall);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes detection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = detection_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global idtotal;
global i;
global sz;
global skin;
global sky;
global grass;
set(handles.pushbutton1,'visible','off');
set(handles.pushbutton1,'enable','off');
%
save([int2str(grass(i)),'_grass'],'idtotal');
%
idtotal = [];
i = i+1;
%
img = imread(['I',int2str(grass(i)),'.png287.jpg']);
%
img = imresize(img,[512,512]);
axes(handles.axes2);
imshow(img);
sz = size(img);
img = imgcluster(img);
axes(handles.axes1);
h = imshow(img);
set(h,'ButtonDownFcn',@imgcall);
set(handles.pushbutton1,'visible','on');
set(handles.pushbutton1,'enable','on');



function imgcall(hObject, eventdata, handles)
global sz;
global idx;
global lab1;
global idtotal;

p = get(get(hObject, 'Parent'),'CurrentPoint');
p = p(1,1:2);
x = round( axes2pix(sz(2), [1 sz(2)], p(1)) );
y = round( axes2pix(sz(1), [1 sz(1)], p(2)) );
idxtmp = reshape(idx , sz(1) , sz(2));
targetid = idxtmp(y,x);

id = find(idx == targetid);
idtotal = [idtotal;id];
lab1(id,1) = 0;
lab1(id,2) = 0;
lab1(id,3) = 0;
xyz1 = lab2xyz(lab1 , 'user',display_f([1 1 1]));
img1 = display_r(xyz1);
result = reshape(img1 , sz(1) , sz(2) , 3);


h = imshow(result);
set(h,'ButtonDownFcn',@imgcall);



function result = imgcluster(img)

global idx;
global lab1;
classnumber = 50;
sz = size(img);
pos = ones(sz(1),sz(2),2);
for m = 1:sz(1)
    for n = 1:sz(2)
        pos(m,n,:) = [m,n];
    end
end
img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);
lab0 = xyz2lab(xyz0 ,'user', display_f([1 1 1]));
l1 = (lab0(:,1)-min(lab0(:,1)))/(max(lab0(:,1))-min(lab0(:,1)));
a1 = (lab0(:,2)-min(lab0(:,2)))/(max(lab0(:,2))-min(lab0(:,2)));
b1 = (lab0(:,3)-min(lab0(:,3)))/(max(lab0(:,3))-min(lab0(:,3)));
pos = reshape(pos , sz(1) * sz(2) , 2);
pos1 = 0.5*pos(:,1)/sz(1);
pos2 = 0.5*pos(:,2)/sz(2);
labpos = [l1,a1,b1,pos1,pos2];

opt = statset('Display','final','MaxIter',500);
[idx,center] = kmeans(labpos,classnumber,'Options',opt);


lab1 = lab0;
for k = 1:classnumber
    id = find(idx == k);
    lab1(id,1) = center(k,1)*(max(lab0(:,1))-min(lab0(:,1)))+min(lab0(:,1));
    lab1(id,2) = center(k,2)*(max(lab0(:,2))-min(lab0(:,2)))+min(lab0(:,2));
    lab1(id,3) = center(k,3)*(max(lab0(:,3))-min(lab0(:,3)))+min(lab0(:,3));
end

xyz1 = lab2xyz(lab1 ,'user', display_f([1 1 1]));
img1 = display_r(xyz1);
result = reshape(img1 , sz(1) , sz(2) , 3);
