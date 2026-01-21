function varargout = orginal(varargin)
% MODIFIED_GUI MATLAB code for modified_GUI.fig
%      MODIFIED_GUI, by itself, creates a new MODIFIED_GUI or raises the existing
%      singleton*.
%
%      H = MODIFIED_GUI returns the handle to a new MODIFIED_GUI or the handle r

%      the existing singleton*.
%
%      MODIFIED_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODIFIED_GUI.M with the given input arguments.
%
%      MODIFIED_GUI('Property','Value',...) creates a new MODIFIED_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before modified_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to modified_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help modified_GUI

% Last Modified by GUIDE v2.5 31-May-2016 14:34:23

% Begin initialization code - DO NOT EDIT 
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @modified_GUI2_comp_OpeningFcn, ...
                   'gui_OutputFcn',  @modified_GUI2_comp_OutputFcn, ...
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

% --- Executes just before modified_GUI is made visible.
function modified_GUI2_comp_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to modified_GUI (see VARARGIN)

% Choose default command line output for modified_GUI
handles.output = hObject;
%% axes position
set(handles.axes1,'units','pixels','visible','off');
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);

scrz=get(0,'ScreenSize');
fig_hr = 930;
fig_vr = 930;
pos1 = round((scrz(3)-fig_hr)/4);
pos2 = round((scrz(4)-fig_vr)/1.5);
posa = pos1 +1.5* round(fig_hr);
random_arr = 999+randperm(96);
random_arr(length(random_arr)+1) = 1000;
random_arr(97)
setappdata(0,'random_arr',random_arr);
setappdata(0,'pos1',pos1);
setappdata(0,'pos2',pos2);
setappdata(0,'posa',posa);
handles.text1   =uicontrol('Style','Text', 'HandleVisibility','off','Position' ,[pos1, pos2,500,300],'Value',0,'String','One image with two options will be shown to you. Please select your option by looking at the image. Enter user number to start. ','FontSize',25,'BackgroundColor',[0.5,0.5,0.5]);
handles.edit1   = uicontrol('Style','Edit', 'HandleVisibility','off','Position' ,[4*pos1, pos2,100 ,30]);
handles.button1 = uicontrol('Style', 'pushbutton','Callback', {@pushbutton1_Callback, ancestor(hObject, 'figure')} ,'Units','pixels', 'Position', [4*pos1, pos2-60,100 ,30 ], 'String', 'Enter');
handles.button2 = uicontrol('Style', 'pushbutton','Callback', {@pushbutton2_Callback, ancestor(hObject, 'figure')} ,'Units','pixels', 'Position', [1200, pos2- 300,80 ,50 ], 'String', 'Next');
handles.button3 = uicontrol('Style', 'pushbutton','Callback', {@pushbutton3_Callback, ancestor(hObject, 'figure')} ,'Units','pixels', 'Position', [1400, pos2- 300,80 ,50 ], 'String', 'Back');


handles.img = 1;
handles.co = 1;
handles.att =1;
handles.save = 1;
handles.sd =zeros(96,1);
set(handles.button2,'units','pixels','visible','off');
pos3 = [1.9*pos1 pos2 fig_hr fig_vr];
set(handles.axes1,'pos',pos3);
axes(handles.axes1);
handles.end = 0;
save_Data = zeros(96,1);
setappdata(0,'save_Data',save_Data);

% Update handles structure

guidata(hObject, handles);

function varargout = modified_GUI2_comp_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;
% UIWAIT makes modified_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.


function pushbutton1_Callback (hObject,eventdata,handles)
handles = guidata(hObject);
i= getappdata(0,'i');
% save_img{i} = imread ([num2str(i),'.tif']);
x = get(handles.edit1,'String');
handles.results = x;
random_arr= getappdata(0,'random_arr'); % obtain the random sequence
pos1= getappdata(0,'pos1');
pos2= getappdata(0,'pos2');
posa= getappdata(0,'posa');

set(handles.text1,'units','pixels','visible','off');
set(handles.edit1,'units','pixels','visible','off');
set(handles.button1,'visible','off');
set(handles.button2,'visible','on');






imshow([num2str(random_arr(handles.co)),'.bmp']); 

set(gcf,'Windowkeypressfcn',@figure1_WindowKeyPressFcn); 
guidata(hObject, handles)



function pushbutton2_Callback (hObject, eventdata, handles)
handles = guidata(hObject);

global data
if get(gcf,'CurrentCharacter')=='y'
    data=1;       
elseif get(gcf,'CurrentCharacter')=='n'
    data=2;
end


  %% selected option
    
       

  %% selected option

%          img_select_1 = 0;
%          img_select_2 = 0;
%          if ( data == 1)
%              img_select_1 = 1;  
%          end
%          if ( data == 2) 
%              img_select_2 = 1;
%          end
   %%   
