 load('plot25white.mat')
axis([0.18 0.33 0.4 0.55]);hold on
set(gcf,'position',[100,100,500,500]);
set(gca,'XTick',[0.18:0.03:0.33]);%设置要显示坐标刻度
set(gca,'YTick',[0.4:0.03:0.55]);%设置要显示坐标刻度
grid on
% bb=[mean(reshape(b(:,1),25,8)')',mean(reshape(b(:,2),25,8)')'];
% scatter(uv(:,1),uv(:,2),55);hold on;

for c=1:46
    cct=2300+200*c;
        xyz1(c,:)=CCT2xyz(cct,0) ;
    uv1=xyz2uvY(xyz1);
        xyz2(c,:)=CCT2xyz(cct,-0.005) ;
    uv2=xyz2uvY(xyz2);
        xyz3(c,:)=CCT2xyz(cct,-0.01) ;
    uv3=xyz2uvY(xyz3);
        xyz4(c,:)=CCT2xyz(cct,0.005) ;
    uv4=xyz2uvY(xyz4);
        xyz0(c,:)=CCT2xyz(cct,0.01) ;
    uv0=xyz2uvY(xyz0);
end

for d=1:30
    duv=-0.015+0.001*d;
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

plot(uv1(:,1),uv1(:,2),'Color','k','LineWidth',1,'color',[0.5 0.5 0.5]);
% plot(uv2(6:45,1),uv2(6:45,2),'Color','k','LineWidth',1,'color',[0.8 0.8 0.8]);
% plot(uv3(6:45,1),uv3(6:45,2),'Color','k','LineWidth',1,'color',[0.8 0.8 0.8]);
% plot(uv4(6:45,1),uv4(6:45,2),'Color','k','LineWidth',1,'color',[0.8 0.8 0.8]);
% plot(uv0(6:45,1),uv0(6:45,2),'Color','k','LineWidth',1,'color',[0.8 0.8 0.8]);
% % plot(uv5(:,1),uv5(:,2),'Color','k','LineWidth',1,'color',[0.8 0.8 0.8]);
% plot(uv6(:,1),uv6(:,2),'Color','k','LineWidth',1,'color',[0.8 0.8 0.8]);
% plot(uv7(:,1),uv7(:,2),'Color','k','LineWidth',1,'color',[0.8 0.8 0.8]);
% plot(uv8(:,1),uv8(:,2),'Color','k','LineWidth',1,'color',[0.8 0.8 0.8]);
% plot(uv9(:,1),uv9(:,2),'Color','k','LineWidth',1,'color',[0.8 0.8 0.8]);
% plot(uv10(:,1),uv10(:,2),'Color','k','LineWidth',1,'color',[0.8 0.8 0.8]);
scatter(aa(1,1),aa(1,2),85,[0.9,0.1,0],'filled');
scatter(aa(2,1),aa(2,2),85,[0.9,0.75,0],'filled');
scatter(aa(3,1),aa(3,2),85,[0.1,0.9,0.1],'filled');
scatter(aa(4,1),aa(4,2),85,[0,0.1,0.9],'filled');
% scatter(uv5(15,1),uv5(15,2),'filled');
% scatter(uv6(15,1),uv6(15,2),'filled');
% scatter(uv7(15,1),uv7(15,2),'filled');
% scatter(uv8(15,1),uv8(15,2),'filled');
% scatter(uv9(15,1),uv9(15,2),'filled');
% scatter(uv10(15,1),uv10(15,2),'filled');

%  scatter(b(13,1),b(13,2),'filled','k');

text(uv1(1,1),uv1(1,2),'BBL','FontSize',15,'color',[0.5 0.5 0.5]);
% text(uv2(6,1),uv2(6,2),'-0.005','FontSize',15,'color',[0.5 0.5 0.5]);
% text(uv3(6,1),uv3(6,2),'-0.01','FontSize',15,'color',[0.5 0.5 0.5]);
% text(uv4(6,1),uv4(6,2),'0.005','FontSize',15,'color',[0.5 0.5 0.5]);
% text(uv0(6,1),uv0(6,2),'0.01','FontSize',15,'color',[0.5 0.5 0.5]);
 text(uv5(15,1)+0.005,uv5(15,2),'3000K','FontSize',15,'color',[0.5 0.5 0.5]);
 text(uv6(15,1)+0.005,uv6(15,2),'4000K','FontSize',15,'color',[0.5 0.5 0.5]);
 text(uv7(15,1)+0.005,uv7(15,2),'5000K','FontSize',15,'color',[0.5 0.5 0.5]);
 text(uv8(15,1)+0.005,uv8(15,2),'6500K','FontSize',15,'color',[0.5 0.5 0.5]);
%  text(uv9(1,1),uv9(1,2),'8000K','FontSize',15,'color',[0.5 0.5 0.5]);
%  text(uv10(1,1),uv10(1,2),'10000K','FontSize',15,'color',[0.5 0.5 0.5]);
% text(b(13,1)+0.0015,b(13,2)+0.005,'D65');

