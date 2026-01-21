clear all
load('all_Lab_1126.mat'); 
fig=figure();
set(fig,'Position', [100 100 600 600]);
for i=1:24
%====================CH(Leeds)n==========================================
text(bbp(i,2)+1,bbp(i,3),num2str(i),'fontsize',10);
plot(bbp(i,2),bbp(i,3),'o','Color',cl4,'MarkerFaceColor',cl4,'MarkerSize',6);hold on;
%====================CH(ZJU)p==========================================
plot(bbn(i,2),bbn(i,3),'^','Color',cl1,'MarkerFaceColor',cl1,'MarkerSize',6);hold on;
plot([bbp(i,2),bbn(i,2)],[bbp(i,3),bbn(i,3)],'Color',[0.6,0.6,0.6]);
end
% ==========================chart============================================
for ii=1:8
plot(aa(ii,2),aa(ii,3),'o','Color',cl3,'MarkerFaceColor',cl3,'MarkerSize',6);hold on;
plot([bbp(aa(ii,5),2),aa(ii,2)],[bbp(aa(ii,5),3),aa(ii,3)],'Color',[0.6,0.6,0.6]);
text(aa(ii,2),aa(ii,3),num2str(aa(ii,5)),'fontsize',10,'Color',cl3);
end
% % %==========================plot============================================
% title(strcat('Memory colour ',num2str(i),' on CIELAB C*L*'));
% axis([0 100 0 100]);hold on;grid on;
% set(gca,'XTick',[-100:10:100]);%设置要显示坐标刻度
% set(gca,'YTick',[-100:10:120]);%设置要显示坐标刻度
% xlabel('C*ab','FontSize',15);
% ylabel('L*','FontSize',15);
% plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
% plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
title(strcat('Memory colour ',num2str(i),' on CIELAB a*b*'));
axis([-100 100 -100 120]);hold on;grid on;
set(gca,'XTick',[-100:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:20:120]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
