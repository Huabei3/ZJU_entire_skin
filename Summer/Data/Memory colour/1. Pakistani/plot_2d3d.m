fig=figure();
set(fig,'Position', [100 100 400 400]);
axis equal;grid on;
hold on
axis([-80 80 -80 120]);
for i=1:8
plot(a(i,2),a(i,3),'o','color',[185,0,0]./255,'MarkerFaceColor',[185,0,0]./255);
% plot(b(i,2),b(i,3),'o','color',[0,185,0]./255,'MarkerFaceColor',[0,185,0]./255);
plot(c(i,2),c(i,3),'o','color',[125,125,125]./255,'MarkerFaceColor',[125,125,125]./255);
text(c(i,2)+5,c(i,3),num2str(i),'fontsize',10);
plot([a(i,2),c(i,2)],([a(i,3),c(i,3)]),'Color',[0.3,0.3,0.3]);
% plot([b(i,2),c(i,2)],([b(i,3),c(i,3)]),'Color',[0.3,0.3,0.3]);
end
plot([0,0],[-100,140],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
set(gca,'XTick',[-100:20:120]);%设置要显示坐标刻度
set(gca,'YTick',[-100:20:140]);%设置要显示坐标刻度
xlabel('a*','FontName','Times New Roman','FontSize',15);
ylabel('b*','FontName','Times New Roman','FontSize',15);
title('a*b* compare');
% % % =============================================================
% fig=figure();
% set(fig,'Position', [100 100 400 400]);
% axis equal;grid on;
% hold on
% axis([0 120 0 90]);
% for i=1:8
% plot(a(i,4),a(i,1),'o','color',[185,0,0]./255,'MarkerFaceColor',[185,0,0]./255);
% % plot(b(i,4),b(i,1),'o','color',[0,185,0]./255,'MarkerFaceColor',[0,185,0]./255);
% plot(c(i,4),c(i,1),'o','color',[125,125,125]./255,'MarkerFaceColor',[125,125,125]./255);
% text(a(i,4),a(i,1)-4,num2str(i),'fontsize',10);
% plot([a(i,4),c(i,4)],([a(i,1),c(i,1)]),'Color',[0.3,0.3,0.3]);
% % plot([b(i,4),c(i,4)],([b(i,1),c(i,1)]),'Color',[0.3,0.3,0.3]);
% end
% set(gca,'XTick',[-100:10:150]);%设置要显示坐标刻度
% set(gca,'YTick',[-100:10:100]);%设置要显示坐标刻度
% xlabel('C*','FontName','Times New Roman','FontSize',15);
% ylabel('L*','FontName','Times New Roman','FontSize',15);
% title('C*L* compare');