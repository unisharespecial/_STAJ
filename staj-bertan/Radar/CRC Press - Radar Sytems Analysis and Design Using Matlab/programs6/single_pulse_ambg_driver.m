function fig = single_pulse_ambg_driver()
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

load single_pulse_ambg_driver

h0 = figure('Color',[0.8 0.8 0.8], ...
	'Colormap',mat0, ...
	'FileName','C:\RSA\chap6\programs\single_pulse_ambg_driver.m', ...
	'PaperPosition',[18 180 576 432], ...
	'PaperUnits','points', ...
	'Position',[676 578 425 203], ...
	'Tag','Fig1', ...
	'ToolBar','none');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','single_pulse;', ...
	'ListboxTop',0, ...
	'Position',[56.25 112.5 57 19.5], ...
	'String','Go', ...
	'Tag','Pushbutton1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'Callback','close all', ...
	'ListboxTop',0, ...
	'Position',[206.25 112.5 57 19.5], ...
	'String','Quit', ...
	'Tag','Pushbutton1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'ListboxTop',0, ...
	'Position',[59.25 36 93 19.5], ...
	'String','pulse width - seconds', ...
	'Tag','Pushbutton2');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'Callback',mat1, ...
	'ListboxTop',0, ...
	'Position',[150.75 37.5 54.75 19.5], ...
	'String','2', ...
	'Style','edit', ...
	'Tag','EditText1');
if nargout > 0, fig = h0; end
