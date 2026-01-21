% % % load('plot_4groups.mat')
% fig=figure();
% set(fig,'Position', [100 100 400 400]);
% axis equal;grid on;
% hold on
% axis([-80 80 -80 120]);
% for i=1:15
% plot(a(i,2),a(i,3),'o','color',[35,124,205]./255,'MarkerFaceColor',[35,124,205]./255);
% % plot(a(i,2),a(i,3),'o','color',[0,185,0]./255,'MarkerFaceColor',[0,185,0]./255);
% plot(b(i,2),b(i,3),'o','color',[225,105,0]./255,'MarkerFaceColor',[225,105,0]./255);
% % plot(c(i,2),c(i,3),'s','color',[185,0,0]./255,'MarkerFaceColor',[185,0,0]./255);
% % plot(d(i,2),d(i,3),'p','color',[225,150,0]./255,'MarkerFaceColor',[225,150,0]./255);
% text(a(i,2)-5,a(i,3)-5,num2str(i),'fontsize',10);
% plot([a(i,2),b(i,2)],([a(i,3),b(i,3)]),'Color',[0.3,0.3,0.3]);
% end
% plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
% plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
% set(gca,'XTick',[-100:20:120]);%设置要显示坐标刻度
% set(gca,'YTick',[-100:20:120]);%设置要显示坐标刻度
% xlabel('a*','FontName','Times New Roman','FontSize',15);
% ylabel('b*','FontName','Times New Roman','FontSize',15);
% title('Compare CHN & PAK (3D Preferred)')
% % % =============================================================
fig=figure();
set(fig,'Position', [100 100 400 400]);
axis equal;grid on;
hold on
axis([0 110 10 90]);
for i=1:15
plot(a(i,4),a(i,1),'o','color',[35,124,205]./255,'MarkerFaceColor',[35,124,205]./255);
% plot(a(i,4),a(i,1),'o','color',[0,185,0]./255,'MarkerFaceColor',[0,185,0]./255);
plot(b(i,4),b(i,1),'o','color',[225,105,0]./255,'MarkerFaceColor',[225,105,0]./255);
% plot(c(i,4),c(i,1),'s','color',[185,0,0]./255,'MarkerFaceColor',[185,0,0]./255);
% plot(d(i,4),d(i,1),'p','color',[225,150,0]./255,'MarkerFaceColor',[225,150,0]./255);
text(a(i,4)+5,a(i,1),num2str(i),'fontsize',10);
plot([a(i,4),b(i,4)],([a(i,1),b(i,1)]),'Color',[0.3,0.3,0.3]);
end
set(gca,'XTick',[-100:10:110]);%设置要显示坐标刻度
set(gca,'YTick',[-100:10:100]);%设置要显示坐标刻度
xlabel('C*','FontName','Times New Roman','FontSize',15);
ylabel('L*','FontName','Times New Roman','FontSize',15);
title('Compare CHN & PAK (3D Preferred)')


