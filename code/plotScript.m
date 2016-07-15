
figure;

h1 = bar(allObjMS);
set(h1, 'BarWidth', 1);
legend(h1, legendList);
ylim([0,10]);
set(gca,'XTickLabel',assisType);
title('Mode switches for all subjects - 3d');
xlabel('Assistance Type'); ylabel('Number of Mode Switches');
numgroups =  size(allObjMS, 1);
numbars = size(allObjMS, 2);
groupwidth = min(0.8, numbars/(numbars+1.5));
hold on;
for i = 1:numbars
      % Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
      x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);  % Align
      errorbar(x, allObjMS(:,i), allObjMSErr(:,i), 'r', 'linestyle', 'none');
end

figure;

h2 = bar(allObjT);
set(h2, 'BarWidth', 1);
legend(h2, legendList);
ylim([0, 60]);
set(gca,'XTickLabel',assisType);
title('Task completion times for all subjects - 3d');
xlabel('Assistance Type'); ylabel('Time taken (s)');
numgroups =  size(allObjT, 1);
numbars = size(allObjT, 2);
groupwidth = min(0.8, numbars/(numbars+1.5));
hold on;
for i = 1:numbars
      % Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
      x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);  % Align
      errorbar(x, allObjT(:,i), allObjTErr(:,i), 'r', 'linestyle', 'none');
end

% 
% figure;
% %across all tasks. 
% 
% allTasksT = mean(allObjT');
% stdAllTasksT = std(allObjTErr');
% h3 = bar(allTasksT); hold on;
% errorbar(allTasksT, stdAllTasksT, 'r', 'LineStyle', 'none');
% ylim([0, 60]);
% set(gca,'XTickLabel',assisType);
% title('Task completion times for all subjects and tasks - 3d');
% xlabel('Assistance Type'); ylabel('Time taken (s)');


% figure;
% 
% %across, reaching and scooping
% 
% allTTasks = [mean(allObjT(:,1:2)') mean(allObjT(:, 3:4)')];
% 
% h2 = bar(allTTasks);
% set(h2, 'BarWidth', 1);
% legend(h2, legendList);
% ylim([0, 60]);
% set(gca,'XTickLabel',assisType);
% title('Task completion times for all subjects - 3d');
% xlabel('Assistance Type'); ylabel('Time taken (s)');
% numgroups =  size(allTTasks, 1);
% numbars = size(allTTasks, 2);
% groupwidth = min(0.8, numbars/(numbars+1.5));
% hold on;
% for i = 1:numbars
%       % Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
%       x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);  % Align
%       errorbar(x, allTTasks(:,i), allObjTErr(:,i), 'r', 'linestyle', 'none');
% end
% 
