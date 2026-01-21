scatter(a(:,2),a(:,1),'filled');hold on;
scatter(a1(:,2),a1(:,1),'filled');hold on;

for i=1:8
plot([a(i,2),a1(i,2)],[a(i,1),a1(i,1)],'Color',[0.3,0.3,0.3]);
text(a1(i,2),a1(i,1)-5,num2str(i));
end
plot([0,0],[0,100],'Color',[0.5,0.5,0.5]);
plot([0,120],[0,0],'Color',[0.5,0.5,0.5]);
axis([0 120 0 100]);hold on;grid on;
set(gca,'XTick',[0:10:120]);%设置要显示坐标刻度
set(gca,'YTick',[0:10:100]);%设置要显示坐标刻度
xlabel('C*','FontSize',15);
ylabel('L*','FontSize',15);
title('Preferred results on CIELAB C*L*');