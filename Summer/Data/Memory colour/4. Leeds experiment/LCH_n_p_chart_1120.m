clear all
load('all_LCH_1125.mat'); 
fig=figure();
set(fig,'Position', [100 100 600 600]);
for i=1:24
%====================CH(Leeds)n==========================================
text(par11(i,6)+1,par11(i,7),num2str(i),'fontsize',10);
plot(par11(i,6),par11(i,7),'o','Color',cl4,'MarkerFaceColor',cl4,'MarkerSize',6);hold on;
%====================CH(ZJU)p==========================================
plot(bb(i,4),bb(i,1),'^','Color',cl1,'MarkerFaceColor',cl1,'MarkerSize',6);hold on;
plot([par11(i,6),bb(i,4)],[par11(i,7),bb(i,1)],'Color',[0.6,0.6,0.6]);
end
% ==========================chart============================================
for ii=1:8
plot(aa(ii,4),aa(ii,1),'o','Color',cl3,'MarkerFaceColor',cl3,'MarkerSize',6);hold on;
plot([par11(aa(ii,5),6),aa(ii,4)],[par11(aa(ii,5),7),aa(ii,1)],'Color',[0.6,0.6,0.6]);
text(aa(ii,4),aa(ii,1),num2str(aa(ii,5)),'fontsize',10,'Color',cl3);
end
% % %==========================plot============================================
title(strcat('Memory colour ',num2str(i),' on CIELAB C*L*'));
axis([0 100 0 100]);hold on;grid on;
set(gca,'XTick',[-100:10:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:10:120]);%设置要显示坐标刻度
xlabel('C*ab','FontSize',15);
ylabel('L*','FontSize',15);
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);

