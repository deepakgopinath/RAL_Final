clear; clc;

subList = {'h1', 'h2', 'h3', 'h4', 'h5', 'h6','h7','h8', 'h9','h10', 'h11', 'h12','h13', 's1', 's2','s3', 's4'};

index3d = [1,2,3,4,5,9,13,14,16,17];
index2d = [6,7,8,10,11,12,15];

indexH = [1,2,3,4,5,6,7,8,9,10,11,12,13];
indexSCI = [14,15,16,17];
maxTrialsPerTaskt2  = 18;
maxTrialsPerTaskt3 = 22;
t2order = -ones(maxTrialsPerTaskt2, 3, length(subList));
t3order = -ones(maxTrialsPerTaskt3, 3, length(subList));

arbVals = ones (5, 3, length(subList));
slopeVec = ones(5, length(subList));
for i=1:length(subList)
    arbVals(1, :, i) = [0.3; 0.9 ;0.3]';
    arbVals(2, :, i) = [0.3; 0.7; 0.5]';
    arbVals(3, :, i) = [0.3, 0.5, 0.8]';
    
end


numSubjects = length(subList);
numQuestions = 19;
qAnsData = zeros(numSubjects, numQuestions);

loaddata; %time and mode switch info for each task. 
loadQData;
for i=1:length(subList)
    slopeVec(:, i) = arbVals(:,3,i)./(arbVals(:, 2, i) - arbVals(:, 1, i));
end

reaching = {'t2', 't3', 't3', 't2', 't2', 't2', 't3', 't2', 't3', 't2', 't2', 't2','t3', 't2', 't3', 't3', 't2'};
scooping = {'t3', 't2', 't2', 't3', 't3', 't3', 't2', 't3', 't2', 't3', 't3', 't3','t2', 't3', 't2', 't2' , 't3'};
t2pref = {'customa', 'customa', 'customa', 'customa', 'customa', 'mid', 'customa' , 'customa',  'customa', 'mid',     'customa', 'mid',     'mid',     'mid'    , 'customa', 'min', 'customa'};
t3pref = {'customb', 'mid',     'customa', 'customa', 'customb', 'mid', 'customb',  'customa',  'customb', 'customb', 'customb', 'customb', 'customb', 'customa', 'customa', 'mid', 'customb'};
phases = {'ph1', 'ph2'};
colorList = {'r', 'g', 'b', 'm', 'c'};
objType = {'near', 'far'};
tasktype = {'reaching', 'scooping'};
assisType = {'tel','min','max','custom'};
colorList = {'k','r', 'g', 'b', 'm', 'c'};
legendList = {'Task 1 ','Task 2'};
%Query stuff

isSCI = true;
% objNum = 0; % 0 for near and 1 for far. 
% phaseId = 2; % for the most part for each task only phase matters. phase 1 in each task was for customization process. 
% assisId = 3; %what kind of assistance is being offered. according to assis struct. 

if ~isSCI
    cType = indexH;
else
    cType = indexSCI;
end
eucDist = zeros(length(subList), 1);
firstDiff = zeros(3, length(subList));
secondDiff = zeros(3, length(subList));


%reaching near, 3d, all assis, means of each and std


allObjT = zeros(length(assisType), length(phases));
allObjTErr = zeros(length(assisType), length(phases));
allObjMS = zeros(length(assisType), length(phases));
allObjMSErr = zeros(length(assisType), length(phases));

allObjTCell = cell(length(assisType), length(phases));
allObjMSCell = cell(length(assisType), length(phases));

timeVarH = [];
modeVarH = [];
timeVarSCI = [];
modeVarSCI = [];

