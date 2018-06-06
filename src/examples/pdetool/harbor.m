% This script is written and read by pdetool and should NOT be edited.
% There are two recommended alternatives:
 % 1) Export the required variables from pdetool and create a MATLAB script
 %    to perform operations on these.
 % 2) Define the problem completely using a MATLAB script. See
 %    http://www.mathworks.com/help/pde/examples/index.html for examples
 %    of this approach.
function pdemodel
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',1);
set(ax,'DataAspectRatio',[1 1 1]);
set(ax,'PlotBoxAspectRatio',[1.5 1 1]);
set(ax,'XLim',[-1.5 1.5]);
set(ax,'YLim',[-1 1]);
set(ax,'XTickMode','auto');
set(ax,'YTickMode','auto');

% Geometry description:
pderect([-1.3223684210526314 1.3914473684210531 0.6628289473684208 -0.62993421052631637],'R1');
pdepoly([ 0.42434210526315752,...
 0.50328947368420995,...
 0.6052631578947365,...
 0.55263157894736836,...
],...
[ 0.69243421052631549,...
 0.12006578947368407,...
 0.12006578947368407,...
 0.68914473684210487,...
],...
 'P1');
pdepoly([ 1.4144736842105265,...
 0,...
 -0.06578947368421062,...
 0.013157894736842035,...
 0.09210526315789469,...
 1.4440789473684212,...
],...
[ -0.62664473684210575,...
 -0.47532894736842146,...
 0.0016447368421048658,...
 0.0016447368421048658,...
 -0.38980263157894779,...
 -0.54440789473684248,...
],...
 'P2');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','R1-P1-P2')

% Boundary conditions:
pdetool('changemode',0)
pdesetbd(14,...
'neu',...
1,...
'0',...
'0')
pdesetbd(13,...
'neu',...
1,...
'0',...
'0')
pdesetbd(12,...
'neu',...
1,...
'0',...
'0')
pdesetbd(11,...
'neu',...
1,...
'0',...
'0')
pdesetbd(10,...
'neu',...
1,...
'0',...
'0')
pdesetbd(9,...
'neu',...
1,...
'0',...
'0')
pdesetbd(8,...
'neu',...
1,...
'0',...
'0')
pdesetbd(7,...
'neu',...
1,...
'0',...
'0')
pdesetbd(6,...
'neu',...
1,...
'0',...
'0')
pdesetbd(5,...
'neu',...
1,...
'0',...
'0')
pdesetbd(4,...
'neu',...
1,...
'0',...
'0')
pdesetbd(3,...
'neu',...
1,...
'0',...
'0')
pdesetbd(2,...
'dir',...
1,...
'1',...
'0.1*sin(3*pi*t)')
pdesetbd(1,...
'neu',...
1,...
'0',...
'0')

% Mesh generation:
setappdata(pde_fig,'Hgrad',1.3);
setappdata(pde_fig,'refinemethod','regular');
setappdata(pde_fig,'jiggle',char('on','mean',''));
setappdata(pde_fig,'MesherVersion','preR2013a');
pdetool('initmesh')
pdetool('refine')

% PDE coefficients:
pdeseteq(3,...
'0.1',...
'0.0',...
'0',...
'1.0',...
'0:0.1:10',...
'0*exp(-100*(x-0).^2-100*(y+0).^2)',...
'0.0',...
'[0 100]')
setappdata(pde_fig,'currparam',...
['0.1';...
'0.0';...
'0  ';...
'1.0'])

% Solve parameters:
setappdata(pde_fig,'solveparam',...
char('0','2304','10','pdeadworst',...
'0.5','longest','0','1E-4','','fixed','Inf'))

% Plotflags and user data strings:
setappdata(pde_fig,'plotflags',[1 1 1 1 1 1 1 1 0 0 1 101 1 0 0 0 0 1]);
setappdata(pde_fig,'colstring','');
setappdata(pde_fig,'arrowstring','');
setappdata(pde_fig,'deformstring','');
setappdata(pde_fig,'heightstring','');

% Solve PDE:
pdetool('solve')
