load('banana_1109.mat');
s=['p','s','d','o','^','o','o','o','o','o','o'];

for i=1:11
scatter(a(i,4),a(i,1),100,s(i),'filled');hold on;
end
% load('data0927c.mat');
% for i=3
% c(1,1:3)=min(b(:,3*i-2:3*i));
% c(2,1:3)=max(b(:,3*i-2:3*i));
%  xdata=b(:,3*i-2:3*i);
%  ydata=a2(:,i);
%  f1=@(a,xdata)(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
%  rmax=0;
%  for t=1:100
%      a0=[-rand,rand,rand,rand,rand,rand,rand,rand];
%      options=optimset('MaxFunEvals',200000);
%      a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,0,-5,c(1,:),1],[0.5,2,6,6,c(2,:),4],options);
%      y=(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
%      r=corrcoef(y,ydata);;
%      if r(1,2) >= rmax
%         rmax=r;
%         afinal=a;
%      end
%  end
%  par(i,1:8)=afinal;
%  a=afinal;
%  y=(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);hold on;
%  r=corrcoef(y,ydata);
%  par(i,9)=r(1,2);
% f=['sqrt(',num2str(par(i,2)),'*(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
% h=ezplot(f,[-100,120]);set(h,'Color',[0.3,0.3,0.3]);hold on;
% end
% legend('Babilon','Bodrogi','Smet','Summer-Chart','Zhu YT','Summer-CHL','Summer-CHZ','Summer-UK','Summer-PK','Summer-AF','Summer-CHZ ellipse');
grid on;
legend('Babilon','Bodrogi','Smet','Summer-Chart','Zhu YT','Summer-CHL','Summer-CHZ','Summer-UK','Summer-PK','Summer-AF');
axis([0 110 0 100]);
set(gca,'XTick',[-100:10:110]);%设置要显示坐标刻度
set(gca,'YTick',[-100:10:110]);%设置要显示坐标刻度
xlabel('C*','FontName','Times New Roman','FontSize',15);
ylabel('L*','FontName','Times New Roman','FontSize',15);