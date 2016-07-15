clear all; clc; close all;
loadQData;
qAnsData(:,1) = [];
elimList = [2,3,4,5,8,9,10,13,14,15,16,17,18];
qAnsData(:,elimList) = [];
data = qAnsData;

% data = qAnsData(1:13,:);
% data = qAnsData(14:17, :);
% plot(mean(data), 'LineWidth', 2.0)
% grid on;
% ylim([1,7])
% set(gca, 'YTick', 1:0.5:7);
% hold on;
% scatter(1:19, mean(data), 'LineWidth', 1.5);
% set(gca, 'XTick', 1:19);
% 
% line([1.5,1.5], [1,7], 'LineWidth', 1.0,'Color', 'r');
% line([3.5,3.5], [1,7], 'LineWidth', 1.0,'Color', 'r');
% 
% line([8.5,8.5], [1,7], 'LineWidth', 1.0,'Color', 'r');
% line([10.5,10.5], [1,7], 'LineWidth', 1.0,'Color', 'r');
% line([13.5,13.5], [1,7], 'LineWidth', 1.0,'Color', 'r');
% line([15.5,15.5], [1,7], 'LineWidth', 1.0,'Color', 'r');
% 
% text(1.6, 2, 'Utility', 'HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize', 10);
% text(3.6, 2, 'Contribution', 'HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize', 10);
% text(8.6, 2, 'Trust', 'HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize', 10);
% text(10.6, 2, 'Capability', 'HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize', 10);
% text(13.6, 2, 'Traits', 'HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize', 10);
% text(15.6, 2, 'Demographics', 'HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize', 10);
% 
% xlabel('Questions');
% ylabel('Likert Scale');
% 
%scatter plot
figure;
% h = histogram(qAnsData(:,7));
% 
% distri = h.Values;
% close all;
% scatter(7*ones(17,1), qAnsData(:,7),'LineWidth', 2 );
% vals = unique(qAnsData(:,7));
% for i=1:length(vals)
%     scatter(7, vals(i), distri(i)*60, 'LineWidth', 2);
%     hold on;
% end
offset = 0.08;
for i=1:size(data, 2)
%     h = histogram(qAnsData(:,i));
%     distri = h.Values;
    vals = unique(qAnsData(:,i));
    distri = [];
    for p=1:length(vals)
        distri(p) = sum(qAnsData(:,i) == vals(p));
    end
    for j=1:length(distri)
        if mod(distri(j),2) == 0 
            if distri(j) > 0
                poslist = -(distri(j)/2):(distri(j)/2);
                poslist(poslist == 0) = [];
                for k=1:length(poslist)
                    scatter(i + offset*poslist(k), vals(j), 'r',  'LineWidth', 1.5);
                end
            else
                scatter(i,vals(j), 'LineWidth', 1.5 );
            end
        else
            if distri(j) > 1
                poslist =  -(distri(j)-1)/2:(distri(j)-1)/2;
                for k=1:length(poslist)
                    scatter(i + offset*poslist(k), vals(j),'r', 'LineWidth', 1.5);
                end
            else
                 scatter(i,vals(j), 'r','LineWidth', 1.5 );
            end
        end
        hold on;
    end
%     scatter(i*ones(17,1), qAnsData(:,i),'LineWidth', 2 );
%     hold on;
end
% plot(mean(data), 'k', 'LineWidth', 2.0);
errorbar(mean(data), std(data, 1), 'bx', 'LineWidth',2, 'MarkerSize', 18);
grid on;
xlabel('\fontsize{14}Questions');
ylabel('\fontsize{11}Disagreement\leftarrowLikert Scale\rightarrowAgreement');
ylim([0,7])
set(gca, 'XTick', 1:(size(data,2)));
% set(gca, 'FontSize', 15);
set(gca, 'XTickLabel',{'U1', 'CO1','CO2','CA1','CA2'})
% 
line([1.5,1.5], [0,8], 'LineWidth', 1.0,'Color', 'k');
line([3.5,3.5], [0,8], 'LineWidth', 1.0,'Color', 'k');
% 
% line([7.5,7.5], [0,8], 'LineWidth', 1.0,'Color', 'g');
% line([9.5,9.5], [0,8], 'LineWidth', 1.0,'Color', 'g');
% line([12.5,12.5], [0,8], 'LineWidth', 1.0,'Color', 'g');
% % line([14.5,14.5], [0,8], 'LineWidth', 1.0,'Color', 'g');
% 
text(1, 0.5, 'Utility', 'HorizontalAlignment', 'Center','BackGroundColor','none', 'FontSize', 10);
text(2.5, 0.5, 'Contribution', 'HorizontalAlignment', 'Center','BackGroundColor','none', 'FontSize', 10);
% text(7.6, 1.5, 'Trust', 'HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize', 10);
text(4.5, 0.5, 'Capability', 'HorizontalAlignment', 'Center','BackGroundColor','none', 'FontSize', 10);
% text(12.6, 1.5, 'Traits', 'HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize', 10);
% % text(14.6, 1.5, 'Demographics', 'HorizontalAlignment', 'Left','BackGroundColor','none', 'FontSize', 10);
% % 
% title('\fontsize{16}User Survey Responses')



