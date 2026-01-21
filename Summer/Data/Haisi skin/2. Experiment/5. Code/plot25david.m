axis([0.15 0.3 0.4 0.55]);hold on
set(gca,'XTick',[0.15:0.03:0.3]);%设置要显示坐标刻度
set(gca,'YTick',[0.4:0.03:0.55]);%设置要显示坐标刻度
grid on

 scatter(b(:,1),b(:,2));hold on;

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

 scatter(b(13,1),b(13,2),'filled','k');

text(uv1(1,1),uv1(1,2),'BBL','FontSize',10,'color',[0.5 0.5 0.5]);
 text(uv5(1,1)-0.006,uv5(1,2)+0.007,'3000K','FontSize',10,'color',[0.5 0.5 0.5]);
 text(uv6(1,1)-0.015,uv6(1,2),'4000K','FontSize',10,'color',[0.5 0.5 0.5]);
 text(uv7(1,1)-0.015,uv7(1,2)+0.002,'5000K','FontSize',10,'color',[0.5 0.5 0.5]);
 text(uv8(1,1)-0.015,uv8(1,2),'6500K','FontSize',10,'color',[0.5 0.5 0.5]);
 text(uv9(1,1)-0.015,uv9(1,2),'8000K','FontSize',10,'color',[0.5 0.5 0.5]);
 text(uv10(1,1)-0.02,uv10(1,2),'10000K','FontSize',10,'color',[0.5 0.5 0.5]);
text(b(13,1)+0.0015,b(13,2)+0.005,'D65');