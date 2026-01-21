clear all
for i=1:2
%=============================================Chinese=====================================
load('data1221p.mat');
c1=min(b);c2=max(b);
 j=1;
 xdata=b(1:16,3*i-1:3*i);
 ydata=a3(1:16,i);
 f1=@(a,xdata)(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
 rmax=0;
 for t=1:100
     a0=[-rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,-0.1,c1(3*i-1:3*i),1],[0.1,0.1,0.1,c2(3*i-1:3*i),3],options);
     y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
     r=corr(y,ydata);
     if r >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(i,1:6)=afinal;
 a=afinal;
 y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3).*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
 r=corr(y,ydata);
 par(i,7)=r;
 parr(j,:)=par(i,:);
 par(i,1:3)= par(i,1:3).*3;
f1=['sqrt(',num2str(par(i,1)),'*(x-',num2str(par(i,4)),')^2+',num2str(par(i,2)),'*(y-',num2str(par(i,5)),')^2+',num2str(par(i,3)),'*(x-',num2str(par(i,4)),')','*(y-',num2str(par(i,5)),'))','=',num2str(par(i,6))];
h1=ezplot(f1,[-100,120]);set(h1,'Color',[0.2,0.2,0.2]);hold on;
plot(par(i,4),par(i,5),'o','Color',[0.2,0.2,0.2],'MarkerFaceColor',[0.8,0.2,0.2],'MarkerSize',3);hold on;
par1=par;
% %=============================================Pakisitani=====================================
% load('data1203.mat');
% c1=min(b);c2=max(b);
% j=1;
%  xdata=b(1:16,3*i-1:3*i);
%  ydata=a3(1:16,i);
%  f1=@(a,xdata)(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
%  rmax=0;
%  for t=1:100
%      a0=[-rand,rand,rand,rand,rand,rand];
%      options=optimset('MaxFunEvals',200000);
%      a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,-0.1,c1(3*i-1:3*i),1],[0.1,0.1,0.1,c2(3*i-1:3*i),3],options);
%      y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
%      r=corr(y,ydata);
%      if r >= rmax
%         rmax=r;
%         afinal=a;
%      end
%  end
%  par(i,1:6)=afinal;
%  a=afinal;
%  y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3).*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
%  r=corr(y,ydata);
%  par(i,7)=r;
%  parr(j,:)=par(i,:);
%  par(i,1:3)= par(i,1:3).*3; 
% f1=['sqrt(',num2str(par(i,1)),'*(x-',num2str(par(i,4)),')^2+',num2str(par(i,2)),'*(y-',num2str(par(i,5)),')^2+',num2str(par(i,3)),'*(x-',num2str(par(i,4)),')','*(y-',num2str(par(i,5)),'))','=',num2str(par(i,6))];
% h1=ezplot(f1,[-100,120]);set(h1,'Color',[0.3,0.3,0.3]);hold on;
% plot(par(i,4),par(i,5),'o','Color',[0.3,0.3,0.3],'MarkerFaceColor',[0.3,0.3,0.3],'MarkerSize',3);hold on;
% %=============================================draw line=====================================
text(par(i,4),par(i,5)-5,num2str(i));
plot([par(i,4),par1(i,4)],[par(i,5),par1(i,5)],'Color',[0.3,0.3,0.3]);
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
%=============================================set fig=====================================
set(gcf,'position',[100 100 500 500]);
axis([-100 100 -80 120]);hold on;grid on;
set(gca,'XTick',[-100:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:20:120]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title('Memory results on CIELAB a*b*');
end