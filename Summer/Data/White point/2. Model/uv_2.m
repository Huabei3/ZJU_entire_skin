clear all;
q='10_p_2';
load(strcat('D:\Owncloud\PhD\Graduation Project\Experiment\Zscore\',q))
load('light.mat')
for i=1:29
   XYZ(i,:)=CCT2xyz(b(i,1),b(i,2)) ;
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


for i=1:29
      if i<=24 
        plot(uvY(i,1),uvY(i,2),'b-o','LineWidth',2,'MarkerSize',11);       
hold on
      else
        plot(uvY(i,1),uvY(i,2),'r-o','LineWidth',2,'MarkerSize',18);       
hold on  
      end 
end

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
xlabel('Up'),ylabel('Vp');
title('light');
text(uv1(1,1),uv1(1,2),'0');
text(uv2(1,1),uv2(1,2),'-0.02');
text(uv3(1,1),uv3(1,2),'-0.01');
text(uv4(1,1),uv4(1,2),'0.01');
text(uv5(1,1),uv5(1,2),'3000K');
text(uv6(1,1),uv6(1,2),'4000K');
text(uv7(1,1),uv7(1,2),'5000K');
text(uv8(1,1),uv8(1,2),'6500K');
text(uv9(1,1),uv9(1,2),'8000K');
text(uv10(1,1),uv10(1,2),'10000K');
hold off
%saveas(gcf,strcat('C:\Users\Administrato\Desktop\plot1\',q,'.jpg')),
print(1,'-dbmp',strcat('C:\Users\hp\Desktop\','light'));
close all;
%close all;
%path_in='C:\Users\Administrato\Desktop\plot\';
%print('-dpng','1');
%save(gcf,strcat(q,'.jpg'));
% imwrite(1,[path_in,q,'.bmp'],'BMP');

