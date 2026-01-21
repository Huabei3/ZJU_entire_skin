clear all
load('su_ch.mat')
n=['dark';'3000';'4000';'5000';'6000';'7000';'mean'];
% uv_vwpn=[v_p_uv,w_p_uv,v_n_uv,w_n_uv]
for i=1:7
uv_vwpn(i,1:2)=CCT2uv(su_ch(1,i),su_ch(2,i));
uv_vwpn(i,3:4)=CCT2uv(su_ch(3,i),su_ch(4,i));
hold on
plot(uv_vwpn(i,1),uv_vwpn(i,2),'x','color',[ 0 0.6902 0.3137],'LineWidth',2,'MarkerFaceColor','k','MarkerSize',8);
plot(uv_vwpn(i,3),uv_vwpn(i,4),'o','color',[0.9 0.2 0.2],'LineWidth',2,'MarkerSize',6);
plot([uv_vwpn(i,1);uv_vwpn(i,3)],[uv_vwpn(i,2);uv_vwpn(i,4)],'Color',[0 0 0],'LineWidth',1);
text(uv_vwpn(i,1),uv_vwpn(i,2),n(i,:),'FontSize',22,'color',[0.5 0.5 0.5]);
end

for c=1:250
    cct=5000+10*c;
    xyz1(c,:)=CCT2xyz(cct,0) ;
    uv1=xyz2uvY(xyz1);
    xyz2(c,:)=CCT2xyz(cct,-0.0025) ;
    uv2=xyz2uvY(xyz2);
    xyz3(c,:)=CCT2xyz(cct,-0.005) ;
    uv3=xyz2uvY(xyz3);
    xyz4(c,:)=CCT2xyz(cct,-0.0075) ;
    uv4=xyz2uvY(xyz4);
    xyz5(c,:)=CCT2xyz(cct,-0.01) ;
    uv5=xyz2uvY(xyz5);
end
for d=1:40
    duv=-0.01+0.00025*d;
     xyz11(d,:)=CCT2xyz(5000,duv) ;
     uv11=xyz2uvY(xyz11);
     xyz6(d,:)=CCT2xyz(5500,duv) ;
     uv6=xyz2uvY(xyz6);
     xyz7(d,:)=CCT2xyz(6000,duv) ;
     uv7=xyz2uvY(xyz7);
     xyz8(d,:)=CCT2xyz(6500,duv) ;
     uv8=xyz2uvY(xyz8);
     xyz9(d,:)=CCT2xyz(7000,duv) ;
     uv9=xyz2uvY(xyz9);
     xyz10(d,:)=CCT2xyz(7500,duv) ;
     uv10=xyz2uvY(xyz10);  
end

plot(uv1(:,1),uv1(:,2),'Color','k','LineWidth',2,'color',[0.5 0.5 0.5]);
plot(uv2(:,1),uv2(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv3(:,1),uv3(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv6(:,1),uv6(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv7(:,1),uv7(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv8(:,1),uv8(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv9(:,1),uv9(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv10(:,1),uv10(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv11(:,1),uv11(:,2),'Color','k','color',[0.5 0.5 0.5]);

xlabel('up','FontName','Times New Roman','FontSize',15);
ylabel('vp','FontName','Times New Roman','FontSize',15);
% title('visual vs weighted for preference','FontName','Times New Roman','FontSize',15);

text(uv1(1,1),uv1(1,2),'BBL','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv2(1,1),uv2(1,2),'-0.0025','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv3(1,1),uv3(1,2),'-0.005','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv4(1,1),uv4(1,2),'-0.0075','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv5(1,1),uv5(1,2),'-0.01','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv6(1,1),uv6(1,2),'5500K','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv7(1,1),uv7(1,2),'6000K','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv8(1,1),uv8(1,2),'6500K','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv9(1,1),uv9(1,2),'7000K','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv10(1,1),uv10(1,2),'7500K','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv11(1,1),uv11(1,2),'5000K','FontSize',22,'color',[0.5 0.5 0.5]);
hold off
print(1, '-dbmp', strcat('./plot/', 'su_ch'));