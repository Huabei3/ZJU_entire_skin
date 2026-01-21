fig=figure();
set(fig,'Position', [100 100 400 400]);
scatter(a0(:,2),a0(:,3),'filled');
hold on
scatter(a1(:,2),a1(:,3),'filled');
scatter(a2(:,2),a2(:,3),'filled');
scatter(a3(:,2),a3(:,3),'filled');
axis equal;
hold on
str=["1.Oriental-F","2.South Asian-M","3.Caucasian-M","4.African-F",
     "5.African-M","6.Caucasian-F","7.Oriental-M","8.South Asian-F"];
for i=1:8
text(a0(i,2)-3,a0(i,3),str(i),'fontsize',10);
annotation('textarrow',[a0(i,2)./25,a1(i,2)./25],[a0(i,3)./25,a1(i,3)./25],'color',[217 83 25]./255);
annotation('textarrow',[a0(i,2)./25,a2(i,2)./25],[a0(i,3)./25,a2(i,3)./25],'color',[237 177 32]./255);
annotation('textarrow',[a0(i,2)./25,a3(i,2)./25],[a0(i,3)./25,a3(i,3)./25],'color',[126 47 142]./255);
axis([0 25 0 25]);
end
set(gca,'XTick',[0:5:25]);%设置要显示坐标刻度
set(gca,'YTick',[0:5:25]);%设置要显示坐标刻度
grid on
% 
% fig=figure();
% set(fig,'Position', [100 100 400 400]);
% axis([10 40 0 80]);
% scatter(a0(:,4),a0(:,1),'filled');
% hold on
% scatter(a1(:,4),a1(:,1),'filled');
% scatter(a2(:,4),a2(:,1),'filled');
% scatter(a3(:,4),a3(:,1),'filled');
% text(a0(1,4),a0(1,1)+5,str(1),'fontsize',10);
% text(a0(2,4)-2,a0(2,1)-3,str(2),'fontsize',10);
% text(a0(3,4)-2,a0(3,1)+5,str(3),'fontsize',10);
% text(a0(4,4)-2,a0(4,1)-3,str(4),'fontsize',10);
% text(a0(5,4)-2,a0(5,1)-3,str(5),'fontsize',10);
% text(a0(6,4)+3,a0(6,1),str(6),'fontsize',10);
% text(a0(7,4),a0(7,1)-3,str(7),'fontsize',10);
% text(a0(8,4)-2,a0(8,1)-3,str(8),'fontsize',10);
% hold on
% for i=1:8
% plot([a0(i,4),a1(i,4)],([a0(i,1),a1(i,1)]),'color',[217 83 25]./255);
% plot([a0(i,4),a2(i,4)],([a0(i,1),a2(i,1)]),'color',[237 177 32]./255);
% plot([a0(i,4),a3(i,4)],([a0(i,1),a3(i,1)]),'color',[126 47 142]./255);
% axis([0 40 0 80]);
% end
% set(gca,'XTick',[0:10:40]);%设置要显示坐标刻度
% set(gca,'YTick',[0:10:80]);%设置要显示坐标刻度
% grid on