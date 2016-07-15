
%For pairwise comparison between teleop and other assistance levels
allObjMSPairCell2d = cell(3,2);
allObjMSPairCell2d(:,1) = repmat(allObjMSCell(1,1),3,1);
allObjMSPairCell2d(:,2) = allObjMSCell(2:4, 1);
% figure;
subplot(2,2,2);
numgroups =  size(allObjMSPairCell2d, 1);
numbars = size(allObjMSPairCell2d, 2);
groupwidth = min(0.8, numbars/(numbars+1.5)) + 0.15;
pvalsx = zeros(length(assisType) - 1, 2);
for i=1:numbars
    x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);  % Align
     pvalsx(:,i) = x';
    for j=1:length(x)
        scatter(x(j)*ones(1,length(cell2mat(allObjMSPairCell2d(j,i)))), cell2mat(allObjMSPairCell2d(j,i)), 'o', colorList{i}, 'LineWidth', 1.5);
        hold on;
        scatter(x(j), mean(cell2mat(allObjMSPairCell2d(j,i))), 200,'X', 'b', 'LineWidth', 4.5); 
    end
end


ylim([0, 13]);
set(gca, 'YTick', 1:2:13)
xlabel('\fontsize{17}Assistance Pair Type'); ylabel('\fontsize{17}Number of mode switches');
% title('Number of mode switches - Pairwise comparison - 2d', 'FontSize', 9);
title({'\fontsize{15} Assistance Level Comparison';'\fontsize{12}2D Interface'});
set(gca, 'XTick', 1:5);
xt = get(gca, 'XTick');
set(gca, 'FontSize', 14);
set(gca,'XTickLabel',{' tel   min', 'tel   max', 'tel   custom'});
grid on;

yd = (max(ylim) - min(ylim))*0.01;
pvals = [ 0.019965, 0.000001,  0.000264, 0.000008]; % *, ***, ***, ***
stars = {'  ','***','***'};
offset = [yd*2,0,0];
fsize = [9, 15, 15];
yoff = 9;
for i=1:numgroups
    line(pvalsx(i,:), (yoff+yd)*ones(1, 2), 'LineWidth', 2.0);
    line(repmat(pvalsx(i,1),1,2), [yoff yoff+yd], 'LineWidth', 2.0);
    line(repmat(pvalsx(i,2),1,2), [yoff yoff+yd], 'LineWidth', 2.0);
    text(mean(pvalsx(i,:)),yoff+yd+yd + offset(i),stars{i},...
   	'HorizontalAlignment','Center',...
   	'BackGroundColor','none', 'FontSize', fsize(i));
end



allObjMSPairCell3d = cell(3,2);
allObjMSPairCell3d(:,1) = repmat(allObjMSCell(1,2),3,1);
allObjMSPairCell3d(:,2) = allObjMSCell(2:4, 2);

% figure;
subplot(2,2,4);
numgroups =  size(allObjMSPairCell3d, 1);
numbars = size(allObjMSPairCell3d, 2);
groupwidth = min(0.8, numbars/(numbars+1.5)) + 0.15;

for i=1:numbars
    x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);  % Align
    for j=1:length(x)
        scatter(x(j)*ones(1,length(cell2mat(allObjMSPairCell3d(j,i)))), cell2mat(allObjMSPairCell3d(j,i)), 'o', colorList{i}, 'LineWidth', 1.5);
        hold on;
        scatter(x(j), mean(cell2mat(allObjMSPairCell3d(j,i))), 200,'X', 'b', 'LineWidth', 4.5); 
    end
end


ylim([0, 13]);
set(gca, 'YTick', 1:2:13)
xlabel('\fontsize{17}Assistance Pair Type'); ylabel('\fontsize{17}Number of mode switches');
% title('Number of mode switches - Pairwise comparison - 3d', 'FontSize', 9);
title({'\fontsize{15}                     ';'\fontsize{12}3D Interface'});
set(gca, 'XTick', 1:5);
xt = get(gca, 'XTick');
set(gca, 'FontSize', 14);
set(gca,'XTickLabel',{' tel   min', 'tel   max', 'tel   custom'});
grid on;


yd = (max(ylim) - min(ylim))*0.01;
pvals = [ 0.019965, 0.000001,  0.000264, 0.000008]; % *, ***, ***, ***
stars = {'***','***','***'};
offset = [0,0,0];
fsize = [15, 15, 15];
yoff = 9;
for i=1:numgroups
    line(pvalsx(i,:), (yoff+yd)*ones(1, 2), 'LineWidth', 2.0);
    line(repmat(pvalsx(i,1),1,2), [yoff yoff+yd], 'LineWidth', 2.0);
    line(repmat(pvalsx(i,2),1,2), [yoff yoff+yd], 'LineWidth', 2.0);
    text(mean(pvalsx(i,:)),yoff+yd+yd + offset(i),stars{i},...
   	'HorizontalAlignment','Center',...
   	'BackGroundColor','none', 'FontSize', fsize(i));
end