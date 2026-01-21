fig=figure();
set(fig,'Position', [100 100 1000 500]);
subplot(1,2,1);
subplot('position', [0.05 0.1 0.44 0.85]); 
plot([-10,50], [-10,50],'color',[0.5,0.5,0.5],'linewidth',2);
axis([0 1 0 1]);hold on;grid on;
 set(gca,'XTick',[0:0.1:1]);%设置要显示坐标刻度
 set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
xlabel('Visula P%','FontSize',15);
ylabel('Predicted P%','FontSize',15);
y2=y1+(a1(1:25,5)-y1)./7;
scatter(y1,y2,'filled');

subplot(1,2,2);
subplot('position', [0.55 0.1 0.44 0.85]); 
ep=4./1.2.*sqrt(abs(0.1.*(b(1:25,2)-18.0245)+0.054.*(b(1:25,3)-13.7430)-0.0172.*(b(1:25,2)-18.0245).*(b(1:25,3)-13.7430)));
p=1-1./(1+exp(2.0345-ep))+(a1(1:25,5)-1+1./(1+exp(2.0345-ep)))./5;
scatter(ep,p,'filled');hold on;
x=0:0.001:5;
y=1-1./(1+exp(2.0345-x));
plot(x,y,'linewidth',3);hold on;
plot([0 5], [0.5 0.5],'color',[0.5,0.5,0.5]);
axis([0 5 0 1]);hold on;grid on;
 set(gca,'XTick',[0:0.5:5]);%设置要显示坐标刻度
 set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
xlabel('\Delta E''','FontSize',15);
ylabel('P%','FontSize',15);