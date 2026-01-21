% plot(D,e(1,:));hold on;
% plot(D,e(2,:));
% plot(D,e(3,:));
% plot(D,e(4,:));
% plot(D,e(5,:));
% plot([0,0],[0,0],'Color',[0.5,0.5,0.5]);
% axis([0 2.4 0 2.4]);hold on;grid on;
% set(gca,'XTick',[0:0.3:2.4]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.3:2.4]);%设置要显示坐标刻度
% xlabel('D','FontSize',15);
% ylabel('delta E','FontSize',15);
% title('D vs delta E');
% legend('Aferica','Caucasian','Oriental','South Asian','mean');
cct=2000:200:12000;
D1=0.723.*(1-1116./cct);
D2=1-2000./cct;
plot(cct,D1);hold on;
plot(cct,D2);
axis([2000 12000 0 1]);hold on;grid on;
set(gca,'XTick',[2000:1000:12000]);%设置要显示坐标刻度
set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
xlabel('CCT','FontSize',15);
ylabel('D','FontSize',15);
title('D vs CCT');
legend('D=Zhai','D=fit');