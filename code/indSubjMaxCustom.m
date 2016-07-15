clear; clc; close all;
subList = {'h1', 'h2', 'h3', 'h4', 'h5', 'h6','h7','h8', 'h9','h10', 'h11', 'h12','h13', 's1', 's2','s3', 's4'};
% subList = {'s1', 's2','s3', 's4'};
% subList = {'h1', 'h2', 'h3', 'h4', 'h5', 'h6','h7','h8', 'h9','h10', 'h11', 'h12','h13'};

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

%For everysubject for every task (t1 and t2), compare max and custom.
%collect all max and custom, compute mean, do wilcoxon rank test and find
%stat significance. store it.
t2maxTCell = cell(length(subList),1);
t3maxTCell = cell(length(subList),1);
t2customTCell = cell(length(subList),1);
t3customTCell = cell(length(subList),1);

t2maxMSCell = cell(length(subList),1);
t3maxMSCell = cell(length(subList),1);
t2customMSCell = cell(length(subList),1);
t3customMSCell = cell(length(subList),1);

t2maxTMean = zeros(length(subList),1);
t3maxTMean = zeros(length(subList),1);
t2customTMean = zeros(length(subList),1);
t3customTMean = zeros(length(subList),1);

t2maxMSMean = zeros(length(subList),1);
t3maxMSMean = zeros(length(subList),1);
t2customMSMean = zeros(length(subList),1);
t3customMSMean = zeros(length(subList),1);

t2maxTVar = [];
t2customTVar = [];
t3maxTVar = [];
t3customTVar = [];

t2maxMSVar = [];
t2customMSVar = [];
t3maxMSVar = [];
t3customMSVar = [];

for i=1:length(subList)
    t2maxTVar = [];
    t2customTVar = [];
    t3maxTVar = [];
    t3customTVar = [];

    t2maxMSVar = [];
    t2customMSVar = [];
    t3maxMSVar = [];
    t3customMSVar = [];                                     
    subId = i;
    currUser = subList{subId};
    fnames = dir(currUser);
    numfids = length(fnames);
    for j=3:numfids
        n = fnames(j).name;
        temp = n;
        n(1:length(subList{subId})) = []; %remove subject name
        taskId = n(1:2); %save task type t2 or t3,
        n(1:2) = [];
        if(findstr(n, 'ph2')) %only interested in data collecting trials. 
            n(1:3) = []; %remove ph2
            n(end-3:end) = []; %strip away .mat extension
            if(strcmp(taskId, 't2'))
                if(strfind(n, 'max'))
                    n(1:length('max')) = [];
                    n = str2num(n);
                    t2maxTVar = [t2maxTVar t2order(n,1,subId)];
                    t2maxMSVar = [t2maxMSVar t2order(n,2,subId)];
                end
                if(strfind(n, 'custom'))
                    n(1:length('customa')) = [];
                    n = str2num(n);
                    t2customTVar = [t2customTVar t2order(n,1,subId)];
                    t2customMSVar = [t2customMSVar t2order(n,2,subId)];
                end
                
            end
            if(strcmp(taskId, 't3'))
%                 disp(taskId);
%                 disp(n);
                if(strfind(n, 'max'))
                    n(1:3) = [];
                    n = str2num(n);
                    t3maxTVar = [t3maxTVar t3order(n,1,subId)];
                    t3maxMSVar = [t3maxMSVar t3order(n,2,subId)];
                end
                if(strfind(n, 'custom'))
                    n(1:length('customa')) = [];
                    n = str2num(n);
                    t3customTVar = [t3customTVar t3order(n,1,subId)];
                    t3customMSVar = [t3customMSVar t3order(n,2,subId)];
                end
            end
        end
    end
    t2maxTMean(subId) = mean(t2maxTVar); t2customTMean(subId) = mean(t2customTVar);
    t2maxMSMean(subId) = mean(t2maxMSVar); t2customMSMean(subId) = mean(t2customMSVar);
    t3maxTMean(subId) = mean(t3maxTVar); t3customTMean(subId) = mean(t3customTVar);
    t3maxMSMean(subId) = mean(t3maxMSVar); t3customMSMean(subId) = mean(t3customMSVar);
    
    t2maxTCell{subId} = t2maxTVar; 
    t2customTCell{subId} = t2customTVar;
    t2maxMSCell{subId} = t2maxMSVar;
    t2customMSCell{subId} = t2customMSVar;
    
    t3maxTCell{subId} = t3maxTVar; 
    t3customTCell{subId} = t3customTVar;
    t3maxMSCell{subId} = t3maxMSVar;
    t3customMSCell{subId} = t3customMSVar;
end


%percentage of subjects in t2 for which time for custom is greater than max
percentTt2 = length(find((t2customTMean > t2maxTMean) == 1))/length(subList);
%percentage of subjects in t2 for which MS for custom is greater than max
percentMSt2 = length(find((t2customMSMean > t2maxMSMean) == 1))/length(subList);
%percentage of subjects in t3 for which time for custom is greater than max
percentTt3 = length(find((t3customTMean > t3maxTMean) == 1))/length(subList);
%percentage of subjects in t3 for which MS for custom is greater than max
percentMSt3 = length(find((t3customMSMean > t3maxMSMean) == 1))/length(subList);

t2pvalT = zeros(length(subList), 2);
t2pvalMS = zeros(length(subList), 2);
t3pvalT = zeros(length(subList), 2);
t3pvalMS = zeros(length(subList), 2);

for i=1:length(subList)
    x1 = t2maxMSCell{i};
    x2 = t2customMSCell{i};
    [p, h] = ranksum(x1,x2);
    t2pvalMS(i,1) = p; t2pvalMS(i,2) = h;
end