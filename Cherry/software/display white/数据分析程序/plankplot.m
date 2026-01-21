for c=1:60
    cct=2500+200*c;
    xyz1(c,:)=CCT2xyz(cct,-0.015) ;
    uv1=xyz2uvY(xyz1);
    xyz2(c,:)=CCT2xyz(cct,-0.01) ;
    uv2=xyz2uvY(xyz2);
    xyz3(c,:)=CCT2xyz(cct,-0.005) ;
    uv3=xyz2uvY(xyz3);
    xyz4(c,:)=CCT2xyz(cct,0) ;
    uv4=xyz2uvY(xyz4);
    xyz5(c,:)=CCT2xyz(cct,0.005) ;
    uv5=xyz2uvY(xyz5);
    xyz6(c,:)=CCT2xyz(cct,0.01) ;
    uv6=xyz2uvY(xyz6);
    xyz7(c,:)=CCT2xyz(cct,0.015) ;
    uv7=xyz2uvY(xyz7);    
end
for d=1:50
    duv=-0.025+0.001*d;
     xyz8(d,:)=CCT2xyz(3000,duv) ;
     uv8=xyz2uvY(xyz8);
     xyz9(d,:)=CCT2xyz(4000,duv) ;
     uv9=xyz2uvY(xyz9);
     xyz10(d,:)=CCT2xyz(5000,duv) ;
     uv10=xyz2uvY(xyz10);
     xyz11(d,:)=CCT2xyz(6500,duv) ;
     uv11=xyz2uvY(xyz11);
     xyz12(d,:)=CCT2xyz(8000,duv) ;
     uv12=xyz2uvY(xyz12);
     xyz13(d,:)=CCT2xyz(10000,duv) ;
     uv13=xyz2uvY(xyz13);  
end

plot(light(1,1),light(1,2),'r-^','LineWidth',1,'MarkerSize',6,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[0.5 0.5 0.5]); 
plot(light(2,1),light(2,2),'m-^','LineWidth',1,'MarkerSize',6,'MarkerFaceColor',[1 0.5 0],'MarkerEdgeColor',[0.5 0.5 0.5]); 
plot(light(3,1),light(3,2),'g-^','LineWidth',1,'MarkerSize',6,'MarkerFaceColor',[0 1 0],'MarkerEdgeColor',[0.5 0.5 0.5]); 
plot(light(4,1),light(4,2),'c-^','LineWidth',1,'MarkerSize',6,'MarkerFaceColor',[0 1 1],'MarkerEdgeColor',[0.5 0.5 0.5]); 
plot(light(5,1),light(5,2),'b-^','LineWidth',1,'MarkerSize',6,'MarkerFaceColor',[0 0 1],'MarkerEdgeColor',[0.5 0.5 0.5]); 

plot(uvy(1,1),uvy(1,2),'r-o','LineWidth',1,'MarkerSize',5,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[0.5 0.5 0.5]); 
hold on;
plot(uvy(2,1),uvy(2,2),'m-o','LineWidth',1,'MarkerSize',5,'MarkerFaceColor',[1 0.5 0],'MarkerEdgeColor',[0.5 0.5 0.5]); 
plot(uvy(3,1),uvy(3,2),'g-o','LineWidth',1,'MarkerSize',5,'MarkerFaceColor',[0 1 0],'MarkerEdgeColor',[0.5 0.5 0.5]); 
plot(uvy(4,1),uvy(4,2),'c-o','LineWidth',1,'MarkerSize',5,'MarkerFaceColor',[0 1 1],'MarkerEdgeColor',[0.5 0.5 0.5]); 
plot(uvy(5,1),uvy(5,2),'b-o','LineWidth',1,'MarkerSize',5,'MarkerFaceColor',[0 0 1],'MarkerEdgeColor',[0.5 0.5 0.5]); 

xlim([0.16 0.3])
ylim([0.42 0.56])

plot(uv4(:,1),uv4(:,2),'Color','k','LineWidth',1.5);
axis equal;
hold on;
plot(uv1(:,1),uv1(:,2),'Color','k','LineWidth',1);
plot(uv2(:,1),uv2(:,2),'Color','k');
plot(uv3(:,1),uv3(:,2),'Color','k');
plot(uv5(:,1),uv5(:,2),'Color','k');
plot(uv6(:,1),uv6(:,2),'Color','k');
plot(uv7(:,1),uv7(:,2),'Color','k');
plot(uv8(:,1),uv8(:,2),'Color','k','LineWidth',1);
plot(uv8(:,1),uv8(:,2),'Color','k');
plot(uv9(:,1),uv9(:,2),'Color','k');
plot(uv10(:,1),uv10(:,2),'Color','k');
plot(uv11(:,1),uv11(:,2),'Color','k');
plot(uv12(:,1),uv12(:,2),'Color','k');
plot(uv13(:,1),uv13(:,2),'Color','k');
xlabel('u¡¯'),ylabel('v¡¯');
% title('1000 lx');
text(uv1(1,1),uv1(1,2),'-0.015');
text(uv2(1,1),uv2(1,2),'-0.01');
text(uv3(1,1),uv3(1,2),'-0.005');
text(uv4(1,1),uv4(1,2),'0');
text(uv5(1,1),uv5(1,2),'0.005');
text(uv6(1,1),uv6(1,2),'0.01');
text(uv7(1,1),uv7(1,2),'0.015');
text(uv8(1,1),uv8(1,2),'3000K');
text(uv9(1,1),uv9(1,2),'4000K');
text(uv10(1,1),uv10(1,2),'5000K');
text(uv11(1,1),uv11(1,2),'6500K');
text(uv12(1,1),uv12(1,2),'8000K');
text(uv13(1,1),uv13(1,2),'10000K');
axis([0.16 0.3 0.42 0.56]);

for i=1:42
    plot(uvY54(i,1),uvY54(i,2),'r-^','LineWidth',1,'MarkerSize',4,'MarkerFaceColor',[1 0 0]); 
    hold on;
end

for i=1:42
    plot(uvYw(i,1),uvYw(i,2),'k-o','LineWidth',1,'MarkerSize',5); 
    hold on;
end

for i=1:42
    start=[uvYw(i,1),uvYw(i,2)];
    endp=[uvY54(i,1),uvY54(i,2)];
    draw_arrow(start,endp);
    hold on;
end







