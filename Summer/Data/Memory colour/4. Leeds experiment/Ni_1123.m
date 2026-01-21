load('Ni_1123.mat');
color=color./165;
a=a';
fig=figure();
set(fig,'Position', [100 100 600 600]);
x=0:0.001:6;
y=100-5.*x;
plot(x,y,'--k','linewidth',1);hold on;
plot([0,6],[80 80],'Color',[0.5,0.5,0.5]);
for i=1:18
plot(aaa(i,3),100-5.*aaa(i,3)+4,'s','Color',color(i,:),'MarkerFaceColor',color(i,:),'MarkerSize',10);
text(aaa(i,3)-0.05,100-5.*aaa(i,3)+5.5,num2str(i),'Color',color(i,:));
end
for i=1:18
plot(aaa(i,2),100-5.*aaa(i,2),'^','Color',color(i,:),'MarkerFaceColor',color(i,:),'MarkerSize',7);
text(aaa(i,2)-0.05,100-5.*aaa(i,2)+1.5,num2str(i),'Color',color(i,:));
end
for i=1:18
plot(aaa(i,1),100-5.*aaa(i,1)-3,'o','Color',color(i,:),'MarkerFaceColor',color(i,:),'MarkerSize',7);
text(aaa(i,1)-0.05,100-5.*aaa(i,1)-5,num2str(i),'Color',color(i,:),'FontSize',20);
end
title('Ni equation-all');
axis([0 6 40 100]);hold on;grid on;
set(gca,'XTick',[-100:0.5:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:5:120]);%设置要显示坐标刻度
xlabel('delta E*ab','FontSize',15);
ylabel('Ni','FontSize',15);