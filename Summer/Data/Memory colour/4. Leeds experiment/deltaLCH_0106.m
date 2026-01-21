clear all; load('labch0_0106.mat')
aa=anall;
b=bZ;
lab=labnall;
fig=figure();
set(fig,'Position', [100 100 600 600]);

for i=1:24
dL=b(:,i*3-2)-lab(i,1);
dC=sqrt(b(:,i*3-1).^2+b(:,i*3).^2)-lab(i,4);
h=atan2(b(:,i*3),b(:,i*3-1))./pi.*180;
for j=1:48
if b(j,i*3-1)>0
    if b(j,i*3)<0
h(j,1)=h(j,1)+360;   
    end
else
h(j,1)=h(j,1)+180;  
end
end
dH=sqrt(lab(i,4).*sqrt(b(:,i*3-1).^2+b(:,i*3).^2)).*sin((h-lab(i,5))./180.*pi./2);
bb=[dH,dC,dL];
 xdata=bb;
 ydata=aa(:,i);
rmax=0;
%  f1=@(a,xdata)(1./(1+exp(sqrt(a(1).*xdata(:,1).^2+a(2).*xdata(:,2).^2+a(3).*xdata(:,3).^2+a(4).*xdata(:,2).*xdata(:,3)+a(5).*xdata(:,2).*xdata(:,1)+a(6).*xdata(:,3).*xdata(:,1))-a(7))).*(sqrt(a(1).*xdata(:,1).^2+a(2).*xdata(:,2).^2+a(3).*xdata(:,3).^2+a(4).*xdata(:,2).*xdata(:,3)+a(5).*xdata(:,2).*xdata(:,1)+a(6).*xdata(:,3).*xdata(:,1)))>=0);
 f1=@(a,xdata)(1./(1+exp(sqrt(a(1).*xdata(:,1).^2+a(2).*xdata(:,2).^2+a(3).*xdata(:,3).^2+a(4).*xdata(:,2).*xdata(:,3)+a(5).*xdata(:,2).*xdata(:,1)+a(6).*xdata(:,3).*xdata(:,1))-a(7))));
for t=1:100
     a0=[rand,rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',20000);
     amin=[0,0,0,-1,-1,-1,0];amax=[2,2,2,1,1,1,4];
     a=lsqcurvefit(f1,a0,xdata,ydata,amin,amax,options);
     y=(1./(1+exp(sqrt(a(1).*xdata(:,1).^2+a(2).*xdata(:,2).^2+a(3).*xdata(:,3).^2+a(4).*xdata(:,2).*xdata(:,3)+a(5).*xdata(:,2).*xdata(:,1)+a(6).*xdata(:,3).*xdata(:,1))-a(7)))); r=corr(y,ydata);
     if r >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(i,1:7)=afinal;
 a=afinal;
 y=(1./(1+exp(sqrt(a(1).*xdata(:,1).^2+a(2).*xdata(:,2).^2+a(3).*xdata(:,3).^2+a(4).*xdata(:,2).*xdata(:,3)+a(5).*xdata(:,2).*xdata(:,1)+a(6).*xdata(:,3).*xdata(:,1))-a(7)))); r=corr(y,ydata);
 par(i,8)=r;
f=['sqrt(',num2str(par(i,2)),'*x^2+',num2str(par(i,3)),'*y^2+',num2str(par(i,4)),'*x*y)=',num2str(par(i,7))];
h=ezplot(f,[-100,120]);set(h,'Color',[0.2,0.2,0.2]);hold on;
end
% % %==========================plot============================================
title('Memory colours on CIELAB C*L*');
axis([-20 20 -20 20]);hold on;grid on;
set(gca,'XTick',[-100:2:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:2:120]);%设置要显示坐标刻度
xlabel('delta_C*_a_b','FontSize',15);
ylabel('delta_L*','FontSize',15);
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);