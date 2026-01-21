%  clear all
%  load('LIMdata2.mat');
 color=[255,0,0;255,162,0;225,225,0;146,208,80;91,155,213;0,0,0]./255;
for i=4
    for j=1
par(i+6*j-6,:)=ellipsoidfit4(c(45*j-44:45*j,:),a(45*j-44:45*j,i));
f = [num2str(par(i+6*j-6,1)),'*sqrt(','(x-',num2str(par(i+6*j-6,5)),')^2+',num2str(par(i+6*j-6,2)),'*(y-',num2str(par(i+6*j-6,6)),')^2+',num2str(par(i+6*j-6,3)),'*(x-',num2str(par(i+6*j-6,5)),')','*(y-',num2str(par(i+6*j-6,6)),'))','=',num2str(par(i+6*j-6,4))];
h=ezplot(f,[0,40]);set(h,'Color',color(i,:));hold on;
axis([0 40 0 40]); hold on;grid on;
set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(par(i+6*j-6,5),par(i+6*j-6,6),'o','Color',color(i,:),'MarkerFaceColor',color(i,:),'MarkerSize',8);hold on;
    end
end
title('Female results');