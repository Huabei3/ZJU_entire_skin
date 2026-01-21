 clear all
load('cov_abcl_plot_1202.mat');
fig=figure();
set(fig,'Position', [100 100 600 600]);
for i=1:5
    plot(a(i,2),a(i,3),'.','color',cl(i,:),'MarkerSize',45);hold on;
end
% =======================plot==================================
% axis([0 100 0 100]);hold on;grid on;
% set(gca,'XTick',[-100:10:100]);%设置要显示坐标刻度
% set(gca,'YTick',[-100:10:120]);%设置要显示坐标刻度
% xlabel('C*_a_b','FontSize',15);
% ylabel('L*','FontSize',15);
% title('Memory results on CIELAB C*_a_bL*');
% plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
% plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
axis([-50 50 0 100]);hold on;grid on;
set(gca,'XTick',[-100:10:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:10:120]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title('Memory results on CIELAB a*b*');
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);