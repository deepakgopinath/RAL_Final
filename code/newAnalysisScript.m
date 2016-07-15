clear; clc;

subList = {'h1', 'h2', 'h3', 'h4', 'h5', 'h6','h7','h8', 'h9','h10', 'h11', 'h12','h13', 's1', 's2','s3', 's4'};

index3d = [1,2,3,4,5,9,13,14,16,17];
index2d = [6,7,8,10,11,12,15];

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
% assis = {'tel', 'mid', 'min', 'max', 'customa', 'customb'};
colorList = {'r', 'g', 'b', 'm', 'c'};
objType = {'near', 'far'};
tasktype = {'reaching', 'scooping'};
assisType = {'tel','min','max','customa', 'customb' };
colorList = {'k','r', 'g', 'b', 'm', 'c'};
legendList = {'RfG - Near','RfG - Far','RfS - Near','RfS - Far'};
%Query stuff
is3d = true;
isSCI = false;
% objNum = 0; % 0 for near and 1 for far. 
% phaseId = 2; % for the most part for each task only phase matters. phase 1 in each task was for customization process. 
% assisId = 3; %what kind of assistance is being offered. according to assis struct. 

if is3d
    cType = index3d; 
    if ~isSCI
        nSCI = 3;
    else
        nSCI = 0;
    end
else
    cType = index2d; 
     if ~isSCI
        nSCI = 1;
    else
        nSCI = 0;
    end
end
eucDist = zeros(length(subList), 1);
firstDiff = zeros(3, length(subList));
secondDiff = zeros(3, length(subList));
timeVar = [];

%reaching near, 3d, all assis, means of each and std
allT = zeros(length(assisType),1);
allTErr = zeros(length(assisType), 1);
allObjT = zeros(length(assisType), length(objType)*length(tasktype));
allObjTErr = zeros(length(assisType), length(objType)*length(tasktype));

allMS = zeros(length(assisType),1);
allMSErr = zeros(length(assisType),1);
allObjMS = zeros(length(assisType), length(objType)*length(tasktype));
allObjMSErr = zeros(length(assisType), length(objType)*length(tasktype));

for q=0:length(tasktype)-1
    for m=0:length(objType)-1
        for k=1:length(assisType)
            timeVar = [];
            modeVar = [];
            for i=1:length(cType) - nSCI

                %variables that will set the appropriate query. For each subject
                %specify
                %1. Task interested - Reaching of scooping
                %2. Near of far. objNum 0 or 1
                %3. assistance level = assiId
                %4. phaseId = 1 or 2. For the most part it will be 2. 
                subId = cType(i);
                currUser = subList{subId};
                fnames = dir(currUser);

                % change the flags according to whether which one of reaching or scooping is being
                % analyzed
                if q==0
                    reachingId = subId;
                    scoopingId = -1; 
                end
                if q==1
                    reachingId = -1;
                    scoopingId = subId; 
                end
                
                if(strcmp(objType{m+1}, 'near'))
                    objNum = 0;
                end
                if(strcmp(objType{m+1}, 'far'))
                    objNum = 1;
                end
%                 objNum = m; % 0 for near and 1 for far. 
                phaseId = 2; % for the most part for each task only phase matters. phase 1 in each task was for customization process. 
                assisId = assisType{k}; %what kind of assistance is being offered. according to assis struct. 

                eucDist(subId) = sqrt(sum((arbVals(4, :, subId) - arbVals(5, :, subId)).^2)); %euclidean distance between customa and customb
                firstDiff(:, subId) = arbVals(2, :, subId)' - arbVals(4, :, subId)'; % first diff between starting point (mid) and custom a (during customization process
                secondDiff(:,subId) = arbVals(4, :, subId)' - arbVals(5, :, subId)'; % diff between the starting point and end point of second stage customization. between customa and customb
                 if reachingId ~= -1
                    if strcmp(reaching{reachingId}, 't2')
                        tasktype = t2order(:,3,subId);
                    else 
                        tasktype = t3order(:,3, subId);
                    end
                 end

                 if scoopingId ~= -1
                    if strcmp(scooping{scoopingId}, 't2')
                        tasktype = t2order(:,3, subId);
                    else
                        tasktype = t3order(:,3, subId);
                    end
                 end

                 %time for all min, reaching near, 3d

                 ind = find(tasktype == objNum); % all rows where the task type is near or far
                 numfids = length(fnames);
                 for j=3:numfids% the first two names are. and .. discard them. some weird directory sturcture stuff. 
                    n = fnames(j).name;
                    if reachingId ~= -1
                     subString = strcat(subList{subId}, reaching{reachingId}, phases{phaseId});
                    elseif scoopingId ~= -1
                     subString = strcat(subList{subId}, scooping{scoopingId}, phases{phaseId});
                    end

                    if (strcmp(n(1:length(subString)), subString))
                        temp = n; %store the full file name for later.
                        n(1:length(subString)) = []; %begin striping down the filename for narrowing down the match
                        n(end-3:end) = []; %strip away .mat extension
                        if findstr(n,assisId)
                            n(1:length(assisId)) = [];
                            n = str2num(n); % this corresponds to the trial number, which in turn corresponds to the row number. 

                            if (length(find(ind == n)) >= 1)
%                                 disp(temp);
                                if reachingId ~= -1
                                    if strcmp(reaching{reachingId}, 't2')
                                        prefMode = t2pref{subId};
                                        time = t2order(n,1,subId);
                                        modeSwitches = t2order(n, 2, subId);
                                    else 
                                        prefMode = t3pref{subId};
                                        time = t3order(n,1, subId);
                                        modeSwitches = t3order(n, 2, subId);
                                    end
                                end

                                if scoopingId ~= -1
                                    if strcmp(scooping{scoopingId}, 't2')
                                        prefMode = t2pref{subId};
                                        time = t2order(n,1,subId);
                                        modeSwitches = t2order(n, 2, subId);
                                    else
                                        prefMode = t3pref{subId};
                                        time = t3order(n,1, subId);
                                        modeSwitches = t3order(n, 2, subId);
                                    end
                                end

                                timeVar = [timeVar time];
                                modeVar = [modeVar modeSwitches];
                            end

                        end
                    end

                 end
            end
            allT(k) = mean(timeVar); allTErr(k) = std(timeVar)/sqrt(length(timeVar));
            allMS(k) = (mean(modeVar)); allMSErr(k) =  std(modeVar)/sqrt(length(modeVar));;%round(floor(std(modeVar)/sqrt(length(modeVar))));
        end
        
        allObjT(:,bin2dec(strcat(num2str(q), num2str(m)))+1) = allT;
        allObjTErr(:,bin2dec(strcat(num2str(q), num2str(m)))+1) = allTErr;
        allObjMS(:,bin2dec(strcat(num2str(q), num2str(m)))+1) = allMS;
        allObjMSErr(:,bin2dec(strcat(num2str(q), num2str(m)))+1) = allMSErr;
    end
end

plotScript;