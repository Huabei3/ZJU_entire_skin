fig=figure();
set(fig,'Position', [100 100 1300 640]);

subplot(1,2,1);
subplot('position', [0.08 0.12 0.39 0.84]); 
axis equal;grid on;
hold on
axis([-100 100 -100 100]);
for i=1:24
plot(b1(i,2),b1(i,3),'.','color',[185,105,0]./205,'MarkerSize',30);
plot(a1(i,2),a1(i,3),'.','color',[225,0,0]./255,'MarkerSize',40);
plot([a1(i,2),b1(i,2)],[a1(i,3),b1(i,3)],'color',[0.6,0.6,0.6]);
text(a1(i,2),a1(i,3)+6,num2str(i));
end
plot([0,0],[-100,100],'color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'color',[0.5,0.5,0.5]);
legend('Natrual','Preferred');
set(gca,'XTick',[-100:20:110]);%设置要显示坐标刻度
set(gca,'YTick',[-100:20:110]);%设置要显示坐标刻度
xlabel('a*','FontName','Times New Roman','FontSize',15);
ylabel('b*','FontName','Times New Roman','FontSize',15);


a1(:,4)=sqrt(a1(:,2).^2+a1(:,3).^2);
a2(:,4)=sqrt(a2(:,2).^2+a2(:,3).^2);
a3(:,4)=sqrt(a3(:,2).^2+a3(:,3).^2);
a4(:,4)=sqrt(a4(:,2).^2+a4(:,3).^2);
a5(:,4)=sqrt(a5(:,2).^2+a5(:,3).^2);
b1(:,4)=sqrt(b1(:,2).^2+b1(:,3).^2);
subplot(1,2,2);
subplot('position', [0.58 0.12 0.39 0.84]); 
axis equal;grid on;
hold on
axis([0 100 0 100]);
for i=1:24
plot(b1(i,4),b1(i,1),'.','color',[185,105,0]./205,'MarkerSize',30);
plot(a1(i,4),a1(i,1),'.','color',[225,0,0]./255,'MarkerSize',40);
plot([a1(i,4),b1(i,4)],[a1(i,1),b1(i,1)],'color',[0.6,0.6,0.6]);
text(a1(i,4),a1(i,1)+6,num2str(i));
end
legend('Natrual','Preferred');
set(gca,'XTick',[-100:10:110]);%设置要显示坐标刻度
set(gca,'YTick',[-100:10:100]);%设置要显示坐标刻度
xlabel('C*','FontName','Times New Roman','FontSize',15);
ylabel('L*','FontName','Times New Roman','FontSize',15);
sgtitle('CHn(leeds) Memory colour');