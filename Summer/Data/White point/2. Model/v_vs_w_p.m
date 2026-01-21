load('data_vwpn.mat')
% uv_vwpn=[v_p_uv,w_p_uv,v_n_uv,w_n_uv]
for i=1:24
uv_vwpn(i,1:2)=CCT2uv(v_w_p(i,1),v_w_p(i,2));
uv_vwpn(i,3:4)=CCT2uv(v_w_p(i,3),v_w_p(i,4));
uv_vwpn(i,5:6)=CCT2uv(v_w_n(i,1),v_w_n(i,2));
uv_vwpn(i,7:8)=CCT2uv(v_w_n(i,3),v_w_n(i,4));
hold on
plot(uv_vwpn(i,1),uv_vwpn(i,2),'x','color',[ 0    0.6902    0.3137],'LineWidth',2,'MarkerFaceColor','k','MarkerSize',8);
plot(uv_vwpn(i,3),uv_vwpn(i,4),'o','color',[0.9 0.2 0.2],'LineWidth',2,'MarkerSize',6);
plot([uv_vwpn(i,1);uv_vwpn(i,3)],[uv_vwpn(i,2);uv_vwpn(i,4)],'Color',[0 0 0],'LineWidth',1);
end

for c=1:35
    cct=3500+200*c;
    xyz1(c,:)=CCT2xyz(cct,0) ;
    uv1=xyz2uvY(xyz1);
    xyz2(c,:)=CCT2xyz(cct,-0.02) ;
    uv2=xyz2uvY(xyz2);
    xyz3(c,:)=CCT2xyz(cct,-0.01) ;
    uv3=xyz2uvY(xyz3);
    xyz4(c,:)=CCT2xyz(cct,0.01) ;
    uv4=xyz2uvY(xyz4);
end
for d=1:40
    duv=-0.029+0.001*d;
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
plot(uv2(:,1),uv2(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv3(:,1),uv3(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv6(:,1),uv6(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv7(:,1),uv7(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv8(:,1),uv8(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv9(:,1),uv9(:,2),'Color','k','color',[0.5 0.5 0.5]);

xlabel('up','FontName','Times New Roman','FontSize',15);
ylabel('vp','FontName','Times New Roman','FontSize',15);
% title('visual vs weighted for preference','FontName','Times New Roman','FontSize',15);

text(uv1(1,1),uv1(1,2),'BBL','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv2(1,1),uv2(1,2),'-0.02','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv3(1,1),uv3(1,2),'-0.01','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv6(1,1),uv6(1,2),'4000K','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv7(1,1),uv7(1,2),'5000K','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv8(1,1),uv8(1,2),'6500K','FontSize',22,'color',[0.5 0.5 0.5]);
text(uv9(1,1),uv9(1,2),'8000K','FontSize',22,'color',[0.5 0.5 0.5]);
hold off
print(1,'-dbmp',strcat('D:\owncloud\PhD\Graduation Project\Experiment\plot\plot410\','v_w_p'));


