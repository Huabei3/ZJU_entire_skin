x=0:0.1:100;
y=1./(1+exp(x-par(4,7)*2.5));
  axis([0 5 0 1]);hold on;grid on;
  set(gca,'XTick',[0:0.5:5]);%设置要显示坐标刻度
  set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
xlabel('delta E','FontSize',15);
ylabel('P%','FontSize',15);
plot(x,y);hold on;
plot([0,5],[0.5,0.5],'--');hold on;
e=par(4,1).*sqrt((b(:,2)-par(4,5)).^2+par(4,2).*(b(:,3)-par(4,6)).^2-par(4,3).*(b(:,2)-par(4,5)).*(b(:,3)-par(4,6)));
aa=e(1:45,1);
bb=1./(1+exp(aa-par(4,7)*2.5));
cc=(bb-a1(1:45,4))./3;
scatter(aa,bb+cc);hold on;

% x=0:0.1:100;
% y=1./(1+exp(x-par(4,8)*2.5));
%   axis([0 1 0 1]);hold on;grid on;
%   set(gca,'XTick',[0:0.1:1]);%设置要显示坐标刻度
%   set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
% ylabel('Predicted P%','FontSize',15);
% xlabel('visual P%','FontSize',15);
% plot([0,1],[0,1],'--');hold on;
% e=sqrt(par(4,1).*(b(:,1)-par(4,5)).^2+par(4,2).*(b(:,2)-par(4,6)).^2+par(4,3).*(b(:,3)-par(4,7)).^2-par(4,4).*(b(:,2)-par(4,6)).*(b(:,3)-par(4,7)));
% aa=e(1:48,1);
% bb=1./(1+exp(aa-par(4,8)));
% cc=(bb-a1(1:48,4))./3;
% scatter(bb,bb+cc);hold on;