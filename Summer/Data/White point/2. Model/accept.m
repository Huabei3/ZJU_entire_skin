
clear all
load('accept weight.mat');
 load('6CCT4Duv_table.mat')
 p=0;
for i=1:24
    XYZ(i,:)=CCT2xyz(a(i,:));   
for j=1:12
    if acc(i+p,j)>0.8
bcc(i,j)=acc(i+p,j);
    else
        bcc(i,j)=0;
    end
end
end
for k=1:12
XYZn(k,1)=sum(XYZ(:,1).*bcc(:,k))/sum(bcc(:,k));
XYZn(k,2)=sum(XYZ(:,2).*bcc(:,k))/sum(bcc(:,k));
XYZn(k,3)=sum(XYZ(:,3).*bcc(:,k))/sum(bcc(:,k));
[d(k,1),d(k,2)]=CCTa(XYZn(k,:));
end
d=d';