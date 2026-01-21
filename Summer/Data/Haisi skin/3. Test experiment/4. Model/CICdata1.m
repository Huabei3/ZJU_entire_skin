clear all
load('CICdata1.mat');
% a1=mean(a1')';a2=mean(a2')';a3=mean(a3')';
color=[255,0,0;255,162,0;146,208,80;91,155,213;0,0,0]./255;

subplot(1,3,1);
subplot('position', [0.04 0.12 0.29 0.74]); 
for i=1:5
for j=1
par(i,:)=ellipsoidfit5(b(25*j-24:25*j,:),a1(25*j-24:25*j,i));
par(i,1)=par(i,1).*2;
f = [num2str(par(i,1)),'*sqrt(','(x-',num2str(par(i,5)),')^2+',num2str(par(i,2)),'*(y-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(x-',num2str(par(i,5)),')','*(y-',num2str(par(i,6)),'))','=',num2str(par(i,4))];
h=ezplot(f,[0,40]);set(h,'Color',color(i,:));hold on;
plot(par(i,5),par(i,6),'o','Color',color(i,:),'MarkerFaceColor',color(i,:),'MarkerSize',8);hold on;
theta(i,1) = 0.5*atan(par(i,3)/(1-par(i,2)));
thetapi(i,1) = theta(i,1)*360/(2*pi);
majoraxis(i,1) = sqrt(1/(par(i,2)+par(i,3)*cot(theta(i,1))/2));
minoraxis(i,1) = sqrt(1/(1-par(i,3)*cot(theta(i,1))/2));
mr(i,1) = minoraxis(i,1)/majoraxis(i,1);
end
end
axis([0 40 0 40]);grid on;
set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
par1=[par,thetapi+90,minoraxis,majoraxis,mr];
title('Oriental results');

subplot(1,3,2);
subplot('position', [0.37 0.12 0.29 0.74]);
for i=1:5
for j=1
par(i,:)=ellipsoidfit5(b(25*j-24:25*j,:),a2(25*j-24:25*j,i));
par(i,1)=par(i,1).*2;
f = [num2str(par(i,1)),'*sqrt(','(x-',num2str(par(i,5)),')^2+',num2str(par(i,2)),'*(y-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(x-',num2str(par(i,5)),')','*(y-',num2str(par(i,6)),'))','=',num2str(par(i,4))];
h=ezplot(f,[0,40]);set(h,'Color',color(i,:));hold on;
plot(par(i,5),par(i,6),'o','Color',color(i,:),'MarkerFaceColor',color(i,:),'MarkerSize',8);hold on;
theta(i,1) = 0.5*atan(par(i,3)/(1-par(i,2)));
thetapi(i,1) = theta(i,1)*360/(2*pi);
majoraxis(i,1) = sqrt(1/(par(i,2)+par(i,3)*cot(theta(i,1))/2));
minoraxis(i,1) = sqrt(1/(1-par(i,3)*cot(theta(i,1))/2));
mr(i,1) = minoraxis(i,1)/majoraxis(i,1);
end
end
axis([0 40 0 40]);grid on;
set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
par1=[par,thetapi+90,minoraxis,majoraxis,mr];
title('South Asian results');

subplot(1,3,3);
subplot('position', [0.70 0.12 0.29 0.74]); 
for i=1:5
for j=1
par(i,:)=ellipsoidfit5(b(25*j-24:25*j,:),a3(25*j-24:25*j,i));
par(i,1)=par(i,1).*2;
f = [num2str(par(i,1)),'*sqrt(','(x-',num2str(par(i,5)),')^2+',num2str(par(i,2)),'*(y-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(x-',num2str(par(i,5)),')','*(y-',num2str(par(i,6)),'))','=',num2str(par(i,4))];
h=ezplot(f,[0,40]);set(h,'Color',color(i,:));hold on;
plot(par(i,5),par(i,6),'o','Color',color(i,:),'MarkerFaceColor',color(i,:),'MarkerSize',8);hold on;
theta(i,1) = 0.5*atan(par(i,3)/(1-par(i,2)));
thetapi(i,1) = theta(i,1)*360/(2*pi);
majoraxis(i,1) = sqrt(1/(par(i,2)+par(i,3)*cot(theta(i,1))/2));
minoraxis(i,1) = sqrt(1/(1-par(i,3)*cot(theta(i,1))/2));
mr(i,1) = minoraxis(i,1)/majoraxis(i,1);
end
end
axis([0 40 0 40]);grid on;
set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
par1=[par,thetapi+90,minoraxis,majoraxis,mr];
title('Caucasian results');

sgtitle('Oriental skin color centers of 3 ethnic groups observers');