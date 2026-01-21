clear all
load('memorydata.mat');
for i=16
par(i,:)=ellipsoidfit4(b(:,3*i-2:3*i),a1(:,i));
f = [num2str(par(i,1)),'*sqrt(','(x-',num2str(par(i,5)),')^2+',num2str(par(i,2)),'*(y-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(x-',num2str(par(i,5)),')','*(y-',num2str(par(i,6)),'))','=',num2str(par(i,4))];
h=ezplot(f,[-100,100]);
% set(h,'Color',color(i,:));hold on;
 axis([0 40 0 40]);hold on;grid on;
 set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
% plot(par(i,5),par(i,6),'o','Color',color(i,:),'MarkerFaceColor',color(i,:),'MarkerSize',8);hold on;
theta(i,1) = 0.5*atan(par(i,3)/(1-par(i,2)));
thetapi(i,1) = theta(i,1)*360/(2*pi);
majoraxis(i,1) = sqrt(1/(par(i,2)+par(i,3)*cot(theta(i,1))/2));
minoraxis(i,1) = sqrt(1/(1-par(i,3)*cot(theta(i,1))/2));
mr(i,1) = minoraxis(i,1)/majoraxis(i,1);
end
par1=[par,thetapi+90,minoraxis,majoraxis,mr];
title('Memory results');
xlabel('Prediction','FontSize',15);
ylabel('Visual data','FontSize',15);