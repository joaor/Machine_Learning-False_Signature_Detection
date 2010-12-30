function varargout = project_gui(varargin)
% PROJECT_GUI M-file for project_gui.fig
%      PROJECT_GUI, by itself, creates a new PROJECT_GUI or raises the existing
%      singleton*.
%
%      H = PROJECT_GUI returns the handle to a new PROJECT_GUI or the handle to
%      the existing singleton*.
%
%      PROJECT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_GUI.M with the given input arguments.
%
%      PROJECT_GUI('Property','Value',...) creates a new PROJECT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project_gui

% Last Modified by GUIDE v2.5 30-Dec-2010 02:34:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @project_gui_OutputFcn, ...
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


% --- Executes just before project_gui is made visible.
function project_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project_gui (see VARARGIN)

% Choose default command line output for project_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Centroid.
function Centroid_Callback(hObject, eventdata, handles)
% hObject    handle to Centroid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Centroid


% --- Executes on button press in Sixfold.
function Sixfold_Callback(hObject, eventdata, handles)
% hObject    handle to Sixfold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Sixfold


% --- Executes on button press in Trisurface.
function Trisurface_Callback(hObject, eventdata, handles)
% hObject    handle to Trisurface (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Trisurface


% --- Executes on button press in Length.
function Length_Callback(hObject, eventdata, handles)
% hObject    handle to Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Length


% --- Executes on button press in Bestfit.
function Bestfit_Callback(hObject, eventdata, handles)
% hObject    handle to Bestfit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Bestfit


% --- Executes on button press in MDF.
function MDF_Callback(hObject, eventdata, handles)
% hObject    handle to MDF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MDF


% --- Executes on selection change in menu_classifiers.
function menu_classifiers_Callback(hObject, eventdata, handles)
% hObject    handle to menu_classifiers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_classifiers contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_classifiers


% --- Executes during object creation, after setting all properties.
function menu_classifiers_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_classifiers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in run_button.
function run_button_Callback(hObject, eventdata, handles)
if(get(handles.Centroid,'Value'))
    %fazes o que quiseres
end
if(get(handles.Sixfold,'Value'))
    %fazes o que quiseres
end
if(get(handles.Trisurface,'Value'))
    %fazes o que quiseres
end
if(get(handles.Length,'Value'))
    %fazes o que quiseres
end
if(get(handles.Bestfit,'Value'))
    %fazes o que quiseres
end
if(get(handles.MDF,'Value'))
    %fazes o que quiseres
end
switch get(handles.menu_classifiers,'Value')   
    case 1 %Bayesian
        %fazes o que quiseres
    case 2 %FLD
        %fazes o que quiseres
    case 3 %FLQP
        %fazes o que quiseres
    case 4 %MLP
        %fazes o que quiseres
    case 5 %RBF
        %fazes o que quiseres
    case 6 %SVM
        %fazes o que quiseres
    case 7 %KMeans
        get(handles.menu_classifiers,'Value') 
        %fazes o que quiseres
    case 8 %KNN
        %fazes o que quiseres
    otherwise
end
set(handles.result,'String','100 %');
set(handles.sd,'String','0 %');
set(handles.fpositive,'String','0 %');
set(handles.tpositive,'String','0 %');
