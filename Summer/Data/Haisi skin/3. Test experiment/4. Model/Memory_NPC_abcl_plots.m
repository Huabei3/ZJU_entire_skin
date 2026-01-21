% a: preference   a1: Colourfulness  a2: Naturalness
load('Memory_1105.mat');


% subplot(1,2,1);
% subplot('position', [0.04 0.12 0.32 0.74]);  
scatter(a(:,2),a(:,3),'filled');hold on;
scatter(a1(:,2),a1(:,3),'filled');hold on;
scatter(a2(:,2),a2(:,3),'filled');hold on;
for i=1:29
plot([a(i,2),a1(i,2)],[a(i,3),a1(i,3)],'Color',[0.3,0.3,0.3]);
plot([a(i,2),a2(i,2)],[a(i,3),a2(i,3)],'Color',[0.3,0.3,0.3]);
text(a(i,2),a(i,3)-2,num2str(i));
end
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,120],[0,0],'Color',[0.5,0.5,0.5]);
axis([-100 100 -80 120]);hold on;grid on;
set(gca,'XTick',[-100:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:20:120]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title('Memory results on CIELAB a*b*');

% subplot(1,2,2);
% subplot('position', [0.44 0.12 0.52 0.74]);
% scatter(a(:,4),a(:,1),'filled');hold on;
% scatter(a1(:,4),a1(:,1),'filled');hold on;
% scatter(a2(:,4),a2(:,1),'filled');hold on;
% for i=1:29
% plot([a(i,4),a1(i,4)],[a(i,1),a1(i,1)],'Color',[0.3,0.3,0.3]);
% plot([a(i,4),a2(i,4)],[a(i,1),a2(i,1)],'Color',[0.3,0.3,0.3]);
% text(a(i,4),a(i,1)-2,num2str(i));
% end
% plot([0,0],[0,100],'Color',[0.5,0.5,0.5]);
% plot([0,130],[0,0],'Color',[0.5,0.5,0.5]);
% axis([0 130 0 100]);hold on;grid on;
% set(gca,'XTick',[0:10:130]);%设置要显示坐标刻度
% set(gca,'YTick',[0:10:100]);%设置要显示坐标刻度
% xlabel('C*','FontSize',15);
% ylabel('L*','FontSize',15);
% title('Memory results on CIELAB C*L*');