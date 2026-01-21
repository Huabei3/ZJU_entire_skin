a=a';
fig=figure();
set(fig,'Position', [100 100 600 600]);
x=0:0.001:6;
y=100-5.*x;
plot(x,y,'--','linewidth',2);hold on;
plot([0,6],[80 80],'Color',[0.5,0.5,0.5]);
plot(a(1,1),100-5.*a(1,1),'o','Color',[1,0.3,0],'MarkerFaceColor',[1,0.3,0],'MarkerSize',10);
plot(a(1,2),100-5.*a(1,2),'^','Color',[1,0.3,0],'MarkerFaceColor',[1,0.3,0],'MarkerSize',10);
plot(a(2,1),100-5.*a(2,1),'o','Color',[0.3,1,0.3],'MarkerFaceColor',[0.3,1,0.3],'MarkerSize',10);
plot(a(2,2),100-5.*a(2,2),'^','Color',[0.3,1,0.3],'MarkerFaceColor',[0.3,1,0.3],'MarkerSize',10);
plot(a(3,1),100-5.*a(3,1),'o','Color',[0,0.3,1],'MarkerFaceColor',[0,0.3,1],'MarkerSize',10);
plot(a(3,2),100-5.*a(3,2),'^','Color',[0,0.3,1],'MarkerFaceColor',[0,0.3,1],'MarkerSize',10);
title('Ni equation');
axis([0 6 40 100]);hold on;grid on;
set(gca,'XTick',[-100:0.5:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:5:120]);%设置要显示坐标刻度
xlabel('delta E*00','FontSize',15);
ylabel('Ni','FontSize',15);