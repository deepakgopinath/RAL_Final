%The null hypothesis is that there are no difference between the two groups
%h=1 rejects the null hypothesis. For assistance levels we want to accept
%null hypothesis. which means h=0;

%h = 0 implies no difference between the two groups. h=1 there is a
%statistical difference
x1 = cell2mat(allObjTCell(4,1));
x2 = cell2mat(allObjTCell(4,2));
[h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.05);
fprintf('Tel - Value of h is %d and p-value is %f\n',h, p);
    % 
%     x1 = cell2mat(allObjMSCell(3,2));
%     x2 = cell2mat(allObjMSCell(4,2));
%     [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
%     fprintf('Tel - Value of h is %d and p-value is %f\n',h, p);
% 
% x1 = cell2mat(allObjTCell(1,2));
% x2 = cell2mat(allObjTCell(4,2));
% [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
% fprintf('Tel - Value of h is %d and p-value is %f\n',h, p);
% % 
% x1 = cell2mat(allObjTCell(2,1));
% x2 = cell2mat(allObjTCell(2,2));
% [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
% fprintf('Min - Value of h is %d and p-value is %f\n',h, p);
% 
% x1 = cell2mat(allObjTCell(3,1));
% x2 = cell2mat(allObjTCell(3,2));
% [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
% fprintf('Max - Value of h is %d and p-value is %f\n',h, p);
% 
% x1 = cell2mat(allObjTCell(4,1));
% x2 = cell2mat(allObjTCell(4,2));
% [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
% fprintf('Custom - Value of h is %d and p-value is %f\n',h, p);

% 
% x1 = cell2mat(allObjMSCell(3,1));
% x2 = cell2mat(allObjMSCell(4,1));
% [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
% fprintf('Tel - Value of h is %d and p-value is %f\n',h, p);
% 
% x1 = cell2mat(allObjMSCell(3,2));
% x2 = cell2mat(allObjMSCell(4,2));
% [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
% fprintf('Tel - Value of h is %d and p-value is %f\n',h, p);
% x1 = cell2mat(allObjMSCell(2,1));
% x2 = cell2mat(allObjMSCell(2,2));
% [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
% fprintf('Min - Value of h is %d and p-value is %f\n',h, p);
% 
% x1 = cell2mat(allObjMSCell(3,1));
% x2 = cell2mat(allObjMSCell(3,2));
% [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
% fprintf('Max - Value of h is %d and p-value is %f\n',h, p);
% 
% x1 = cell2mat(allObjMSCell(4,1));
% x2 = cell2mat(allObjMSCell(4,2));
% [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
% fprintf('Custom - Value of h is %d and p-value is %f\n',h, p);

% [h,p] = ttest2(y1,y2, 'VarType', 'unequal', 'Alpha', 0.01);

% ****************8
% x1 = cell2mat(allObjMSPairCell2d(1,1));
% x2 = cell2mat(allObjMSPairCell2d(1,2));
% [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
% fprintf('Tel - Value of h is %d and p-value is %f\n',h, p);
% 
% x1 = cell2mat(allObjMSPairCell2d(2,1));
% x2 = cell2mat(allObjMSPairCell2d(2,2));
% [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
% fprintf('Min - Value of h is %d and p-value is %f\n',h, p);
% 
% x1 = cell2mat(allObjMSPairCell2d(3,1));
% x2 = cell2mat(allObjMSPairCell2d(3,2));
% [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
% fprintf('Max - Value of h is %d and p-value is %10f\n',h, p);




% 
% x1 = cell2mat(allObjMSPairCell3d(1,1));
% x2 = cell2mat(allObjMSPairCell3d(1,2));
% [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
% fprintf('Tel - Value of h is %d and p-value is %f\n',h, p);
% 
% x1 = cell2mat(allObjMSPairCell3d(2,1));
% x2 = cell2mat(allObjMSPairCell3d(2,2));
% [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
% fprintf('Min - Value of h is %d and p-value is %f\n',h, p);
% 
% x1 = cell2mat(allObjMSPairCell3d(3,1));
% x2 = cell2mat(allObjMSPairCell3d(3,2));
% [h,p] = ttest2(x1,x2,'VarType', 'unequal', 'Alpha', 0.01);
% fprintf('Max - Value of h is %d and p-value is %10f\n',h, p);

