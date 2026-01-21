fig=figure();
set(fig,'Position', [100 100 400 400]);
axis equal;
hold on

axis([-100 100 -100 100]);
for i=1:18
plot(x(i,2),x(i,3),'o','color',[15,74,155]./255,'MarkerFaceColor',[15,74,155]./255);
end
for i=19:24
plot(x(i,2),x(i,3),'o','color',[255,29,0]./255,'MarkerFaceColor',[255,29,0]./255);
end
for i=25:29
plot(x(i,2),x(i,3),'o','color',[10,205,10]./255,'MarkerFaceColor',[10,205,10]./255);
end
for i=1:29
    text(x(i,2)-2,x(i,3)+6,num2str(i),'color','k');
end
text(-80,-70,'Blue: Indoor objects','color',[15,74,155]./255);
text(-80,-80,'Red: Out door object','color',[255,29,0]./255);
text(-80,-90,'Green: Chinese objects','color',[10,205,10]./255);
plot([0,0],[-100,100],'color','k');
plot([-100,100],[0,0],'color','k');
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
set(gca,'XTick',[-100:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:20:100]);%设置要显示坐标刻度
title('Memory color (CIELAB a*b*)'); 
grid on