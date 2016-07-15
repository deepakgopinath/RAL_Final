% clear; clc;
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
for i=1:length(subList)
    arbVals(1, :, i) = [0.3; 0.9 ;0.3]'; %min
    arbVals(2, :, i) = [0.3; 0.7; 0.5]'; %mid
    arbVals(3, :, i) = [0.3, 0.5, 0.8]'; %max
end
loaddata;

firstDiff = zeros(length(subList), 3);
secondDiff = zeros(length(subList), 3);
for i=1:length(subList)
    firstDiff(i, :)  = arbVals(4, :, i) - arbVals(2, :, i); %customA - mid
    secondDiff(i, :) = arbVals(5, :, i) - arbVals(4, :, i); %customB - customA
end

lf = 0.92;
rf = 1.06;
fc = 0.4;
offset = 0.2;

% figure;
firstDiff(:, 1) = -firstDiff(:,1);
firstDiff(:, 2) = -firstDiff(:,2);
secondDiff(:,1) = -secondDiff(:,1);
secondDiff(:,2) = -secondDiff(:,2);