clear all
load('data0621-2.mat');
color=[255,0,0;255,162,0;225,225,0;146,208,80;91,155,213]./255;
D=[0.454 0.521 0.562 0.599 0.622]/2;
c=mean(a')';
c=reshape(c,100,5);
% par=ellipsoidfit5(b(1:25,:),c(1:25,5));

subplot(2,2,1);
subplot('position', [0.1 0.55 0.35 0.35]); 
for i=1:5
    b1=xyz2lab(f(:,3*i-2:3*i),'user',f1(i,:)./f1(i,2).*475); 
    b1(:,3)=b1(:,3)+3;
    for j=1
par(i+5*j-5,:)=ellipsoidfit5(b1(25*j-24:25*j,:),c(25*j-24:25*j,i));
f3 = [num2str(par(i+5*j-5,1)),'*sqrt(','(x-',num2str(par(i+5*j-5,5)),')^2+',num2str(par(i+5*j-5,2)),'*(y-',num2str(par(i+5*j-5,6)),')^2+',num2str(par(i+5*j-5,3)),'*(x-',num2str(par(i+5*j-5,5)),')','*(y-',num2str(par(i+5*j-5,6)),'))','=',num2str(par(i+5*j-5,4))];
h=ezplot(f3,[-20,40]);set(h,'Color',color(i,:));hold on;
 axis([-20 40 -20 40]);hold on;grid on;
 set(gca,'XTick',[-20:10:40]);%设置要显示坐标刻度
 set(gca,'YTick',[-20:10:40]);%设置要显示坐标刻度
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
title('Aferican results');

subplot(2,2,2);
subplot('position',[0.6 0.55 0.35 0.35]);
for i=1:5
    b1=xyz2lab(f(:,3*i-2:3*i),'user',f1(i,:)./f1(i,2).*475); 
    b1(:,3)=b1(:,3)+3;
    for j=2
par(i+5*j-5,:)=ellipsoidfit5(b1(25*j-24:25*j,:),c(25*j-24:25*j,i));
f3 = [num2str(par(i+5*j-5,1)),'*sqrt(','(x-',num2str(par(i+5*j-5,5)),')^2+',num2str(par(i+5*j-5,2)),'*(y-',num2str(par(i+5*j-5,6)),')^2+',num2str(par(i+5*j-5,3)),'*(x-',num2str(par(i+5*j-5,5)),')','*(y-',num2str(par(i+5*j-5,6)),'))','=',num2str(par(i+5*j-5,4))];
h=ezplot(f3,[-20,40]);set(h,'Color',color(i,:));hold on;
 axis([-20 40 -20 40]);hold on;grid on;
 set(gca,'XTick',[-20:10:40]);%设置要显示坐标刻度
 set(gca,'YTick',[-20:10:40]);%设置要显示坐标刻度
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
title('Caucasian results');

subplot(2,2,3);
subplot('position',[0.1 0.1 0.35 0.35]);  
for i=1:5
    b1=xyz2lab(f(:,3*i-2:3*i),'user',f1(i,:)./f1(i,2).*475); 
    b1(:,3)=b1(:,3)+3;;
    for j=3
par(i+5*j-5,:)=ellipsoidfit5(b1(25*j-24:25*j,:),c(25*j-24:25*j,i))

f3= [num2str(par(i+5*j-5,1)),'*sqrt(','(x-',num2str(par(i+5*j-5,5)),')^2+',num2str(par(i+5*j-5,2)),'*(y-',num2str(par(i+5*j-5,6)),')^2+',num2str(par(i+5*j-5,3)),'*(x-',num2str(par(i+5*j-5,5)),')','*(y-',num2str(par(i+5*j-5,6)),'))','=',num2str(par(i+5*j-5,4))];
h=ezplot(f3,[-20,40]);set(h,'Color',color(i,:));hold on;
 axis([-20 40 -20 40]);hold on;grid on;
 set(gca,'XTick',[-20:10:40]);%设置要显示坐标刻度
 set(gca,'YTick',[-20:10:40]);%设置要显示坐标刻度
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
title('Oriental results');

subplot(2,2,4);
subplot('position',[0.6 0.1 0.35 0.35]);
for i=1:5
    b1=xyz2lab(f(:,3*i-2:3*i),'user',f1(i,:)./f1(i,2).*475); 
    b1(:,3)=b1(:,3)+3;
    for j=4
par(i+5*j-5,:)=ellipsoidfit5(b1(25*j-24:25*j,:),c(25*j-24:25*j,i));
f3 = [num2str(par(i+5*j-5,1)),'*sqrt(','(x-',num2str(par(i+5*j-5,5)),')^2+',num2str(par(i+5*j-5,2)),'*(y-',num2str(par(i+5*j-5,6)),')^2+',num2str(par(i+5*j-5,3)),'*(x-',num2str(par(i+5*j-5,5)),')','*(y-',num2str(par(i+5*j-5,6)),'))','=',num2str(par(i+5*j-5,4))];
h=ezplot(f3,[-20,40]);set(h,'Color',color(i,:));hold on;
 axis([-20 40 -20 40]);hold on;grid on;
 set(gca,'XTick',[-20:10:40]);%设置要显示坐标刻度
 set(gca,'YTick',[-20:10:40]);%设置要显示坐标刻度
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
title('South Asian results');


sgtitle('Preferred skin color centers (David model) on CIELAB (gray background)');



par=[par,thetapi,majoraxis,minoraxis,mr];
