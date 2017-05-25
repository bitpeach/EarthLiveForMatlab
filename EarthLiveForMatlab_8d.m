function varargout = EarthLiveForMatlab_8d(varargin)
% EARTHLIVEFORMATLAB MATLAB code for EarthLiveForMatlab.fig
%      EARTHLIVEFORMATLAB, by itself, creates a new EARTHLIVEFORMATLAB or raises the existing
%      singleton*.
%
%      H = EARTHLIVEFORMATLAB returns the handle to a new EARTHLIVEFORMATLAB or the handle to
%      the existing singleton*.
%
%      EARTHLIVEFORMATLAB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EARTHLIVEFORMATLAB.M with the given input arguments.
%
%      EARTHLIVEFORMATLAB('Property','Value',...) creates a new EARTHLIVEFORMATLAB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EarthLiveForMatlab_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EarthLiveForMatlab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EarthLiveForMatlab

% Last Modified by GUIDE v2.5 11-May-2017 16:25:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EarthLiveForMatlab_8d_OpeningFcn, ...
                   'gui_OutputFcn',  @EarthLiveForMatlab_8d_OutputFcn, ...
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


% --- Executes just before EarthLiveForMatlab is made visible.
function EarthLiveForMatlab_8d_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EarthLiveForMatlab (see VARARGIN)

% Choose default command line output for EarthLiveForMatlab

handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
axis off

% UIWAIT makes EarthLiveForMatlab wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%%%%%%%%%%%%%%%%%%%%%testing%%%%%%%%%%%%%%%%%%%%
% tabgp = uitabgroup(hObject,'Position',[.2 .2 .6 .7]);
% tab1 = uitab(tabgp,'Title','Type of Signal');
% tab2 = uitab(tabgp,'Title','Plot Options');



% --- Outputs from this function are returned to the command line.
function varargout = EarthLiveForMatlab_8d_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%     [filename,pathname]=uigetfile({'*.jpg';'*.bmp';'*.gif'},'选择图片');
%     if isequal(filename,0)
%         disp('Users Selected Canceled');
%     else
%         str=[pathname filename];
%         im = imread(str);
%         axes(handles.axes1);%axes1是坐标轴的标示
%         imshow(im);
%     end
    
    [pic_whole, filename] = download_image();
    %im = imread(pic_whole);
    
    
    %set(handles.axes3,'box','off')
    
    %axes(handles.axes3);%axes1是坐标轴的标示
%     axis off
%     set(gcf,'box','off')
    imshow(pic_whole);
    

    
    
    
%     line_length   = getappdata(gcf,'line_length');
%     height_length = getappdata(gcf,'height_length');
    
    edit3_display = strcat(filename,' Himawari向日葵8号拍摄');
    set(handles.edit3,'String',edit3_display);
%     setappdata(gcf,'edit3_display', edit3_display);
    %edit3_Callback()


    
function [pic_whole, filename] = download_image(hObject, eventdata, handles)
    %{"date":"2017-05-11 06:20:00","file":"PI_H08_20170511_0620_TRC_FLDK_R10_PGPFD.png"}
    
    tic
    url_temp        = 'http://himawari8.nict.go.jp/img/D531106/latest.json';
    data_temp       = urlread(url_temp);
    matlab_results  = parse_json(data_temp);
    time_str        = matlab_results{1,1}.date;
    pat             = '(\d+)';
    [content, order]= regexpi(time_str,pat,'match');

%     year    = sprintf('%s', content{1});
%     month   = sprintf('%s', content{2});
%     day     = sprintf('%s', content{3});
%     hour    = sprintf('%s', content{4});
%     minute  = sprintf('%s', content{5});
%     second  = sprintf('%s', content{6});
    [year, month, day, hour, minute, second] = content{1:6}; 
    Cloud_Account_Name = 'your own cloud account name';
	%Please use your own cloud account name. If you have no account, please sign up at http://cloudinary.com/
	
	% debug code as following 5 lines.
    %day = sprintf('%02d',str2num(day) - 1); 
    %hour = sprintf('%02d',str2num(hour) - 1);
    %minute = sprintf('%02d',50);
    %day  = sprintf('%02d',14);
    %hour = sprintf('%02d',23);
    
    url_proxy_forward = sprintf('http://res.cloudinary.com/%s/image/fetch/http://himawari8-dl.nict.go.jp/himawari8/img/D531106/8d/550/%s/%s/%s/%s%s%s', Cloud_Account_Name, year, month, day, hour, minute, second);
    
    SIZE            = 8;
    Square_pixel    = 550;
    pic_whole       = uint8(zeros(Square_pixel*SIZE, Square_pixel*SIZE, 3));
    
    %pos_x     = 1;
    %pos_y     = 1;
    interval  = Square_pixel;
    %point = 0;
    for i = 0:7
        pos_y = i;
        pos_y_start         = pos_y       * interval + 1;
        pos_y_end           = (pos_y + 1) * interval;
        
        for j = 0:7
            pos_x = j;
            pos_x_start         = pos_x       * interval + 1;
            pos_x_end           = (pos_x + 1) * interval;
            
            url_proxy_backward  = sprintf('_%d_%d.png',i,j);
            url_proxy_8D_each   = strcat(url_proxy_forward, url_proxy_backward);
            picture_part        = imread(url_proxy_8D_each);
            
            if length(size(picture_part)) == 3
