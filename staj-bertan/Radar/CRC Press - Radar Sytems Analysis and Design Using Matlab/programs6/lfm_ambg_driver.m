function fig = lfm_ambg_driver()
% This is the machine-generated representation of a Handle Graphics object
% and its children.  Note that handle values may change when these objects
% are re-created. This may cause problems with any callbacks written to
% depend on the value of the handle at the time the object was saved.
% This problem is solved by saving the output as a FIG-file.
%
% To reopen this object, just type the name of the M-file at the MATLAB
% prompt. The M-file and its associated MAT-file must be on your path.
% 
% NOTE: certain newer features in MATLAB may not have been saved in this
% M-file due to limitations of this format, which has been superseded by
% FIG-files.  Figures which have been annotated using the plot editor tools
% are incompatible with the M-file/MAT-file format, and should be saved as
% FIG-files.

load lfm_ambg_driver

h0 = figure('Color',[0.8 0.8 0.8], ...
	'Colormap',mat0, ...
	'FileName','C:\RSA\chap6\programs\lfm_ambg_driver.m', ...
	'PaperPosition',[18 180 576 432], ...
	'PaperUnits','points', ...
	'Position',[566 441 529 348], ...
	'Tag','Fig1', ...
	'ToolBar','none');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'Callback','lfm;', ...
	'ListboxTop',0, ...
	'Position',[57 224.25 74.25 18], ...
	'String','Go', ...
	'Tag','Pushbutton1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback',mat1, ...
	'ListboxTop',0, ...
	'Position',[242.25 225.75 74.25 18], ...
	'String','Quit', ...
	'Tag','Pushbutton1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[39 112.5 93 19.5], ...
	'String','pulse width - seconds', ...
	'Tag','Pushbutton2');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'Callback','taup = str2num(get(gco,''string''));', ...
	'ListboxTop',0, ...
	'Position',[132.75 112.5 55.5 18.75], ...
	'Style','edit', ...
	'Tag','EditText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'Callback',mat2, ...
	'ListboxTop',0, ...
	'Position',[132 74.25 55.5 18.75], ...
	'Style','edit', ...
	'Tag','EditText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[39 73.5 93 19.5], ...
	'String','chirp bandwidth - Hz', ...
	'Tag','Pushbutton2');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'Callback',mat3, ...
	'ListboxTop',0, ...
	'Position',[264 112.5 91.5 19.5], ...
	'String','up chirp', ...
	'Tag','Pushbutton3');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback',mat4, ...
	'ListboxTop',0, ...
	'Position',[263.25 74.25 91.5 19.5], ...
	'String','down chirp', ...
	'Tag','Pushbutton3');
if nargout > 0, fig = h0; end
