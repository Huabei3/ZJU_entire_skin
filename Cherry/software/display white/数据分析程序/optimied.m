 RGB=imread('≤‚ ‘0.54.bmp');
 XYZ=rgb2xyz(RGB);
 XYZ1=reshape(XYZ(1,1,:),1,3);
 load('XYZ1w.mat');
 load('uvw.mat');
 load('uvYw.mat');
 B=0:100;
 B=B./100;
 for n=1:101
     uvY=uvw(n,:);
     cform = makecform('upvpl2xyz');
     XYZ2w = applycform(uvY,cform);
     uvY1=uvYw(n,:);
     cform = makecform('upvpl2xyz');
     XYZ0 = applycform(uvY1,cform);
     Lab1=xyz2lab(XYZ0);
     L1=Lab1(1);
     a1=Lab1(2);
     b1=Lab1(3);
     for i=1:10001
         D=B(i);
         [XYZ2,XYZw2] = ciecat02_d (XYZ1,XYZ1w,XYZ2w,'CAT02',150,150,D);
         Lab2=xyz2lab(XYZw2);
         L2=Lab2(1);
         a2=Lab2(2);
         b2=Lab2(3);
         E=sqrt((a1-a2)^2+(b1-b2)^2);
         Eab(i,1)=E;
     end
     c=['E',num2str(n)];
     eval([c,'=Eab']);
 end
 
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
