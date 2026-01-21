% load('w63.mat')
% uv_vwpn=[v_p_uv,w_p_uv,v_n_uv,w_n_uv]
for i=1:45
%     if (cc(i,1)./45)<0.5
% plot(uv(i,1),uv(i,2),'o','color','k','LineWidth',1,'MarkerFaceColor',[0.5 0.5 0.5],'MarkerSize',cc(i,1)./2);
%     else if (cc(i,1)./45)<0.55
%         plot(uv(i,1),uv(i,2),'o','color','k','LineWidth',1,'MarkerFaceColor',[0.5 0.5 0.5],'MarkerSize',cc(i,1)./2);
%         else if (cc(i,1)./45)<0.6
%          plot(uv(i,1),uv(i,2),'o','color','k','LineWidth',1,'MarkerFaceColor',[0.5 0.5 0.5],'MarkerSize',cc(i,1)./2);
%               else if (cc(i,1)./45)<0.65
%                plot(uv(i,1),uv(i,2),'o','color','k','LineWidth',1,'MarkerFaceColor',[0.5 0.5 0.5],'MarkerSize',cc(i,1)./2);
%                 else if (cc(i,1)./45)<0.7
%                  plot(uv(i,1),uv(i,2),'o','color','k','LineWidth',1,'MarkerFaceColor',[0.5 0.5 0.5],'MarkerSize',cc(i,1)./2);
%                   else
                 plot(uv(i,1),uv(i,2),'o','color','k','LineWidth',1,'MarkerFaceColor',[0.5 0.5 0.5],'MarkerSize',cc(i+45,1)./10);
   
%        end
%       end
%      end
%     end
hold on
end

for c=1:100
    cct=2500+100*c;
    xyz1(c,:)=CCT2xyz(cct,0) ;
    uv1=xyz2uvY(xyz1);
%     xyz2(c,:)=CCT2xyz(cct,-0.015) ;
%     uv2=xyz2uvY(xyz2);
    xyz3(c,:)=CCT2xyz(cct,-0.01) ;
    uv3=xyz2uvY(xyz3);
    xyz4(c,:)=CCT2xyz(cct,-0.005) ;
    uv4=xyz2uvY(xyz4);
    xyz5(c,:)=CCT2xyz(cct,0.005) ;
    uv5=xyz2uvY(xyz5);
    xyz6(c,:)=CCT2xyz(cct,0.01) ;
    uv6=xyz2uvY(xyz6);
%     xyz7(c,:)=CCT2xyz(cct,0.015) ;
%     uv7=xyz2uvY(xyz7);
end
for d=1:40
    duv=-0.02+0.001*d;
     xyz8(d,:)=CCT2xyz(3000,duv) ;
     uv8=xyz2uvY(xyz8);
     xyz9(d,:)=CCT2xyz(3500,duv) ;
     uv9=xyz2uvY(xyz9);
     xyz10(d,:)=CCT2xyz(4000,duv) ;
     uv10=xyz2uvY(xyz10);
     xyz11(d,:)=CCT2xyz(4500,duv) ;
     uv11=xyz2uvY(xyz11);
     xyz12(d,:)=CCT2xyz(5000,duv) ;
     uv12=xyz2uvY(xyz12);
     xyz13(d,:)=CCT2xyz(6000,duv) ;
     uv13=xyz2uvY(xyz13);  
      xyz14(d,:)=CCT2xyz(7000,duv) ;
     uv14=xyz2uvY(xyz14);
     xyz15(d,:)=CCT2xyz(8000,duv) ;
     uv15=xyz2uvY(xyz15);
     xyz16(d,:)=CCT2xyz(10000,duv) ;
     uv16=xyz2uvY(xyz16);
end

plot(uv1(:,1),uv1(:,2),'Color','k','LineWidth',2,'color',[0.5 0.5 0.5]);
% plot(uv2(:,1),uv2(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv3(:,1),uv3(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv4(:,1),uv4(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv5(:,1),uv5(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv6(:,1),uv6(:,2),'Color','k','color',[0.5 0.5 0.5]);
% plot(uv7(:,1),uv7(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv8(:,1),uv8(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv9(:,1),uv9(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv10(:,1),uv10(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv11(:,1),uv11(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv12(:,1),uv12(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv13(:,1),uv13(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv14(:,1),uv14(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv15(:,1),uv15(:,2),'Color','k','color',[0.5 0.5 0.5]);
plot(uv16(:,1),uv16(:,2),'Color','k','color',[0.5 0.5 0.5]);

xlabel('up','FontName','Times New Roman','FontSize',15);
ylabel('vp','FontName','Times New Roman','FontSize',15);
% title('visual vs weighted for naturalness','FontName','Times New Roman','FontSize',15);

text(uv1(1,1),uv1(1,2),'BBL','FontSize',10,'color',[0.5 0.5 0.5]);
% text(uv2(1,1),uv2(1,2),'-0.015','FontSize',5,'color',[0.5 0.5 0.5]);
text(uv3(1,1),uv3(1,2),'-0.01','FontSize',10,'color',[0.5 0.5 0.5]);
text(uv4(1,1),uv4(1,2),'-0.005','FontSize',10,'color',[0.5 0.5 0.5]);
text(uv5(1,1),uv5(1,2),'0.005','FontSize',10,'color',[0.5 0.5 0.5]);
text(uv6(1,1),uv6(1,2),'0.01','FontSize',10,'color',[0.5 0.5 0.5]);
% text(uv7(1,1),uv7(1,2),'0.015','FontSize',5,'color',[0.5 0.5 0.5]);
text(uv8(1,1),uv8(1,2),'3000K','FontSize',10,'color',[0.5 0.5 0.5]);
text(uv9(1,1),uv9(1,2),'3500K','FontSize',10,'color',[0.5 0.5 0.5]);
text(uv10(1,1),uv10(1,2),'4000K','FontSize',10,'color',[0.5 0.5 0.5]);
text(uv11(1,1),uv11(1,2),'4500K','FontSize',10,'color',[0.5 0.5 0.5]);
text(uv12(1,1),uv12(1,2),'5000k','FontSize',10,'color',[0.5 0.5 0.5]);
text(uv13(1,1),uv13(1,2),'6000K','FontSize',10,'color',[0.5 0.5 0.5]);
text(uv14(1,1),uv14(1,2),'7000K','FontSize',10,'color',[0.5 0.5 0.5]);
text(uv15(1,1),uv15(1,2),'8000K','FontSize',10,'color',[0.5 0.5 0.5]);
text(uv16(1,1),uv16(1,2),'10000K','FontSize',10,'color',[0.5 0.5 0.5]);
hold off
print(1,'-dbmp',strcat('F:\coding\Haisi\data\','dark'));


