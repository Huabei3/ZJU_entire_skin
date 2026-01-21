Ddata=0:0.01:1;
for i=1:5
XYZ=center(i,:);
XYZw=light(i,:);
Yb=99/180;
La=Yb*500/pi;
surround='dim';
JAB = XYZ2CAM16UCS(XYZ,XYZw,La,Yb,surround);
Jab(i,:)=JAB;
ap=JAB(:,2);
bp=JAB(:,3);
E=sqrt(ap.^2+bp.^2);
Eab(i,1)=E;
end

XYZ=Center(11,:);
XYZw=xyz(11,:);
Yb=99/180;
La=Yb*600/pi;
surround='dim';
for i=1:5
XYZ=center(i,:);
XYZw=light(i,:);
Yb=99/180;
La=Yb*500/pi;
surround='dim';
D_pre=Ddata(i);
JAB = XYZ2CAM16UCS(XYZ,XYZw,La,Yb,surround,D_pre);
ap=JAB(:,2);
bp=JAB(:,3);
E=sqrt(ap.^2+bp.^2);
Eab(i,1)=E;
Jab(i,:)=JAB;
end

plot(Jab(1,2),Jab(1,3),'r-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','r'); 
 hold on;
 plot(Jab(2,2),Jab(2,3),'y-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','y');  
 plot(Jab(3,2),Jab(3,3),'g-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','g'); 
 plot(Jab(4,2),Jab(4,3),'b-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','b'); 
 plot(Jab(5,2),Jab(5,3),'k-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','k');
 axis equal
 xlim([-20,0]);
 ylim([-55,5]);
 xlabel('a¡¯'),ylabel('b¡¯');
title('500 lx');


 plot(Jab(6,2),Jab(6,3),'r-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','r'); 
 hold on;
 plot(Jab(7,2),Jab(7,3),'y-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','y');  
 plot(Jab(8,2),Jab(8,3),'g-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','g'); 
 plot(Jab(9,2),Jab(9,3),'b-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','b'); 
 plot(Jab(10,2),Jab(10,3),'k-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','k'); 
xlim([-20,0]);
 ylim([-55,5]);
 xlabel('a¡¯'),ylabel('b¡¯');
title('1000 lx');

for i=6:10
    JAB=Jab(i,:);
XYZw=lightXYZ(i,:)./1000;
Yb=99/180;
La=Yb*1000/pi;
surround='dim';
XYZ = CAM16UCS2XYZ(JAB,XYZw,La,Yb,surround);
xyz(i,:)=XYZ;
end
cform = makecform('xyz2upvpl');
    uvY = applycform(xyz,cform);
plot(uvY(1,1),uvY(1,2),'r-o','LineWidth',1,'MarkerSize',5); 
hold on
plot(uvY(2,1),uvY(2,2),'r-^','LineWidth',1,'MarkerSize',5); 
plot(uvY(3,1),uvY(3,2),'r-v','LineWidth',1,'MarkerSize',5); 
plot(uvY(4,1),uvY(4,2),'r-<','LineWidth',1,'MarkerSize',5); 
plot(uvY(5,1),uvY(5,2),'r->','LineWidth',1,'MarkerSize',5); 
plot(uvY(6,1),uvY(6,2),'g-o','LineWidth',1,'MarkerSize',5); 
plot(uvY(7,1),uvY(7,2),'g-^','LineWidth',1,'MarkerSize',5); 
plot(uvY(8,1),uvY(8,2),'g-v','LineWidth',1,'MarkerSize',5); 
plot(uvY(9,1),uvY(9,2),'g-<','LineWidth',1,'MarkerSize',5); 
plot(uvY(10,1),uvY(10,2),'g->','LineWidth',1,'MarkerSize',5); 

plot(Jab(1,2),Jab(1,3),'r-o','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','r'); 
 hold on;
 plot(Jab(2,2),Jab(2,3),'y-o','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','y');  
 plot(Jab(3,2),Jab(3,3),'g-o','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','g'); 
 plot(Jab(4,2),Jab(4,3),'b-o','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','b'); 
 plot(Jab(5,2),Jab(5,3),'k-o','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','k');
 plot(Jab(11,2),Jab(11,3),'r-^','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','r'); 
 plot(Jab(12,2),Jab(12,3),'y-^','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','y');  
 plot(Jab(13,2),Jab(13,3),'g-^','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','g'); 
 plot(Jab(14,2),Jab(14,3),'b-^','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','b'); 
 plot(Jab(15,2),Jab(15,3),'k-^','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','k');
 axis equal
 xlim([-20,0]);
 ylim([-50,10]);
 xlabel('a¡¯'),ylabel('b¡¯');
title('500 lx');

 plot(Jab(6,2),Jab(6,3),'r-o','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','r'); 
 hold on;
 plot(Jab(7,2),Jab(7,3),'y-o','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','y');  
 plot(Jab(8,2),Jab(8,3),'g-o','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','g'); 
 plot(Jab(9,2),Jab(9,3),'b-o','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','b'); 
 plot(Jab(10,2),Jab(10,3),'k-o','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','k'); 
 plot(Jab(16,2),Jab(16,3),'r-^','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','r'); 
 plot(Jab(17,2),Jab(17,3),'y-^','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','y');  
 plot(Jab(18,2),Jab(18,3),'g-^','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','g'); 
 plot(Jab(19,2),Jab(19,3),'b-^','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','b'); 
 plot(Jab(20,2),Jab(20,3),'k-^','LineWidth',1,'MarkerSize',5,'MarkerFaceColor','k'); 
 axis equal
