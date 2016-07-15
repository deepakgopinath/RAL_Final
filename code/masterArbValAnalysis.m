clear all; clc;close all;
subplot(1,2,1);
setupArbVal;
qVar1 = indexH; qVar2 = indexSCI;
arbValAnalysisTwo;
%Black to BLack
h1 = 0.31;
line([fc*lf fc*lf + offset],[h1 h1], 'LineWidth', 2.0);
line([fc*lf fc*lf],[h1 h1-yd], 'LineWidth', 2.0);
line([fc*lf+offset fc*lf+offset],[h1 h1-yd], 'LineWidth', 2.0);
text(mean([fc*lf fc*lf + offset]),h1+yd,'**',...
   	'HorizontalAlignment','Center',...
   	'BackGroundColor','none', 'FontSize', 15);
%Red to Red
h2 = 0.39;
line([fc*rf fc*rf + offset],[h2 h2], 'LineWidth', 2.0);
line([fc*rf fc*rf],[h2 h2-yd], 'LineWidth', 2.0);
line([fc*rf+offset fc*rf+offset],[h2 h2-yd], 'LineWidth', 2.0);
text(mean([fc*rf fc*rf + offset]),h2+yd,'*',...
   	'HorizontalAlignment','Center',...
   	'BackGroundColor','none', 'FontSize', 15);
text(max(xlim)/2, max(ylim)-0.05, '\fontsize{9}\color{black}o - Uninjured     \color{red}o - SCI', 'HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize',8);
rectangle('Position',[(max(xlim)/2-0.01) max(ylim)-0.08 0.32 0.07], 'LineWidth', 0.6, 'LineStyle', ':');


subplot(1,2,2);
qVar1 = index2d; qVar2 = index3d;
arbValAnalysisTwo;
%Black to BLack
h1 = 0.31;
line([fc*lf fc*lf + offset],[h1 h1], 'LineWidth', 2.0);
line([fc*lf fc*lf],[h1 h1-yd], 'LineWidth', 2.0);
line([fc*lf+offset fc*lf+offset],[h1 h1-yd], 'LineWidth', 2.0);
text(mean([fc*lf fc*lf + offset]),h1+yd,'',...
   	'HorizontalAlignment','Center',...
   	'BackGroundColor','none', 'FontSize', 15);
%Red to Red
h2 = 0.39;
line([fc*rf fc*rf + offset],[h2 h2], 'LineWidth', 2.0);
line([fc*rf fc*rf],[h2 h2-yd], 'LineWidth', 2.0);
line([fc*rf+offset fc*rf+offset],[h2 h2-yd], 'LineWidth', 2.0);
text(mean([fc*rf fc*rf + offset]),h2+yd,'',...
   	'HorizontalAlignment','Center',...
   	'BackGroundColor','none', 'FontSize', 15);
text(max(xlim)/2 + 0.055, max(ylim)-0.05, '\fontsize{9}\color{black}o - 2D     \color{red}o - 3D', 'HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize',8);
rectangle('Position',[(max(xlim)/2+0.045) max(ylim)-0.08 0.22 0.07], 'LineWidth', 0.6, 'LineStyle', ':');


suptitle('{\fontsize{16}Phase 1 vs. Phase 2 Customization}');