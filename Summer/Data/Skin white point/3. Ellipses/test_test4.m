clear;
close all;
load x_select;
load y_select;
load xy_all;

% for i=0.19:0.001:0.205
%    for ii=0.435:0.001:0.445  %----遍历
%       uc=i;
%       vc=ii;
% uc=0.195;
% vc=0.44;
 uc=0.2023;
 vc=0.4558;
dp=[];rmse=[];tn=[];tx=[];t=[];alfa=[];
for i=1:size(y)
    xdata=[0,sqrt((x(i,2)-vc).^2+(x(i,1)-uc).^2)];
    ydata=[1,y(i)];
    theta=atan((x(i,2)-vc)/(x(i,1)-uc))*180/pi;
    if theta<0
        theta=theta+180;
    end
    t=[t;theta];
    F=@(a,xdata)1./(1+exp(a(2).*xdata-a(1)));
    a0=[1,1];
    warning off
    [a,resnorm] = lsqcurvefit(F,a0,xdata,ydata);
    alfa=[alfa;a];
    dp=[dp;uc+a(1)/a(2)*cosd(theta),vc+a(1)/a(2)*sind(theta)];
end      
      
      
      xdp=dp;
      plot(xy_all(:,1),xy_all(:,2),'r.');
      hold on;
      plot(xdp(:,1),xdp(:,2),'go');
      f=@(p,xdp)p(1).*(xdp(:,1)-uc).^2+p(2).*(xdp(:,1)-uc).*(xdp(:,2)-vc)+p(3).*(xdp(:,2)-vc).^2+p(4);
      p0=[1 1 1 1];
    warning off
    % 拟合系数，最小二乘方法
    [p,R,J,CovB,MSE,ErrorModelInfo]=nlinfit(x,zeros(size(x,1),1),f,p0);
    rmse=[rmse;sqrt(MSE),uc,vc];
    ezplot(@(x,y)f(p,[x,y]),[0.1,0.3,0.35,0.55]);
%    end
% end