xlim([-20,0]);
 ylim([-55,5]);
 xlabel('a¡¯'),ylabel('b¡¯');
title('1000 lx');


 plot(Jab(6,2),Jab(6,3),'r-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','r'); 
 hold on;
 plot(Jab(7,2),Jab(7,3),'y-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','y');  
 plot(Jab(8,2),Jab(8,3),'g-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','g'); 
 plot(Jab(9,2),Jab(9,3),'b-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','b'); 
 plot(Jab(10,2),Jab(10,3),'k-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','k'); 
xlim([-20,0]);
 ylim([-55,5]);
 xlabel('a¡¯'),ylabel('b¡¯');
title('1000 lx');

CCT=CCT_D(:,1);
Duv=CCT_D(:,2);
D=0.723.*(1-1116./CCT+8.46.*Duv-49266.*Duv./CCT);

u=uvLD(:,1);
v=uvLD(:,2);
D=28.*u.^2-30.19.*v.^2-24.11.*u.*v-1.78.*u+32.58.*v-6.52;

for i=1:5
JAB=Jab(i,:);
XYZ1=center(i,:);
XYZw=light(i,:);
Yb=99/180;
La=Yb*500/pi;
surround='dim';
D_pre=Ddata(i);
XYZ2 = CAM16UCS2XYZ(JAB,XYZw,La,Yb,surround,D_pre);
lab1 = xyz2lab(XYZ1);
lab2 = xyz2lab(XYZ2);
de00=CIEDE2000(lab1,lab2);
XYZ(i,:)=XYZ2;
DE(i,1)=de00;
end
for i=1:5
JAB=Jab(i,:);
XYZ1=center(i,:);
XYZw=light(i,:);
Yb=99/180;
La=Yb*500/pi;
surround='dim';
XYZ2 = CAM16UCS2XYZ(JAB,XYZw,La,Yb,surround);
lab1 = xyz2lab(XYZ1);
lab2 = xyz2lab(XYZ2);
de00=CIEDE2000(lab1,lab2);
XYZ(i,:)=XYZ2;
DE(i,1)=de00;
end

plot(Jab(1,2),Jab(1,3),'r-o','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','r'); 
 hold on;
 plot(Jab(2,2),Jab(2,3),'o','color',[255 192 0]/255,'LineWidth',1,'MarkerSize',8,'MarkerFaceColor',[255 192 0]/255);  
 plot(Jab(3,2),Jab(3,3),'o','color',[0 176 80]/255,'LineWidth',1,'MarkerSize',8,'MarkerFaceColor',[0 176 80]/255); 
 plot(Jab(4,2),Jab(4,3),'o','color',[0 112 192]/255,'LineWidth',1,'MarkerSize',8,'MarkerFaceColor',[0 112 192]/255); 
 plot(Jab(5,2),Jab(5,3),'o','color',[127 127 127]/255,'LineWidth',1,'MarkerSize',8,'MarkerFaceColor',[127 127 127]/255);
  plot(Jab(6,2),Jab(6,3),'r-^','LineWidth',1,'MarkerSize',8,'MarkerFaceColor','r'); 
 plot(Jab(7,2),Jab(7,3),'^','color',[255 192 0]/255,'LineWidth',1,'MarkerSize',8,'MarkerFaceColor',[255 192 0]/255);  
 plot(Jab(8,2),Jab(8,3),'^','color',[0 176 80]/255,'LineWidth',1,'MarkerSize',8,'MarkerFaceColor',[0 176 80]/255); 
 plot(Jab(9,2),Jab(9,3),'^','color',[0 112 192]/255,'LineWidth',1,'MarkerSize',8,'MarkerFaceColor',[0 112 192]/255); 
 plot(Jab(10,2),Jab(10,3),'^','color',[127 127 127]/255,'LineWidth',1,'MarkerSize',8,'MarkerFaceColor',[127 127 127]/255);
 axis equal
 xlim([-20,0]);
 ylim([-50,10]);
 xlabel('a¡¯'),ylabel('b¡¯');
 title('1000 lx');
 set(gca,'FontSize',13);
 
 plot(Jab(1,2),Jab(1,3),'r-o','LineWidth',1.5,'MarkerSize',8); 
 hold on;
 plot(Jab(2,2),Jab(2,3),'o','color',[255 192 0]/255,'LineWidth',1.5,'MarkerSize',8);  
 plot(Jab(3,2),Jab(3,3),'o','color',[0 176 80]/255,'LineWidth',1.5,'MarkerSize',8); 
 plot(Jab(4,2),Jab(4,3),'o','color',[0 112 192]/255,'LineWidth',1.5,'MarkerSize',8); 
 plot(Jab(5,2),Jab(5,3),'o','color',[127 127 127]/255,'LineWidth',1.5,'MarkerSize',8);
  plot(Jab(6,2),Jab(6,3),'r-^','LineWidth',1.5,'MarkerSize',8); 
 plot(Jab(7,2),Jab(7,3),'^','color',[255 192 0]/255,'LineWidth',1.5,'MarkerSize',8);  
 plot(Jab(8,2),Jab(8,3),'^','color',[0 176 80]/255,'LineWidth',1.5,'MarkerSize',8); 
 plot(Jab(9,2),Jab(9,3),'^','color',[0 112 192]/255,'LineWidth',1.5,'MarkerSize',8); 
 plot(Jab(10,2),Jab(10,3),'^','color',[127 127 127]/255,'LineWidth',1.5,'MarkerSize',8);
 axis equal
 xlim([-20,0]);
 ylim([-50,10]);
 xlabel('a¡¯'),ylabel('b¡¯');
 title('1000 lx');
 set(gca,'FontSize',13);