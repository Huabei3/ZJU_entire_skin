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
   
axis([0.15 0.3 0.4 0.55]);hold on
set(gca,'XTick',[0.15:0.03:0.3]);%设置要显示坐标刻度
set(gca,'YTick',[0.4:0.03:0.55]);%设置要显示坐标刻度

figure();
grid on
for j=1:8
    for i=1:9
     scatter(d(j,i),d(j,(i+10)),30,color(i,:),obj(j));hold on;
    end
     scatter(d(j,10),d(j,20),100,'k',obj(j));hold on;
     text(d(j,10),d(j,20)+0.005,num2str(j),'FontSize',20);   
end


for c=1:45
    cct=2500+200*c;
    xyz1(c,:)=CCT2xyz(cct,0) ;
    uv1=xyz2uvY(xyz1);
end

for d=1:20
    duv=0;
     xyz5(d,:)=CCT2xyz(3000,duv) ;
     uv5=xyz2uvY(xyz5);
     xyz6(d,:)=CCT2xyz(4000,duv) ;
     uv6=xyz2uvY(xyz6);
     xyz7(d,:)=CCT2xyz(5000,duv) ;
     uv7=xyz2uvY(xyz7);
     xyz8(d,:)=CCT2xyz(6500,duv) ;
     uv8=xyz2uvY(xyz8);
     xyz9(d,:)=CCT2xyz(8000,duv) ;
     uv9=xyz2uvY(xyz9);
     xyz10(d,:)=CCT2xyz(10000,duv) ;
     uv10=xyz2uvY(xyz10);  
end

plot(uv1(:,1),uv1(:,2),'Color','k','LineWidth',2,'color',[0.5 0.5 0.5]);
scatter(uv5(1,1),uv5(1,2),'filled');
scatter(uv6(1,1),uv6(1,2),'filled');
scatter(uv7(1,1),uv7(1,2),'filled');
scatter(uv8(1,1),uv8(1,2),'filled');
scatter(uv9(1,1),uv9(1,2),'filled');
scatter(uv10(1,1),uv10(1,2),'filled');
grid on;
text(uv1(1,1),uv1(1,2),'BBL','FontSize',10,'color',[0.5 0.5 0.5]);
 text(uv5(1,1),uv5(1,2),'3000K','FontSize',10,'color',[0.5 0.5 0.5]);
 text(uv6(1,1),uv6(1,2),'4000K','FontSize',10,'color',[0.5 0.5 0.5]);
 text(uv7(1,1),uv7(1,2),'5000K','FontSize',10,'color',[0.5 0.5 0.5]);
 text(uv8(1,1),uv8(1,2),'6500K','FontSize',10,'color',[0.5 0.5 0.5]);
 text(uv9(1,1),uv9(1,2),'8000K','FontSize',10,'color',[0.5 0.5 0.5]);
 text(uv10(1,1),uv10(1,2),'10000K','FontSize',10,'color',[0.5 0.5 0.5]);

xlabel('up','FontName','Times New Roman','FontSize',15);
ylabel('vp','FontName','Times New Roman','FontSize',15,'LineWidth',1.5);