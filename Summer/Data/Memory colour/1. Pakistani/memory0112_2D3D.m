clear all
 load('data1221c.mat');
for i=8
% output: par = [k1,k2,k3,k4,l0,a0,b0,alpha,k5,k6]
c(1,1:3)=min(b(:,3*i-2:3*i));
c(2,1:3)=max(b(:,3*i-2:3*i));
 xdata=b(:,3*i-2:3*i);
 ydata=a3(:,i);
 f1=@(a,xdata)(1./(1+exp(a(1)*sqrt((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))>=0);
 rmax=0;
 for t=1:100
     a0=[-rand,rand,rand,rand,rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,0,-5,c(1,:),1,-2,-1],[0.5,2,6,6,c(2,:),4,1,1],options);
     y=(1./(1+exp(a(1)*sqrt((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))>=0);
     r=corr(y,ydata);
     if r >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(i,1:10)=afinal;
 a=afinal;
 y=(1./(1+exp(a(1)*sqrt((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))>=0);hold on;
 r=corr(y,ydata);
%   scatter(y,ydata);
 par(i,11)=r;
f=[num2str(par(i,2)),'*sqrt(','(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
h=ezplot(f,[-100,120]);set(h,'Color',[0.5,0,0]);hold on;
plot(par(i,6),par(i,7),'o','Color',[0.5,0,0],'MarkerFaceColor',[0.5,0,0],'MarkerSize',3);hold on;
% ================================== 2D ellipse============================
c1=min(b);c2=max(b);    
for j=1
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
 
f1=['sqrt(',num2str(par(i,1)),'*(x-',num2str(par(i,4)),')^2+',num2str(par(i,2)),'*(y-',num2str(par(i,5)),')^2+',num2str(par(i,3)),'*(x-',num2str(par(i,4)),')','*(y-',num2str(par(i,5)),'))','=',num2str(par(i,6))];
h1=ezplot(f1,[-100,120]);set(h1,'Color',[0,0,1]);hold on;
plot(par(i,4),par(i,5),'^','Color',[0,0,1],'MarkerFaceColor',[0,0,1],'MarkerSize',7);hold on;

theta = 0.5*atan(par(i,3)/(par(i,1)-par(i,2)))./pi.*180+90;
maj = sqrt(4*par(i,6)./(par(i,1)+par(i,2)-sqrt((par(i,1)-par(i,2)).^2+par(i,3).^2)));
min = sqrt(4*par(i,6)./(par(i,1)+par(i,2)+sqrt((par(i,1)-par(i,2)).^2+par(i,3).^2)));
theta1(j,1) = 0.5*atan(par(i,3)/(par(i,1)-par(i,2)))./pi.*180+90;
maj1(j,1) = sqrt(4*par(i,6)./(par(i,1)+par(i,2)-sqrt((par(i,1)-par(i,2)).^2+par(i,3).^2)));
min1(j,1) = sqrt(4*par(i,6)./(par(i,1)+par(i,2)+sqrt((par(i,1)-par(i,2)).^2+par(i,3).^2)));
if maj<min
  bb=min;
  min=maj;
  maj=bb;
end
  mr=maj./min;
  pa(j,:)=[par(i,1:6),r,theta,maj,mr];
    end 
 parrr(i,:)=parr;
% for j=1:16
%      if a1(j,i)>0.5
%          text(b(j,3*i-1),b(j,3*i),num2str(a2(j,i)),'Color',[0.7,0,0]);
%      else
%          text(b(j,3*i-1),b(j,3*i),num2str(a2(j,i)),'Color',[0,0.6,0]);
%      end
%  end
  clear cc;
end
axis([20 70 15 65]);hold on;grid on;
set(gca,'XTick',[0:5:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:5:100]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title('Memory results on CIELAB a*b*');