clear all
load('Dfit_HS_1109.mat');

% for i=1:5
%     for D=0:1:1000
% xyz=lab2xyz(lab(i+15,:),'user',[433.8 475.0 566.4]);
% f2=ciecat02_d(xyz,f1(i,:)./f1(i,2).*316.1,f1(4,:),'CAT16',100,100,D./1000); 
% b1(i,:)=xyz2lab(f2,'user',[433.8 475.0 566.4]);
% de(D+1,i)=cielabde(b1(i,:),lab(19,:))';
%     end
% end
% for i=1:3
% [c(i),r(1)]=find(de(:,i)==min(de(:,i)));
% d1(i)=de(c(i),i);
% end
% c(4)=find(de(:,5)==min(de(:,5)));
% d1(4)=de(c(4),5);
% c=(c+1)./1000;
cct=[3000,4000,5000,6500,8000];
for i=1:5
    for D=0:1:1000
dd=D./1000.*0.723.*(1-1116./cct(i));
xyz=lab2xyz(lab(i+15,:),'user',[433.8 475.0 566.4]);
f2=ciecat02_d(xyz,f1(i,:)./f1(i,2).*316.1,f1(5,:),'CAT16',100,100,dd); 
b1(i,:)=xyz2lab(f2,'user',[433.8 475.0 566.4]);
de(D+1,i)=cielabde(b1(i,:),lab(20,:))';
    end
end
% %===============D80=====================
% for i=1:4
% [c(i),r(1)]=find(de(:,i)==min(de(:,i)));
% d1(i)=de(c(i),i);
% end
% c=(c+1)./1000;
% %===============D65=====================
for i=1:3
[c(i),r(1)]=find(de(:,i)==min(de(:,i)));
d1(i)=de(c(i),i);
end
c(4)=find(de(:,5)==min(de(:,5)));
d1(4)=de(c(4),5);
c=(c+1)./1000;