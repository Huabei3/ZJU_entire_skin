illu=['dark_';'3000_';'4000_';'5000_';'6000_';'7000_'];
qus=['p_';'n_'];
img=['1';'2';'3';'4'];
 load('accept weight.mat');
load('6CCT4Duv_table.mat');
load('acc_80_w_uv.mat')
load('acc_80_v_uv.mat')
for iqus=1:2
    for iillu=1
       for iimag=1:4;
ii=(iqus-1)*6+iillu;
qp=[illu(iillu,:),img(iimag,:)];

for i=1:24
   XYZ(i,:)=CCT2xyz(a(i,1),a(i,2)) ;
    uvY=xyz2uvY(XYZ);
end
for c=1:60
    cct=2500+200*c;
    xyz1(c,:)=CCT2xyz(cct,0) ;
    uv1=xyz2uvY(xyz1);
    xyz2(c,:)=CCT2xyz(cct,-0.02) ;
    uv2=xyz2uvY(xyz2);
    xyz3(c,:)=CCT2xyz(cct,-0.01) ;
    uv3=xyz2uvY(xyz3);
    xyz4(c,:)=CCT2xyz(cct,0.01) ;
    uv4=xyz2uvY(xyz4);
end
for d=1:50
    duv=-0.025+0.001*d;
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

bp=acc((iimag*24-23):(iimag*24),ii);
fig = figure;
set(fig, 'Position', [200 200 840 560]);
for j=1:24
 if bp(j)>0.9
    bp(j)=bp(j)*5.5;
    plot(uvY(j,1),uvY(j,2),'-o','LineWidth',2,'color',[1 0 0],'MarkerSize',20); 
    else
    if bp(j)>0.8
    bp(j)=bp(j)*5.5;
    plot(uvY(j,1),uvY(j,2),'-o','LineWidth',2,'color',[1 0.5 0],'MarkerSize',20);
 else if bp(j)>0.7
    bp(j)=bp(j)*5.5;
    plot(uvY(j,1),uvY(j,2),'-o','LineWidth',2,'color',[0.9 0.9 0],'MarkerSize',20);
 else if bp(j)>0.6
    bp(j)=bp(j)*5.5;
    plot(uvY(j,1),uvY(j,2),'-o','LineWidth',2,'color',[0.5 1 0],'MarkerSize',20);
 else
        bp(j)=0.0001;
     end
     end
     end
 end
hold on
end

% for j=1:24
%  if bp(j)>0.9
%     bp(j)=bp(j)*5.5;
%     plot(uvY(j,1),uvY(j,2),'-o','LineWidth',3,'color',[1 0 0],'MarkerSize',(bp(j).^2)); 
%     else
%     if bp(j)>0.8
%     bp(j)=bp(j)*5.5;
%     plot(uvY(j,1),uvY(j,2),'-o','LineWidth',3,'color',[1 0.5 0],'MarkerSize',(bp(j).^2));
%  else if bp(j)>0.7
%     bp(j)=bp(j)*5.5;
%     plot(uvY(j,1),uvY(j,2),'-o','LineWidth',3,'color',[0.9 0.9 0],'MarkerSize',(bp(j).^2));
%  else if bp(j)>0.6
%     bp(j)=bp(j)*5.5;
%     plot(uvY(j,1),uvY(j,2),'-o','LineWidth',3,'color',[0.5 1 0],'MarkerSize',(bp(j).^2));
%  else
%         bp(j)=0.0001;
%      end
%      end
%      end
%  end
% hold on
% end
iii=12*iimag-12+iillu;

plot(acc_w(iii+6,1),acc_w(iii+6,2),'b-x','LineWidth',4,'MarkerFaceColor','g','MarkerSize',12);
plot(acc_w(iii,1),acc_w(iii,2),'b-p','LineWidth',2,'MarkerFaceColor','b','MarkerSize',12);
plot([acc_w(iii,1);acc_w(iii+6,1)],[acc_w(iii,2);acc_w(iii+6,2)],'b','LineWidth',2);
% annotation('arrow',[b(iillu,1) b(iillu,2)],[acc_w(iii,1) acc_w(iii,2)]);
% plot([acc_w(iii,1);b(iillu,1)],[acc_w(iii,2);b(iillu,2)],'m','LineWidth',3);
plot(uv1(:,1),uv1(:,2),'Color','k','LineWidth',2);
plot(uv2(:,1),uv2(:,2),'Color','k');
plot(uv3(:,1),uv3(:,2),'Color','k');
plot(uv4(:,1),uv4(:,2),'Color','k');
plot(uv5(:,1),uv5(:,2),'Color','k');
plot(uv6(:,1),uv6(:,2),'Color','k');
plot(uv7(:,1),uv7(:,2),'Color','k');
plot(uv8(:,1),uv8(:,2),'Color','k');
plot(uv9(:,1),uv9(:,2),'Color','k');
plot(uv10(:,1),uv10(:,2),'Color','k');
set(gca,'FontSize',20,'Linewidth',2);
axis([0.15 0.3 0.4 0.56]);
xlabel('u''','FontName','Times New Roman','FontSize',28);
ylabel('v''','FontName','Times New Roman','FontSize',28);
title(qp,'FontSize',22);
text(uv1(1,1),uv1(1,2),'BBL','FontSize',20,'color',[0 0 0]);
text(uv2(1,1),uv2(1,2),'-0.02','FontSize',20,'color',[0 0 0]);
text(uv3(1,1),uv3(1,2),'-0.01','FontSize',20,'color',[0 0 0]);
text(uv4(1,1),uv4(1,2),'0.01','FontSize',20,'color',[0 0 0]);
text(uv5(1,1),uv5(1,2),'3000K','FontSize',20,'color',[0 0 0]);
text(uv6(1,1),uv6(1,2),'4000K','FontSize',20,'color',[0 0 0]);
text(uv7(1,1),uv7(1,2),'5000K','FontSize',20,'color',[0 0 0]);
text(uv8(1,1),uv8(1,2),'6500K','FontSize',20,'color',[0 0 0]);
text(uv9(1,1),uv9(1,2),'8000K','FontSize',20,'color',[0 0 0]);
text(uv10(1,1),uv10(1,2),'10000K','FontSize',20,'color',[0 0 0]);
box on
print(1, '-dbmp', strcat('./2/', qp));
close all;
       end
    end
end