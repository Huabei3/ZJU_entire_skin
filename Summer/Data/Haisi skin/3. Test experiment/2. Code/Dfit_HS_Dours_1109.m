% clear all;
% load('Dfit_HS_Dours_1109.mat');
for a1=0.28:0.0001:0.30
for b1=2000:1:2100
for i=1:4
    a=round(a1.*10000-2799);
    b=round(b1-1999);
dd(a,b,:)=a1.*(1-b1./cct);
c=squeeze(dd(a,b,:));
De(a,b)=mean(abs(D'-c));
end
end
end
m=min(De);
n=min(m);
[ind1,ind2]=find(De==n);
% [m,index1]=min(De);
% [n,index2]=min(m);
ao=(ind1+2799)./10000;
bo=ind2+1999;