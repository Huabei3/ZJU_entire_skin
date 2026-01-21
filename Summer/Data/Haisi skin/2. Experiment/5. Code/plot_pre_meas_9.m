color=[0,0,0;
       255,29,0;
       200,70,0;
       230,150,10;
       230,230,0;
       30,225,90;
       0,50,225;
       50,0,180;
       100,0,200;
       225,0,225]./255;
   
figure();
for j=7
for i=1:9
  scatter(dd(j,i),dd(j,(i+10)),100,color(i,:));hold on;
  scatter(aa(i,(j*3-2)),aa(i,(j*3-1)),100,color(i,:),'^');hold on;
  plot([dd(j,i),aa(i,(j*3-2))],[dd(j,(i+10)),aa(i,(j*3-1))],'k');hold on;
  text(dd(j,i),dd(j,(i+10))+0.0005,num2str(i),'FontSize',10);   
end
end

axis([0.22 0.23 0.48 0.49]);hold on

set(gca,'XTick',[0.22:0.001:0.23]);%设置要显示坐标刻度
set(gca,'YTick',[0.48:0.001:0.49]);%设置要显示坐标刻度
grid on