obj=["o","^","s","d","o","^","s","d","o","^","s","d",];
color=[255,30,0;255,30,0;255,30,0;255,30,0;
        0,230,0;0,230,0;0,230,0;0,230,0;
        0,50,250;0,50,250;0,50,250;0,50,250]./255;  
fig1 = figure();
set(fig1,'Position',[100 100 500 500]);
for i=1:12
     scatter(a(i,1),a(i,2),50,color(i,:),obj(i));hold on;
     scatter(b(i,1),b(i,2),50,color(i,:),obj(i),'filled');hold on;
     plot([a(i,1),b(i,1)],[a(i,2),b(i,2)],'k'); 
end

axis([0 80 0 80]);hold on

set(gca,'XTick',[0:10:80]);%设置要显示坐标刻度
set(gca,'YTick',[0:10:80]);%设置要显示坐标刻度
xlabel('C*','FontName','Times New Roman','FontSize',15);
ylabel('L*','FontName','Times New Roman','FontSize',15,'LineWidth',1.5);

grid on