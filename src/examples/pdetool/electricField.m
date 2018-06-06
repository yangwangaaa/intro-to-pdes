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
set(ax,'DataAspectRatio',[1.5 1 1]);
set(ax,'PlotBoxAspectRatio',[1 0.5014064697609002 0.5014064697609002]);
set(ax,'XLim',[-1.5 1.5]);
set(ax,'YLim',[-1 1]);
set(ax,'XTickMode','auto');
set(ax,'YTickMode','auto');

% Geometry description:
pderect([-1.3848684210526314 1.4572368421052633 0.81085526315789469 -0.81414473684210575],'R1');
pdeellip(0.0032894736842106198,-0.0098684210526317484,0.023026315789473673,0.024671052631578871,...
0,'E1');
pdeellip(-0.77777777777777779,-0.33059210526315774,0.051051051051051122,0.052631578947368363,...
0,'E2');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','R1-E1-E2')

% Boundary conditions:
pdetool('changemode',0)
pdesetbd(12,...
'dir',...
1,...
'1',...
'-1')
pdesetbd(11,...
'dir',...
1,...
'1',...
'-1')
pdesetbd(10,...
'dir',...
1,...
'1',...
'-1')
pdesetbd(9,...
'dir',...
1,...
'1',...
'-1')
pdesetbd(8,...
'dir',...
1,...
'1',...
'1')
pdesetbd(7,...
'dir',...
1,...
'1',...
'1')
pdesetbd(6,...
'dir',...
1,...
'1',...
'1')
pdesetbd(5,...
'dir',...
1,...
'1',...
'0')
pdesetbd(4,...
'dir',...
1,...
'1',...
'0')
pdesetbd(3,...
'dir',...
1,...
'1',...
'0')
pdesetbd(2,...
'dir',...
1,...
'1',...
'0')
pdesetbd(1,...
'dir',...
1,...
'1',...
'0')

% Mesh generation:
setappdata(pde_fig,'Hgrad',1.3);
setappdata(pde_fig,'refinemethod','regular');
setappdata(pde_fig,'jiggle',char('on','mean',''));
setappdata(pde_fig,'MesherVersion','preR2013a');
pdetool('initmesh')
pdetool('refine')

% PDE coefficients:
pdeseteq(1,...
'0.1',...
'0.0',...
'0',...
'1.0',...
'0:0.1:20',...
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
char('0','5166','10','pdeadworst',...
'0.5','longest','0','1E-4','','fixed','Inf'))

% Plotflags and user data strings:
setappdata(pde_fig,'plotflags',[1 1 1 1 1 2 1 1 0 0 0 1 1 1 0 1 0 1]);
setappdata(pde_fig,'colstring','');
setappdata(pde_fig,'arrowstring','');
setappdata(pde_fig,'deformstring','');
setappdata(pde_fig,'heightstring','');

% Solve PDE:
pdetool('solve')