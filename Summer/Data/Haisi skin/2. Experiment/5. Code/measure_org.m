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

for j=1:8
%      scatter(dd(j,1),dd(j,2),300,color(j,:));hold on;
     scatter(aaa(j,1),aaa(j,2),400,color(j,:));hold on;
%      plot([dd(j,1);aaa(j,1)],[dd(j,2);aaa(j,2)],'k');
     text(aaa(j,1),aaa(j,2),num2str(j),'FontSize',10);
    
end

axis([0.22 0.27 0.47 0.52]);hold on

set(gca,'XTick',[0.22:0.01:0.27]);%设置要显示坐标刻度
set(gca,'YTick',[0.47:0.01:0.52]);%设置要显示坐标刻度
grid on