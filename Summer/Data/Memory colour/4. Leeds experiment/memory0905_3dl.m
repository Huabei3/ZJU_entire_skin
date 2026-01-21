 clear all
%    load('Leeds_AF_0905.mat');
%    load('Leeds_CH_0905.mat');
   load('Leeds_UK_0905.mat');
for i=1:28
% output: par = [k1,k2,k3,k4,l0,a0,b0,alpha]
c(1,1:3)=min(b(:,3*i-2:3*i));
c(2,1:3)=max(b(:,3*i-2:3*i));
 xdata=b(:,3*i-2:3*i);
 ydata=ap(:,i);
 f1=@(a,xdata)(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
 rmax=0;
 for t=1:100
     a0=[-rand,rand,rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,0,-5,c(1,:),1],[0.5,2,6,6,c(2,:),4],options);
     y=(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
     r=corrcoef(y,ydata);
     if r(1,2) >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(i,1:8)=afinal;
 a=afinal;
 y=(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);hold on;
 r=corrcoef(y,ydata);
%   scatter(y,ydata);
 par(i,9)=r(1,2);
% f=['sqrt(',num2str(par(i,2)),'*(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
% h=ezplot(f,[-100,120]);set(h,'Color',[0,0,0]);hold on;
% text(par(i,6)+5,par(i,7),num2str(i),'fontsize',10);
% plot(par(i,6),par(i,7),'o','Color',[0,0,0],'MarkerFaceColor',[0.5,0,0],'MarkerSize',3);hold on;
% for j=1:16
%      if a3(j,i)>0.5
%          plot(b(j,3*i-1),b(j,3*i),'+','Color',[0.7,0,0]);
%      else
%          plot(b(j,3*i-1),b(j,3*i),'X','Color',[0,0.6,0]);
%      end
%  end
end

% axis([-100 100 -100 120]);hold on;grid on;
% set(gca,'XTick',[-100:10:100]);%设置要显示坐标刻度
% set(gca,'YTick',[-100:10:120]);%设置要显示坐标刻度
% xlabel('a*','FontSize',15);
% ylabel('b*','FontSize',15);
% plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
% plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
% title('Memory results on CIELAB a*b*');