%                 picture_part = rgb2gray(picture_part);
%                 point = point + 1
            else
                picture_part =  uint8(zeros(550, 550, 3));
            end
            pic_whole(pos_x_start:pos_x_end,pos_y_start:pos_y_end,1:3)...
                                = picture_part;
                            
            fprintf('dimension %d -> %d picture\n', (pos_y + 1),(pos_x + 1));
        end
        %disp( strcat('dimension ',num2str(pos_y + 1),' picture') );
        
    end
    
    imshow(pic_whole)
    
     
    if (str2num(hour) + 8) > 24
        if str2num(month) < 12
            if str2num(day) < eomday(str2num(year),str2num(month))
                day = sprintf('%02d',(str2num(day) + 1));
            else
                day   = sprintf('%02d',1);
                month = sprintf('%02d',(str2num(month) + 1));
            end
        else
            if str2num(day) < eomday(str2num(year),str2num(month))
                day = sprintf('%02d',(str2num(day) + 1));
            else
                day   = sprintf('%02d',1);
                month = sprintf('%02d',1);
                year  = sprintf('%04d',(str2num(year) + 1));
            end
        end
        %day = sprintf('%02d',(str2num(day) + 1));
    end
    
    hour = sprintf('%02d',mod((str2num(hour) + 8),24));
  
    filename = sprintf('%s year %s month %s day %s hour %s minute', year, month, day, hour, minute);
    filetype = '.png';
    imwrite(pic_whole, strcat(filename,filetype));
    
    setappdata(gcf,'filename',  filename);
    setappdata(gcf,'pic_whole', pic_whole);
    toc


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
%     get(hObject,'String');
%     line_length = str2int(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
%     get(hObject,'String');
%     height_length = str2int(get(hObject,'String'));



% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    %%%%%%%%% tailor the wallpaper %%%%%%%%%
    tic
    line_length             = str2double(get(handles.edit1,'string'));
    height_length           = str2double(get(handles.edit2,'string'));
    
%     handles.line_length     = line_length;
%     handles.height_length   = height_length;
%     guidata(hObject,handles);
    
    %setappdata(gcf,'line_length'  , line_length);
    %setappdata(gcf,'height_length', height_length);
    
    ratio       = line_length/height_length;
    Row         = 4400;
    Column      = floor(ratio*4400);
    pic_resize  = uint8(zeros(Row, Column, 3));
    
    quart_point = floor((Column - 4400)/2);
    pic_whole   = getappdata(gcf,'pic_whole');
    
    for i = 1:Row
        for j = 1:Column
            
            if j >= quart_point && j < (quart_point + 4400)
                pic_resize(i,j,1:3) = pic_whole(i,j - quart_point + 1,1:3);
                %disp(strcat(num2str(i),'+>',num2str(j)));
            else
                pic_resize(i,j,1:3) = 0;
            end         
                        
            %disp(strcat(num2str(i),'->',num2str(j)));
        end
        %disp(i)
    end
     
    filename = getappdata(gcf,'filename');
    filetype = '.jpg';
    [status, results]=system('echo %username%');
    imwrite(pic_resize, strcat('C:\Users\',results,'\Pictures\Camera Roll\',filename,filetype));
    %imwrite(pic_resize, strcat('C:\Users\PROTOCOL\Pictures\Camera Roll\',filename,filetype));
    
    edit3_display = strcat('C:\Users\PROTOCOL\Pictures\Camera Roll\',filename,filetype);
    set(handles.edit3,'String',edit3_display);
    toc
    %C:\Windows\Web\Wallpaper
    %C:\Users\PROTOCOL\Pictures\Camera Roll
    
    %%%%%%%%%%%%% testing %%%%%%%%%%%%%%%%
    load('topo.mat','topo');
    [x,y,z] = sphere(50);
    props.AmbientStrength = 0.1;
    props.DiffuseStrength = 1;
    props.SpecularColorReflectance = .5;
    props.SpecularExponent = 20;
    props.SpecularStrength = 1;
    props.FaceColor= 'texture';
    props.EdgeColor = 'none';
    props.FaceLighting = 'phong';
    props.Cdata = topo;
    
    cla(handles.axes3,'reset') 
        
    surface(x,y,z,props);
    axis off
%     light('position',[-1 0 1]);
%     light('position',[-1.5 0.5 -0.5], 'color', [.6 .2 .2]);





function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
%     set(handles.edit3,'String',edit3_display);

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