for k=1:length(assisType)
    timeVarH = [];
    modeVarH = [];
    timeVarSCI = [];
    modeVarSCI = [];
    for i=1:length(subList)
        subId = i;
        currUser = subList{subId};
        fnames = dir(currUser);
        numfids = length(fnames);
        for j=3:numfids
           n = fnames(j).name;
           temp = n;
           n(1:length(subList{subId})) = []; %remove subject name
           taskId = n(1:2); %save task type t2 or t3,
           n(1:2) = []; %remove t2 or t3
           if(findstr(n, 'ph2'))
                n(1:3) = []; %remove ph2
                n(end-3:end) = []; %strip away .mat extension
                if(findstr(n, assisType{k})) %see if the file is of required assistance type
                    if k < 4
                        n(1:length(assisType{k})) = [];
                    else
                        n(1:length(assisType{k})+1) = [];
                    end
                    n = str2num(n); % row number
                    
                    if(strcmp(taskId,'t2'))
                        time = t2order(n,1,subId);
                        modes = t2order(n, 2, subId);
                    else
                        time = t3order(n,1,subId);
                        modes = t3order(n, 2, subId);
                    end
                    if(any(i==indexH))
                        fprintf('The task 1 file is %s\n', temp);
                        timeVarH = [timeVarH time]; modeVarH = [modeVarH modes];
                    else
                        fprintf('The task 2 file is %s\n', temp);
                        timeVarSCI = [timeVarSCI time]; modeVarSCI = [modeVarSCI modes];
                    end
                end
           end
        end
    end
    allObjTCell{k, 1} = timeVarH; allObjTCell{k,2} = timeVarSCI;
    allObjMSCell{k,1} = modeVarH; allObjMSCell{k,2} = modeVarSCI;
    allObjT(k, 1) = mean(timeVarH)'; allObjTErr(k, 1) = std(timeVarH)'/sqrt(length(timeVarH));
    allObjT(k, 2) = mean(timeVarSCI)'; allObjTErr(k, 2) = std(timeVarSCI)'/sqrt(length(timeVarSCI));
    allObjMS(k,1) = mean(modeVarH)'; allObjMSErr(k,1) = std(modeVarH)'/sqrt(length(modeVarH));
    allObjMS(k,2) = mean(modeVarSCI)'; allObjMSErr(k,2) = std(modeVarSCI)'/sqrt(length(modeVarSCI));
end


% 
% %plot stuff
% figure;
% 
% 
% h2 = bar(allObjT);
% set(h2, 'BarWidth', 1);
% legend(h2, legendList);
% ylim([0, 85]);
% set(gca,'XTickLabel',assisType);
% 
% xlabel('Assistance Type'); ylabel('Time taken (s)');
% numgroups =  size(allObjT, 1);
% numbars = size(allObjT, 2);
% groupwidth = min(0.8, numbars/(numbars+1.5));
% hold on;
% for i = 1:numbars
%       % Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
%       x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);  % Align
%       errorbar(x, allObjT(:,i), allObjTErr(:,i), 'r', 'linestyle', 'none');
% end
% 
% figure;
% h1 = bar(allObjMS);
% set(h1, 'BarWidth', 1);
% legend(h1, legendList);
% ylim([0,10]);
% set(gca,'XTickLabel',assisType);
% 
% xlabel('Assistance Type'); ylabel('Number of Mode Switches');
% numgroups =  size(allObjMS, 1);
% numbars = size(allObjMS, 2);
% groupwidth = min(0.8, numbars/(numbars+1.5));
% hold on;
% for i = 1:numbars
%       % Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
%       x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);  % Align
%       errorbar(x, allObjMS(:,i), allObjMSErr(:,i), 'r', 'linestyle', 'none');
% end

%Scatter test
% figure;
subplot(2,3,1);
numgroups =  size(allObjT, 1);
numbars = size(allObjT, 2);
groupwidth = min(0.8, numbars/(numbars+1.5)) + 0.15;
pvalsx = zeros(length(assisType), 2);
for i=1:numbars
    x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);  % Align
    pvalsx(:,i) = x';
    for j=1:length(x)
        scatter(x(j)*ones(1,length(cell2mat(allObjTCell(j,i)))), cell2mat(allObjTCell(j,i)), 'o', colorList{i}, 'LineWidth', 1.0);
        hold on;
        scatter(x(j), mean(cell2mat(allObjTCell(j,i))), 200,'X', 'b', 'LineWidth', 4.5); 
       
    end
end

set(gca, 'XTick', 1:5);
set(gca,'XTickLabel',assisType);
ylim([0, 110]);
xlabel('\fontsize{14}Assistance type'); ylabel({'\fontsize{20}Task Completion Time';'\fontsize{14}Time (s)'});
% title('Task completion time - Uninjured / SCI');
% title({'\fontsize{16}o  -  Uninjured       {\color{red} o  -  SCI}'; '             '});
title({'\fontsize{16} Uninjured vs. SCI';'             '});
grid on;

