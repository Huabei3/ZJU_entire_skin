ob=[1,2,3,4,5,14,16,17,19,20,21,24];
for j=4:12
    i=ob(j);
%=============================================Summer=====================================
load('data1221c.mat');
c1=min(b);c2=max(b);
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
 par(i,1:3)= par(i,1:3).*2;
f1=['sqrt(',num2str(par(i,1)),'*(x-',num2str(par(i,4)),')^2+',num2str(par(i,2)),'*(y-',num2str(par(i,5)),')^2+',num2str(par(i,3)),'*(x-',num2str(par(i,4)),')','*(y-',num2str(par(i,5)),'))','=',num2str(par(i,6))];
h1=ezplot(f1,[-100,140]);set(h1,'Color',[0,0,0]);hold on;
text(par(i,4),par(i,5)-5,num2str(j));
plot(par(i,4),par(i,5),'o','Color',[0,0,0],'MarkerFaceColor',[0,0,0],'MarkerSize',3);hold on;
par1=par;
%=============================================YT=====================================
% a=e(j,3)*2;b=e(j,4)*2;
% c=sqrt(a^2+b^2);t=(e(j,5)+90)./180.*pi;
% x0=e(j,1);y0=e(j,2);
% syms x y 
% f1=(a^2+c^2*cos(t)^2)*(x-x0).^2+(a^2+c^2*sin(t)^2)*(y-y0).^2+c^2*sin(2*t)*(x-x0)*(y-y0)-a^2*b^2;
% figure(1);
% h1=ezplot(f1,[-1.5*a+x0,1.5*a+x0,-1.5*a+y0,1.5*a+y0,]);hold on;
% set(h1,'Color',[0,0,0]);hold on;
%  text(x0-5,y0-5,num2str(j));
% plot(x0,y0,'k.');
% %=============================================draw line=====================================
% plot([par(i,4),x0],[par(i,5),y0],'Color',[0.3,0.3,0.3]);
plot([0,0],[-100,140],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
%=============================================set fig=====================================
set(gcf,'position',[100 100 500 500]);
axis([-100 100 -100 140]);hold on;grid on;
set(gca,'XTick',[-100:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:20:140]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title('Memory results on CIELAB a*b*');
end