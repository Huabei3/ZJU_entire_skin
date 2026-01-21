% % clear all
% % load('memory0722cpn.mat');
scatter(a(:,2),a(:,3),'filled');hold on;
scatter(a1(:,2),a1(:,3),'filled');hold on;
% scatter(a2(:,2),a2(:,3),'filled');hold on;
% scatter(a3(:,2),a3(:,3),'filled');hold on;
for i=1:12
plot([a(i,2),a1(i,2)],[a(i,3),a1(i,3)],'Color',[0.3,0.3,0.3]);
% plot([a1(i,2),a2(i,2)],[a1(i,3),a2(i,3)],'Color',[0.8,0.8,0.8]);
% plot([a2(i,2),a3(i,2)],[a2(i,3),a3(i,3)],'Color',[0.8,0.8,0.8]);
text(a1(i,2),a1(i,3)-5,num2str(i));
end
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
axis([-100 100 -100 120]);hold on;grid on;
set(gca,'XTick',[-100:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:20:120]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title('Preferred results on CIELAB a*b*');


% scatter(a(:,4),a(:,1),'filled');hold on;
% scatter(a1(:,4),a1(:,1),'filled');hold on;
% % scatter(a2(:,4),a2(:,1),'filled');hold on;
% %  scatter(a3(:,4),a3(:,1),'filled');hold on;
% for i=1:12
% plot([a(i,4),a1(i,4)],[a(i,1),a1(i,1)],'Color',[0.3,0.3,0.3]);
% % plot([a1(i,4),a2(i,4)],[a1(i,1),a2(i,1)],'Color',[0.8,0.8,0.8]);
% % plot([a2(i,4),a3(i,4)],[a2(i,1),a3(i,1)],'Color',[0.8,0.8,0.8]);
% text(a1(i,4),a1(i,1)-5,num2str(i));
% end
% plot([0,0],[0,100],'Color',[0.5,0.5,0.5]);
% plot([0,120],[0,0],'Color',[0.5,0.5,0.5]);
% axis([0 120 0 100]);hold on;grid on;
% set(gca,'XTick',[0:10:120]);%设置要显示坐标刻度
% set(gca,'YTick',[0:10:100]);%设置要显示坐标刻度
% xlabel('C*','FontSize',15);
% ylabel('L*','FontSize',15);
% title('Preferred results on CIELAB C*L*');