yd = (max(ylim) - min(ylim))*0.01;
pvals = [ 0.019965, 0.000001,  0.000264, 0.000008]; % *, ***, ***, ***
stars = {'***','***','*',' '};
fsize = [15,15,15,9];
offset =[0, 0,0, yd];
yoff = 83;
for i=1:numgroups
    line(pvalsx(i,:), (yoff+yd)*ones(1, 2), 'LineWidth', 2.0);
    line(repmat(pvalsx(i,1),1,2), [yoff+yd yoff-yd], 'LineWidth', 2.0);
    line(repmat(pvalsx(i,2),1,2), [yoff+yd yoff-yd], 'LineWidth', 2.0);
    text(mean(pvalsx(i,:)),yoff+3*yd + offset(i),stars{i},...
   	'HorizontalAlignment','Center',...
   	'BackGroundColor','none', 'FontSize', fsize(i));
end
text(max(xlim)/2 - 0.65, max(ylim)-3, '\fontsize{11}\color{black}o - Uninjured         \color{red}o - SCI', 'HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize', 10);
rectangle('Position',[(max(xlim)/2-0.75) max(ylim)-5.5 2.05 5], 'LineWidth', 0.6, 'LineStyle', ':');

% text(max(xlim)-1, max(ylim)-3, 'o - Uninjured', 'Color','k','HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize', 10);
% text(max(xlim)-1, max(ylim)-7, 'o - SCI', 'Color','r','HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize', 10);
% rectangle('Position',[max(xlim)-1.05 max(ylim)-10 1 10]);


%******************************MODE SWITCHES ******************************

% figure;
subplot(2,3,4);
numgroups =  size(allObjMS, 1);
numbars = size(allObjMS, 2);
groupwidth = min(0.8, numbars/(numbars+1.5)) + 0.15;
pvalsx = zeros(length(assisType), 2);
for i=1:numbars
    x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);  % Align
    pvalsx(:,i) = x';
    for j=1:length(x)
        scatter(x(j)*ones(1,length(cell2mat(allObjMSCell(j,i)))), cell2mat(allObjMSCell(j,i)), 'o', colorList{i}, 'LineWidth', 1.5);
        hold on;
        scatter(x(j), mean(cell2mat(allObjMSCell(j,i))), 200,'X', 'b', 'LineWidth', 4.5); 
    end
end

set(gca, 'XTick', 1:5);
set(gca,'XTickLabel',assisType);

ylim([0, 13]);
set(gca, 'YTick', 1:2:15)
xlabel('\fontsize{14}Assistance type'); ylabel({'\fontsize{20}Number of Mode Switches';'\fontsize{14} Count'});
% title('Number of mode switches - Uninjured / SCI');
grid on;

yd = (max(ylim) - min(ylim))*0.01;
pvals = [ 0.019965, 0.000001,  0.000264, 0.000008]; % *, ***, ***, ***
stars = {' ',' ',' ',' '};
yoff = 9;
for i=1:numgroups
    line(pvalsx(i,:), (yoff+yd)*ones(1, 2), 'LineWidth', 2.0);
    line(repmat(pvalsx(i,1),1,2), [yoff yoff+yd], 'LineWidth', 2.0);
    line(repmat(pvalsx(i,2),1,2), [yoff yoff+yd], 'LineWidth', 2.0);
    text(mean(pvalsx(i,:)),yoff+4*yd,stars{i},...
   	'HorizontalAlignment','Center',...
   	'BackGroundColor','none', 'FontSize', 10);
end
text(max(xlim)/2-0.67, max(ylim)-0.6, '\fontsize{11}\color{black}o - Uninjured         \color{red}o - SCI', 'HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize', 10);
rectangle('Position',[(max(xlim)/2-0.71) max(ylim)-1 1.9 1], 'LineWidth', 0.6, 'LineStyle', ':');
% acrossT1T2HSCI;
% text(max(xlim)-1, max(ylim)-0.8, 'o - Uninjured', 'Color','k','HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize', 10);
% text(max(xlim)-1, max(ylim)-1.5, 'o - SCI', 'Color','r','HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize', 10);
% rectangle('Position',[max(xlim)-1.05 max(ylim)-2 1 1.8]);
% pairwiseTelCompare;