%          
%    vec_A = {'Cooperative','Mature','Careful','Imaginative'}; 
%    vec_B = {'Uncooperative','Baby Like','Careless','UnImaginative'};
pos1= getappdata(0,'pos1');
pos2= getappdata(0,'pos2');
posa= getappdata(0,'posa');
random_arr= getappdata(0,'random_arr');
save_Data= getappdata(0,'save_Data');


    
handles.co = handles.co +1;  
%          if handles.co > 90; handles.co =90; end
handles.sd(handles.save,1) = random_arr(handles.co-1);
%          handles.sd(handles.save,2) = handles.att;
%          save_Data(handles.save,3) = question;



   
%          data
handles.att = handles.att + 1;
%    handles.att (handles.att>4) = 1;
%     uicontrol('Style','Radio', 'Parent',handles.hBtnGrp, 'HandleVisibility','off','BackgroundColor',[0.5,0.5,0.5], 'Position',[(pos1+326+pos1)/2+150, pos2-70,350 ,50],'Value',0, 'String',vec_A(handles.att),'FontSize',20,'FontWeight','bold', 'Tag','A')
%     uicontrol('Style','Radio', 'Parent',handles.hBtnGrp, 'HandleVisibility','off','BackgroundColor',[0.5,0.5,0.5], 'Position',[(posa+326+posa)/2+150, pos2-70,350 ,50],'Value',0, 'String',vec_B(handles.att),'FontSize',20,'FontWeight','bold', 'Tag','B') 
handles.save = handles.save+1;
% if handles.save == 90;    handles.att = 1; end
% if handles.save == 180;   handles.att = 2; end
% if handles.save == 270;   handles.att = 3; end
uicontrol('Style','Text', 'HandleVisibility','off','Position',[1190,450,100 ,50],'BackgroundColor',[0.3,0.3,0.3],'Value',0,'String',[num2str(handles.save),'out of 96 images'], 'Tag','text1','FontSize',12)
%  handles.co = handles.co +1; 
%  if handles.co ==91 
%     handles.co = 1;end
imshow([num2str(random_arr(handles.co)),'.bmp']);

% set(handles.button2,'enable','off')
% pause(1)
% set(handles.button2,'enable','on')
handles.co

if handles.save > 96
   save_Data = handles.sd;
   save(['Comp_judge',num2str(handles.results),'.mat'],'save_Data');
   close all
end
guidata(hObject, handles)



function pushbutton3_Callback(hObject, eventdata, handles)
   handles = guidata(hObject);        
   arr= getappdata(0,'arr');
   pos1= getappdata(0,'pos1');
   pos2= getappdata(0,'pos2');
   posa= getappdata(0,'posa');
   question= getappdata(0,'question');
   question1= getappdata(0,'question1');
   next= getappdata(0,'next');
   qtext= getappdata(0,'qtext');
   random_arr= getappdata(0,'random_arr');
%    random_arr
   handles.att = handles.att - 1;
   handles.save = handles.save - 1;   
%           if (handles.save == 90)
%               handles.att = 2;
% 
%          end
%           if (handles.save == 180)
%               handles.att = 3;  
%           end
%           if handles.save == 270
%             handles.att=4;
%           end
%          handles.save = handles.save - 1;        
%          if handles.co == 4;
%              handles.co = 198;
%          end
%      
   handles.att(handles.att==0) = 4;   
%    vec_A = {'Cooperative','Mature','Careful','Imaginative'}; 
%    vec_B = {'Uncooperative','Baby Like','Careless','UnImaginative'};
% %    hBtnGrp = uibuttongroup('Position',[ 0 0 0.1 0.1], 'Units','Normalized','BackgroundColor',[0.5,0.5,0.5]);
%     uicontrol('Style','Radio', 'Parent',handles.hBtnGrp, 'HandleVisibility','off','BackgroundColor',[0.5,0.5,0.5], 'Position',[(pos1+326+pos1)/2+150, pos2-70,350 ,50],'Value',0, 'String',vec_A(handles.att),'FontSize',20,'FontWeight','bold', 'Tag','A')
%     uicontrol('Style','Radio', 'Parent',handles.hBtnGrp, 'HandleVisibility','off','BackgroundColor',[0.5,0.5,0.5], 'Position',[(posa+326+posa)/2+150, pos2-70,350 ,50],'Value',0, 'String',vec_B(handles.att),'FontSize',20,'FontWeight','bold', 'Tag','B')
   handles.co = handles.co - 1;
   handles.co         
   if (handles.co == 0 )
              handles.co = 1;
   end%       
%          
   my_str = qtext(question);       
% uicontrol('Style','Text', 'HandleVisibility','off','Position',[(((pos1+326+pos1)/2)+(posa+326+posa)/2)/2-150, pos2-250,600 ,50 ],'BackgroundColor',[0.5,0.5,0.5],'Value',0,'String',my_str, 'Tag','text1','FontSize',25)
   uicontrol('Style','Text', 'HandleVisibility','off','Position',[1190, 450,100 ,50],'BackgroundColor',[0.3,0.3,0.3],'Value',0,'String',[num2str(handles.save),'out of 96 images'], 'Tag','text1','FontSize',12)

   save_img1 = imread ([num2str(random_arr(handles.co)),'.bmp']);
% save_img2 = imread ([num2str(arr(handles.co,2)),'.tif']);

   imshow(save_img1,'Parent',handles.axes1 );
% imshow(save_img2,'Parent',handles.axes2 );         
   set(handles.button2,'enable','off')
   pause(0.5)
   set(handles.button2,'enable','on')
guidata(hObject, handles)

function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
switch eventdata.Key
    case {'pageup', 'leftarrow', 'uparrow'}
        handles=guidata(hObject);
        pushbutton3_Callback(hObject, eventdata, handles);        
    case {'pagedown', 'rightarrow', 'downarrow'}
        handles=guidata(hObject);
        pushbutton2_Callback(hObject, eventdata, handles);
end
     


    
   






