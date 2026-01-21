load('race3prf8center.mat');
fig=figure();
set(fig,'Position', [100 100 500 500]);
axis equal;
hold on
scatter(MM0(:,4),MM0(:,1),'filled');hold on;
scatter(MM3(:,4),MM3(:,1),'filled');hold on;
scatter(MM2(:,4),MM2(:,1),'filled');hold on;
scatter(MM1(:,4),MM1(:,1),'filled');hold on;
str=["1.Oriental-F","2.South Asian-M","3.Caucasian-M","4.African-F","5.African-M","6.Caucasian-F","7.Oriental-M","8.South Asian-F"];
for i=1:8
plot([MM0(i,4),MM3(i,4)],[MM0(i,1),MM3(i,1)],'-','color',[217,83,25]./255);
plot([MM0(i,4),MM2(i,4)],[MM0(i,1),MM2(i,1)],'-','color',[237,117,32]./255);
plot([MM0(i,4),MM1(i,4)],[MM0(i,1),MM1(i,1)],'-','color',[126,47,172]./255);
text(MM0(i,4),MM0(i,1)-3,num2str(i),'fontsize',10,'color','k');
text(1,80-4*i,str(i),'fontsize',10);
end
axis([0 40 0 80]);hold on
title('Compare culture difference','FontSize',15)
set(gca,'XTick',[0:10:40]);%设置要显示坐标刻度
set(gca,'YTick',[0:10:80]);%设置要显示坐标刻度
grid on;
xlabel('C*','FontName','Times New Roman','FontSize',15);
ylabel('L*','FontName','Times New Roman','FontSize',15);