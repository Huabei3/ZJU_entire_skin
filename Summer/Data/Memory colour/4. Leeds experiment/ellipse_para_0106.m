% load('center0105.mat');
a=par;
for i=1:24
A=a(i,2);
B=a(i,4);
C=a(i,3);
X=0;
Y=0;
F=A.*X.^2+B.*X.*Y+C.*Y^2-a(i,7).^2;
A=A./F;
B=B./F;
C=C./F;
th=atan(B./(A-C))./2./pi.*180;
e=sqrt(abs((A+C+sqrt((A-C).^2+B.^2))./(A+C-sqrt((A-C).^2+B.^2))));
aa=sqrt(abs(2*(A.*X.^2+C.*Y.^2+B.*X.*Y-1)./(A+C-sqrt((A-C).^2+B.^2))));
if e<1
aa=aa./e;
e=1./e;
end
p(i,:)=[aa,e,th];
end
p=real(p);




% for i=1:144
% A=a(i,2);
% B=a(i,4);
% C=a(i,3);
% X=a(i,6);
% Y=a(i,7);
% F=A.*X.^2+B.*X.*Y+C.*Y^2-a(i,8).^2;
% A=A./F;
% B=B./F;
% C=C./F;
% th=atan(B./(A-C))./2./pi.*180;
% e=sqrt(abs((A+C+sqrt((A-C).^2+B.^2))./(A+C-sqrt((A-C).^2+B.^2))));
% aa=sqrt(abs(2*(A.*X.^2+C.*Y.^2+B.*X.*Y-1)./(A+C-sqrt((A-C).^2+B.^2))));
% if e<1
% aa=aa./e;
% e=1./e;
% end
% L=a(i,7);
% Cab=a(i,6);
% if b(i,2)>0
%     if b(i,3)>0
% hab=a(i,5);
% as=a(i,6)./sqrt(abs(1+tan(a(i,5)./180.*pi).^2));
% bs=sqrt(a(i,6).^2-as.^2);
%     else
% hab=a(i,5)+360;  
% as=a(i,6)./sqrt(abs(1+tan(a(i,5)./180.*pi).^2));
% bs=-sqrt(a(i,6).^2-as.^2);
%     end
% else
% hab=a(i,5)+180;
% end
% p(i,:)=[L,as,bs,Cab,hab,aa,e,th];
% as=-a(i,6)./sqrt(abs(1+tan(a(i,5)./180.*pi).^2));
% if b(i,3)>0
% bs=sqrt(a(i,6).^2-as.^2);
% else
% bs=-sqrt(a(i,6).^2-as.^2); 
% end
% end
% p=real(p);