x=0:0.1:100;
y=1./(1+exp(x-par(4,7)));
  axis([0 5 0 1]);hold on;grid on;
  set(gca,'XTick',[0:1:5]);%设置要显示坐标刻度
  set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
xlabel('delta E','FontSize',15);
ylabel('P%','FontSize',15);
plot(x,y);hold on;
e=par(4,1).*sqrt((b(:,2)-par(4,5)).^2+par(4,2).*(b(:,3)-par(4,6)).^2-par(4,3).*(b(:,2)-par(4,5)).*(b(:,3)-par(4,6)));
scatter(e(1:45,1),a(1:45,4));hold on;