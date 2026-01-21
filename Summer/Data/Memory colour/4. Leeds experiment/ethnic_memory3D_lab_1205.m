% fig=figure();
% set(fig,'Position', [100 100 600 600]);
% for i=1:24
% for j=1:5
% plot(lab(i+j*24-24,2),lab(i+j*24-24,3),'o','Color',c(j,:),'MarkerFaceColor',c(j,:),'MarkerSize',9);hold on;
% end
% f=['sqrt(',num2str(par(i,2)),'*(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
% h=ezplot(f,[-100,120]);set(h,'Color',[0.2,0.2,0.2]);hold on;
% text(par(i,6)+2,par(i,7),num2str(i),'fontsize',10);
% plot(par(i,6),par(i,7),'o','Color',[0.5,0.1,0.1],'MarkerFaceColor',[0.5,0.1,0.1],'MarkerSize',9);hold on;
% end
% axis([-100 100 -100 120]);hold on;grid on;
% set(gca,'XTick',[-100:20:100]);%设置要显示坐标刻度
% set(gca,'YTick',[-100:20:120]);%设置要显示坐标刻度
% xlabel('a*','FontSize',15);
% ylabel('b*','FontSize',15);
% title('Memory results on CIELAB a*b*');
% plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
% plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);

% fig=figure();
% set(fig,'Position', [100 100 600 600]);
for i=1:24
% par(i,1:4)=par(i,1:4).*3;par(i,9:10)=par(i,9:10).*3;
for j=1:5
plot(lab(i+j*24-24,2),lab(i+j*24-24,3),'o','Color',c(j,:),'MarkerFaceColor',c(j,:),'MarkerSize',9);hold on;
end
% f=['sqrt(',num2str(par(i,2)),'*(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
% h=ezplot(f,[-100,120]);set(h,'Color',[0.2,0.2,0.2]);hold on;
% text(par(i,6)+1,par(i,7),num2str(i),'fontsize',10);
plot(par(i,6),par(i,7),'o','Color',[0.5,0.1,0.1],'MarkerFaceColor',[0.5,0.1,0.1],'MarkerSize',9);hold on;
end
title(strcat('Memory colour ',num2str(i),' on CIELAB C*L*'));
axis([0 100 0 100]);hold on;grid on;
set(gca,'XTick',[-100:10:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:10:120]);%设置要显示坐标刻度
xlabel('C*_a_b','FontSize',15);
ylabel('L*','FontSize',15);