clear all
load('CICdata1.mat');
a1=mean(a1')';a2=mean(a2')';a3=mean(a3')';
color=[255,0,0;255,162,0;146,208,80;91,155,213]./255;

subplot(1,3,1);
subplot('position', [0.04 0.12 0.29 0.74]); 
for j=1:4
par(j,:)=ellipsoidfit5(b(25*j-24:25*j,:),a1(25*j-24:25*j,1));
par(j,1)=par(j,1).*2;
f = [num2str(par(j,1)),'*sqrt(','(x-',num2str(par(j,5)),')^2+',num2str(par(j,2)),'*(y-',num2str(par(j,6)),')^2+',num2str(par(j,3)),'*(x-',num2str(par(j,5)),')','*(y-',num2str(par(j,6)),'))','=',num2str(par(j,4))];
h=ezplot(f,[0,40]);set(h,'Color',color(j,:));hold on;
plot(par(j,5),par(j,6),'o','Color',color(j,:),'MarkerFaceColor',color(j,:),'MarkerSize',8);hold on;
theta(j,1) = 0.5*atan(par(j,3)/(1-par(j,2)));
thetapi(j,1) = theta(j,1)*360/(2*pi);
majoraxis(j,1) = sqrt(1/(par(j,2)+par(j,3)*cot(theta(j,1))/2));
minoraxis(j,1) = sqrt(1/(1-par(j,3)*cot(theta(j,1))/2));
mr(j,1) = minoraxis(j,1)/majoraxis(j,1);
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
for j=1:4
par(j,:)=ellipsoidfit5(b(25*j-24:25*j,:),a2(25*j-24:25*j,1));
par(j,1)=par(j,1).*2;
f = [num2str(par(j,1)),'*sqrt(','(x-',num2str(par(j,5)),')^2+',num2str(par(j,2)),'*(y-',num2str(par(j,6)),')^2+',num2str(par(j,3)),'*(x-',num2str(par(j,5)),')','*(y-',num2str(par(j,6)),'))','=',num2str(par(j,4))];
h=ezplot(f,[0,40]);set(h,'Color',color(j,:));hold on;
plot(par(j,5),par(j,6),'o','Color',color(j,:),'MarkerFaceColor',color(j,:),'MarkerSize',8);hold on;
theta(j,1) = 0.5*atan(par(j,3)/(1-par(j,2)));
thetapi(j,1) = theta(j,1)*360/(2*pi);
majoraxis(j,1) = sqrt(1/(par(j,2)+par(j,3)*cot(theta(j,1))/2));
minoraxis(j,1) = sqrt(1/(1-par(j,3)*cot(theta(j,1))/2));
mr(j,1) = minoraxis(j,1)/majoraxis(j,1);
end
axis([0 40 0 40]);grid on;
set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
par2=[par,thetapi+90,minoraxis,majoraxis,mr];
title('South Asian results');

subplot(1,3,3);
subplot('position', [0.70 0.12 0.29 0.74]); 
for j=1:4
par(j,:)=ellipsoidfit5(b(25*j-24:25*j,:),a3(25*j-24:25*j,1));
par(j,1)=par(j,1).*2;
f = [num2str(par(j,1)),'*sqrt(','(x-',num2str(par(j,5)),')^2+',num2str(par(j,2)),'*(y-',num2str(par(j,6)),')^2+',num2str(par(j,3)),'*(x-',num2str(par(j,5)),')','*(y-',num2str(par(j,6)),'))','=',num2str(par(j,4))];
h=ezplot(f,[0,40]);set(h,'Color',color(j,:));hold on;
plot(par(j,5),par(j,6),'o','Color',color(j,:),'MarkerFaceColor',color(j,:),'MarkerSize',8);hold on;
theta(j,1) = 0.5*atan(par(j,3)/(1-par(j,2)));
thetapi(j,1) = theta(j,1)*360/(2*pi);
majoraxis(j,1) = sqrt(1/(par(j,2)+par(j,3)*cot(theta(j,1))/2));
minoraxis(j,1) = sqrt(1/(1-par(j,3)*cot(theta(j,1))/2));
mr(j,1) = minoraxis(j,1)/majoraxis(j,1);
end
axis([0 40 0 40]);grid on;
set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
par3=[par,thetapi+90,minoraxis,majoraxis,mr];
title('Caucasian results');

sgtitle('4 type skin color centers of 3 ethnic groups observers');