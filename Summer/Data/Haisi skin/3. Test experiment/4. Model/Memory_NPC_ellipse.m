load('memorydata.mat');
for i=1:24
% output: par = [k1,k2,k3,k4,l0,a0,b0,alpha,k5,k6]
c(1,1:3)=min(b(:,3*i-2:3*i));
c(2,1:3)=max(b(:,3*i-2:3*i));
 xdata=b(:,3*i-2:3*i);
 ydata=a1(:,i);
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
 par(i,11)=r;
f=[num2str(par(i,2)),'*sqrt(','(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
h=ezplot(f,[-100,120]);set(h,'Color',[0,0,1]);hold on;
plot(par(i,6),par(i,7),'o','Color',[0,0,1],'MarkerFaceColor',[0,0,1],'MarkerSize',10);hold on;
text(par(i,6),par(i,7)-2,'C','Color','blue');

 ydata=a2(:,i);
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
 par(i,11)=r;
f=[num2str(par(i,2)),'*sqrt(','(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
h=ezplot(f,[-100,120]);set(h,'Color',[1,0,0]);hold on;
plot(par(i,6),par(i,7),'o','Color',[1,0,0],'MarkerFaceColor',[1,0,0],'MarkerSize',10);hold on;
text(par(i,6),par(i,7)-2,'P','Color','red');
plot([0,par(i,6)./par(i,7).*100],[0,100]);

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
 par(i,11)=r;
f=[num2str(par(i,2)),'*sqrt(','(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
h=ezplot(f,[-100,120]);set(h,'Color',[0,1,0]);hold on;
plot(par(i,6),par(i,7),'o','Color',[0,1,0],'MarkerFaceColor',[0,1,0],'MarkerSize',10);hold on;
text(par(i,6),par(i,7)-2,'N','Color','green');
close all
end
plot([-100 100],[0,0],'k');plot([0,0],[-100 120],'k');
axis([-80 80 -80 80]);hold on;grid on;
set(gca,'XTick',[-100:10:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:10:120]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title('Memory results on CIELAB a*b*');