clear all
load('CICdata.mat');
color=[255,0,0;255,162,0;225,225,0;146,208,80;91,155,213;]./255;
for i=1:5
    for j=1
par(i+5*j-5,:)=ellipsoidfit5(b(25*j-24:25*j,:),a(25*j-24:25*j,i));
f = [num2str(par(i+5*j-5,1)),'*sqrt(','(x-',num2str(par(i+5*j-5,5)),')^2+',num2str(par(i+5*j-5,2)),'*(y-',num2str(par(i+5*j-5,6)),')^2+',num2str(par(i+5*j-5,3)),'*(x-',num2str(par(i+5*j-5,5)),')','*(y-',num2str(par(i+5*j-5,6)),'))','=',num2str(par(i+5*j-5,4))];
h=ezplot(f,[0,40]);set(h,'Color',color(i,:));hold on;
 axis([0 40 0 40]);hold on;grid on;
 set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(par(i+5*j-5,5),par(i+5*j-5,6),'o','Color',color(i,:),'MarkerFaceColor',color(i,:),'MarkerSize',8);hold on;
theta(i+5*j-5,1) = 0.5*atan(par(i+5*j-5,3)/(1-par(i+5*j-5,2)));
thetapi(i+5*j-5,1) = theta(i+5*j-5,1)*360/(2*pi);
majoraxis(i+5*j-5,1) = sqrt(1/(par(i+5*j-5,2)+par(i+5*j-5,3)*cot(theta(i+5*j-5,1))/2));
minoraxis(i+5*j-5,1) = sqrt(1/(1-par(i+5*j-5,3)*cot(theta(i+5*j-5,1))/2));
mr(i+5*j-5,1) = minoraxis(i+5*j-5,1)/majoraxis(i+5*j-5,1);
    end
end
par1=[par,thetapi+90,minoraxis,majoraxis,mr];
title('African results');