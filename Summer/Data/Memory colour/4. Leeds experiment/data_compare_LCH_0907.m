clear all;
load('data_compare_0905.mat');
% a1=b1;a2=b2;a3=b3;a4=b4;a5=b5;
de(:,1)=cielabde(a1,a2);de(:,2)=cielabde(a1,a3);de(:,3)=cielabde(a1,a4);de(:,4)=cielabde(a1,a5);
de(:,5)=cielabde(a2,a3);de(:,6)=cielabde(a2,a4);de(:,7)=cielabde(a2,a5);
de(:,8)=cielabde(a3,a4);de(:,9)=cielabde(a3,a5);
de(:,10)=cielabde(a4,a5);
a1(:,4)=sqrt(a1(:,2).^2+a1(:,3).^2);
a2(:,4)=sqrt(a2(:,2).^2+a2(:,3).^2);
a3(:,4)=sqrt(a3(:,2).^2+a3(:,3).^2);
a4(:,4)=sqrt(a4(:,2).^2+a4(:,3).^2);
a5(:,4)=sqrt(a5(:,2).^2+a5(:,3).^2);
a1(:,5)=atan(a1(:,3)./a1(:,2))./pi.*180;
a2(:,5)=atan(a2(:,3)./a2(:,2))./pi.*180;
a3(:,5)=atan(a3(:,3)./a3(:,2))./pi.*180;
a4(:,5)=atan(a4(:,3)./a4(:,2))./pi.*180;
a5(:,5)=atan(a5(:,3)./a5(:,2))./pi.*180;
aa1=(a1-a2);aa2=(a1-a3);aa3=(a1-a4);aa4=(a1-a5);
aa5=(a2-a3);aa6=(a2-a4);aa7=(a2-a5);
aa8=(a3-a4);aa9=(a3-a5);
aa10=(a4-a5);
aa=(aa1+aa2+aa3+aa4+aa5+aa6+aa7+aa8+aa9+aa10)./10;
L=[aa1(:,1),aa2(:,1),aa3(:,1),aa4(:,1),aa5(:,1),aa6(:,1),aa7(:,1),aa8(:,1),aa9(:,1),aa10(:,1),];
C=[aa1(:,4),aa2(:,4),aa3(:,4),aa4(:,4),aa5(:,4),aa6(:,4),aa7(:,4),aa8(:,4),aa9(:,4),aa10(:,4),];
h=[aa1(:,5),aa2(:,5),aa3(:,5),aa4(:,5),aa5(:,5),aa6(:,5),aa7(:,5),aa8(:,5),aa9(:,5),aa10(:,5),];
H=sqrt(de.^2-L.^2-C.^2);
 for i=1:24 
     for j=1:10 
         if h(i,j)<0 H(i,j)=-H(i,j); 
         end
     end
 end
L(25,:)=mean(L);L(26,:)=mean(abs((L(1:24,:))));L(:,11)=mean(L')';L(:,12)=mean(abs((L(:,1:10)))')';
C(25,:)=mean(C);C(26,:)=mean(abs((C(1:24,:))));C(:,11)=mean(C')';C(:,12)=mean(abs((C(:,1:10)))')';
H(25,:)=mean(H);H(26,:)=mean(abs((H(1:24,:))));H(:,11)=mean(H')';H(:,12)=mean(abs((H(:,1:10)))')';
de(25,:)=mean(de);de(:,11)=mean(de')';de(:,12)=mean(abs((de(:,1:10)))')';
% aa1=abs(a1-a2);aa2=abs(a1-a3);aa3=abs(a1-a4);aa4=abs(a1-a5);
% aa5=abs(a2-a3);aa6=abs(a2-a4);aa7=abs(a2-a5);
% aa8=abs(a3-a4);aa9=abs(a3-a5);
% aa10=abs(a4-a5);
% aa=(aa1+aa2+aa3+aa4+aa5+aa6+aa7+aa8+aa9+aa10)./10;