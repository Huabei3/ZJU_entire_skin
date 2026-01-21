for i=21
x=0:0.1:10;
y=1./(1+exp(x-par(i,8)));
  axis([0 4 0 1]);hold on;grid on;
  set(gca,'XTick',[0:1:4]);%设置要显示坐标刻度
  set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
xlabel('delta E','FontSize',15);
ylabel('P%','FontSize',15);
plot(x,y);hold on
a=par(i,:);
% e=par(4,1).*sqrt((b(:,1)-par(4,5).^2+par(4,2).*(b(:,2)-par(4,6)).^2+par(1,3).*(b(:,3)-par(1,7)).^2+par(1,4).*(b(:,2)-par(1,6)).*(b(:,3)-par(1,7))));
e=sqrt(a(1)*(b(:,i*3-2)-a(5)).^2+a(2).*(b(:,i*3-1)-a(6)).^2+a(3)*(b(:,i*3)-a(7)).^2+a(4)*(b(:,i*3-1)-a(6)).*(b(:,i*3)-a(7))+a(9).*(b(:,i*3-2)-a(5)).*(b(:,i*3-1)-a(6))+a(10).*(b(:,i*3-2)-a(5)).*(b(:,i*3)-a(7)));
scatter(e,a1(:,1));hold on;
% close all
end