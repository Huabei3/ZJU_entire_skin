clear all
j=[3;1;2;5;4;17;16;14;24;21;20;19;26];
for i=1:11
%     =================================YT ellipse==========================
load('Kevin0603.mat');
% a=e(i,3);b=e(i,4);
% c=sqrt(a^2+b^2);t=(e(i,5)+90)./180.*pi;
% x0=e(i,3);y0=e(i,4);
syms x y 
% f1=(a^2+c^2*cos(t)^2)*(x-x0).^2+(a^2+c^2*sin(t)^2)*(y-y0).^2+c^2*sin(2*t)*(x-x0)*(y-y0)-a^2*b^2;
f1=e(i,1).*(x-e(i,3)).^2+e(i,2).*(x-e(i,4)).^2+2.*e(i,5).*(x-e(i,4)).*(x-e(i,3));
figure(1);
h1=ezplot(f1);hold on;
set(h1,'Color',[0.5,0.5,0.5]);hold on;
text(e(i,3)-2,e(i,4),num2str(i));
plot(e(i,3),e(i,4),'k.');
% plot([par(i,4),par1(i,4)],[par(i,5),par1(i,5)],'Color',[0.3,0.3,0.3]);
%     =================================our ellipse==========================
 load('data1221c.mat');
c1(1,1:3)=min(b(:,3*j(i)-2:3*j(i)));
c1(2,1:3)=max(b(:,3*j(i)-2:3*j(i)));
 xdata=b(:,3*j(i)-2:3*j(i));
 ydata=a3(:,j(i));
 f1=@(a,xdata)(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
 rmax=0;
 for t=1:100
     a0=[-rand,rand,rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,0,-5,c1(1,:),1],[0.5,2,6,6,c1(2,:),4],options);
     y=(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
     r=corr(y,ydata);
     if r >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(i,1:8)=afinal;
 a=afinal;
 y=(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);hold on;
 r=corr(y,ydata);
%   scatter(y,ydata);
 par(i,9)=r;
 par(i,1:4)=par(i,1:4).*2;
f=['sqrt(',num2str(par(i,2)),'*(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
h=ezplot(f,[-100,120]);set(h,'Color',[0.5,0,0]);hold on;
text(par(i,6)+2,par(i,7),num2str(i),'fontsize',10);
plot(par(i,6),par(i,7),'o','Color',[0.5,0,0],'MarkerFaceColor',[0.5,0,0],'MarkerSize',3);hold on;
plot([e(i,1),par(i,6)],[e(i,2),par(i,7)],'Color',[0.5,0.5,0.5]);
end

%=============================================set fig=====================================
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
set(gcf,'position',[100 100 500 500]);
axis([-100 100 -100 120]);hold on;grid on;
set(gca,'XTick',[-100:10:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:10:120]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title('Peter Memory results on CIELAB a*b*');