 obj=["x","^","s","d","o","v","p","h"];
color=[
       255,30,0;
       250,100,0;
       230,230,0;
       150,230,0;
       0,150,0;
       0,250,250;
       0,50,250;
       100,0,200;
       225,0,225]./255;
   
figure();

for j=1:8
    for i=1:9
    a1=[bx(j,i),by(j,i),bz(j,i)];
    a2=xyz2lab(a1,'user',[433.8 475.0 566.4]);
     scatter(a2(1,2),a2(1,3),30,color(i,:),obj(j));hold on;
    end
    a3=[bx(j,10),by(j,10),bz(j,10)];
    a4=xyz2lab(a3,'user',[433.8 475.0 566.4]);
     scatter(a4(1,2),a4(1,3),100,'k',obj(j));hold on;
     text(a4(1,2),a4(1,3)+1,num2str(j),'FontSize',10);   
end

axis([10 25 10 25]);hold on

set(gca,'XTick',[10:3:25]);%设置要显示坐标刻度
set(gca,'YTick',[10:3:25]);%设置要显示坐标刻度
xlabel('a*','FontName','Times New Roman','FontSize',15);
ylabel('b*','FontName','Times New Roman','FontSize',15,'LineWidth',1.5);

grid on