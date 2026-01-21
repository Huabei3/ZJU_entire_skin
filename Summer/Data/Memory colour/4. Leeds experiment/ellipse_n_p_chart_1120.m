clear all
load('all_1120.mat'); 
fig=figure();
set(fig,'Position', [100 100 600 600]);
for i=1:24
%====================CH(Leeds) p==========================================
plot(bb(i,2),bb(i,3),'^','Color',cl1,'MarkerFaceColor',cl1,'MarkerSize',6);hold on;
%====================CH(Leeds) n==========================================
load('all_1120.mat'); 
f=['sqrt(',num2str(par(i,2)),'*(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
h=ezplot(f,[-100,120]);set(h,'Color',[0.3 0.3 0.3]);hold on;
text(par(i,6)+2,par(i,7),num2str(i),'fontsize',10);
plot(par(i,6),par(i,7),'^','Color',cl4,'MarkerFaceColor',cl4,'MarkerSize',6);hold on;
%==========================plot============================================
title(strcat('Memory colour ',num2str(i),' on CIELAB a*b*'));
axis([-100 100 -100 100]);hold on;grid on;
set(gca,'XTick',[-100:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:20:120]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
end
axis equal;
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
%==========================chart============================================
for ii=1:8
plot(aa(ii,2),aa(ii,3),'o','Color',cl3,'MarkerFaceColor',cl3,'MarkerSize',6);hold on;
text(aa(ii,2),aa(ii,3),num2str(aa(ii,5)),'fontsize',10);
end
