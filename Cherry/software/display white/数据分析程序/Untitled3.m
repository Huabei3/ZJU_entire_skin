RGB=imread('≤‚ ‘0.54.bmp');
 XYZ=rgb2xyz(RGB);
 XYZ1=reshape(XYZ(1,1,:),1,3);
 load('XYZ1w.mat');
 load('uvw.mat');
 
 load('CCTw.mat');
 B=0:100;
 B=B./100;
 for n=1:10
     uvY=uvw(n,:);
     cform = makecform('upvpl2xyz');
     XYZ2w = applycform(uvY,cform);
     CCT1=CCTw(n,:);
     for i=1:101
         D=B(i);
         [XYZ2,XYZw2] = ciecat02_d (XYZ1,XYZ1w,XYZ2w,'CAT02',150,150,D);
         CCT2=CCTa(XYZw2);
         E=sqrt((CCT1-CCT2)^2);
         Eab(i,1)=E;
         
     end
     c=['E',num2str(n)];
     eval([c,'=Eab']);
 end
 XYZ2w=[96.7,101.1,103.1];

 uvYw=uvw(4,:);
 cform = makecform('upvpl2xyz');
 XYZ2w = applycform(uvYw,cform);
 for D=1:100
     A=D./100;
  [XYZ2,XYZw2] = ciecat02_d (XYZ1,XYZ1w,XYZ2w,'CAT02',150,150,A);
 CCT=CCTa(XYZw2);
         E=sqrt((a1-a2)^2+(b1-b2)^2);
         Eab0(D,1)=E;
 end
[XYZ2,XYZw2] = ciecat02_d (XYZ1,XYZ1w,XYZ2w,'CAT02',150,150,0);
CCT=CCTa(XYZw2);