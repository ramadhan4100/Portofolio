%**************************************************************************
%                 Minimize Periodical Function using GAs
% -------------------------------------------------------------------------
% By     : Sutrisno
% Contact: sutrisno_link@yahoo.com             Last update: April 19, 2011
% -------------------------------------------------------------------------                             
% This program is developed to find minimal value of periodical function: 
%                           f(x)=tan(sin(x))-sin(tan(x))
% 
% There are 3  parts in this program:
% 1.Main program of GAs (ga1.m)
% 2.Function definition (objfunction.m)
% 2.Plotting the function (plotting.m)
% 3.Plotting the results (rplotting.m)
%**************************************************************************
 
%**************************************************************************
%                   The Program Start Here                    
%*------------------------------------------------------------------------
function ga1
clear all;
clc;
 
% GA
options = gaoptimset(@ga);
options = gaoptimset('PopulationSize',80,...
                     'SelectionFcn',@selectionstochunif,...
                     'CrossoverFraction',0.5,...
                     'Generations',100,...
                     'PlotFcns',@gaplotbestf);
 
 [r, fval, reason, output, population, scores] = ...
     ga(@objfunction,1,[],[],[],[],-3.14,3.14,[],options);
% result
rplotting(r)
end
%**************************************************************************
%                   Ending of Program                          
%**************************************************************************

%File: obcjfunctio.m
%**************************************************************************
%                   The Program Start Here                    
%*------------------------------------------------------------------------
% Objectif Function:   y = tan(sin(x)) - sin(tan(x));
function y = objfunction(x)
y = cos(sin(x)) - sin(tan(x));
end
%**************************************************************************
%                   Ending of Program                          
%**************************************************************************
%File: plotting.m
%**************************************************************************
%                   The Program Start Here                    
%*------------------------------------------------------------------------
function plotting
x= -10.15:0.1:10.15;
y=objfunction(x);
plot(x,y)
xlabel('x (rad)');
ylabel('f(x)');
title('Function f(x) = cos(sin(x)) - sin(tan(x)))')
grid on
end
%**************************************************************************
%                   Ending of Program                          
%**************************************************************************

%File: rplotting.m
%**************************************************************************
%                   The Program Start Here                    
%*------------------------------------------------------------------------
function rplotting(r)
x= -3.14:0.025:3.14;
y=objfunction(x);
plot(x,y)
xlabel('x (rad)');
ylabel('f(x)');
title('Function f(x) = cos(sin(x)) - sin(tan(x)')
hold on
plot(r,objfunction(r),'o')
text(1.0,- 1.75,['at x =',num2str(r)])
text(1.0,-1.5,['minimum value=',num2str(objfunction(r))])
hold off
end
%**************************************************************************
%                   Ending of Program                          
%**************************************************************************
