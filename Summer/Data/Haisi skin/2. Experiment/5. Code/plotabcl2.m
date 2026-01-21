fig=figure();
set(fig,'Position', [100 100 400 400]);
axis equal;
hold on
str=["Caucasian-female","Caucasian-male","Oriental-female","Oriental-male",
    "South Asian-female","South Asian-male","African-female","African-male"];
color=[255,29,0;155,115,0;15,74,155;0,205,0;0,105,0; 30,144,255;155,19,0;255,215,0 ]./255;

% for i=1:8
% plot(a0(i,2),a0(i,3),'o','color',color(i,:),'MarkerFaceColor',color(i,:));
% plot(a1(i,2),a1(i,3),'^','color',color(i,:),'MarkerFaceColor',color(i,:));
% text(2,3*i,str(i),'fontsize',12,'color',color(i,:));
% plot([a0(i,2),a1(i,2)],([a0(i,3),a1(i,3)]),'color',color(i,:));
% axis([0 25 0 25]);
% end
% set(gca,'XTick',[0:5:25]);%设置要显示坐标刻度
% set(gca,'YTick',[0:5:25]);%设置要显示坐标刻度
% grid on

axis([0 40 0 80]);
for i=1:8
plot(a0(i,4),a0(i,1),'o','color',color(i,:),'MarkerFaceColor',color(i,:));
plot(a1(i,4),a1(i,1),'^','color',color(i,:),'MarkerFaceColor',color(i,:));
text(2,8*i,str(i),'fontsize',12,'color',color(i,:));
plot([a0(i,4),a1(i,4)],([a0(i,1),a1(i,1)]),'color',color(i,:));
end
set(gca,'XTick',[0:10:40]);%设置要显示坐标刻度
set(gca,'YTick',[0:10:80]);%设置要显示坐标刻度
grid on