fig=figure();
set(fig,'Position', [100 100 400 400]);
axis equal;grid on;
hold on
% 
% axis([-40 100 -40 100]);
% for i=1:9
% text(a(i,2)+3,a(i,3)+1,num2str(i),'fontsize',8,'color',[0.3,0.3,0.3]);
% plot([a(i,2),b(i,2)],([a(i,3),b(i,3)]),'color',[0.7,0.7,0.7]);
% plot(a(i,2),a(i,3),'.','color',[1,0.5,0.5],'MarkerSize',15);
% plot(b(i,2),b(i,3),'.','color',[0.5,0.5,1],'MarkerSize',15);
% end
% plot([-100,100],([0,0]),'color',[0.5,0.5,0.5]);
% plot([0,0],([-100 100]),'color',[0.5,0.5,0.5]);
% set(gca,'XTick',[-100:10:120]);%设置要显示坐标刻度
% set(gca,'YTick',[-100:10:120]);%设置要显示坐标刻度
% xlabel('a*','FontName','Times New Roman','FontSize',15);
% ylabel('b*','FontName','Times New Roman','FontSize',15);
% grid on

axis([0 100 0 100]);
for i=1:9
text(a(i,4)+3,a(i,1)+1,num2str(i),'fontsize',8,'color',[0.3,0.3,0.3]);
plot([a(i,4),b(i,4)],([a(i,1),b(i,1)]),'color',[0.7,0.7,0.7]);
plot(a(i,4),a(i,1),'.','color',[1,0.5,0.5],'MarkerSize',15);
plot(b(i,4),b(i,1),'.','color',[0.5,0.5,1],'MarkerSize',15);
end
plot([-100,100],([0,0]),'color',[0.5,0.5,0.5]);
plot([0,0],([-100 100]),'color',[0.5,0.5,0.5]);
set(gca,'XTick',[-100:10:120]);%设置要显示坐标刻度
set(gca,'YTick',[-100:10:120]);%设置要显示坐标刻度
xlabel('C*','FontName','Times New Roman','FontSize',15);
ylabel('L*','FontName','Times New Roman','FontSize',15);
grid on