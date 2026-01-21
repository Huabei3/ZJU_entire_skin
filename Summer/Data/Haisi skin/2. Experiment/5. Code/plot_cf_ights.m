
obj=["o","^","p","s","o","^","p","s","d"];
color=[255,29,0;
       200,70,0;
       230,150,10;
       230,230,0;
       30,225,90;
       0,50,225;
       50,0,180;
       100,0,200;
       225,0,225]./255;
figure();
for i=1:9
scatter(i9(i,1),i9(i,2),100,color(i,:));
hold on
scatter(w9(i,1),w9(i,2),100,color(i,:));
hold on
end
scatter(io(1),io(2),300,'k');hold on;
scatter(wo(1),wo(2),300,'k');hold on;
axis([0.19 0.245 0.45 0.5]);

hold on

set(gca,'XTick',[0.15:0.005:0.25]);%设置要显示坐标刻度
set(gca,'YTick',[0.45:0.005:0.5]);%设置要显示坐标刻度
grid on