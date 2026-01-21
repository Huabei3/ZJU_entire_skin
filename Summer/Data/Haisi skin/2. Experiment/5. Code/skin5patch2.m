% xyz0=zeros(7,3);
% for i=1:6
% xyz0=xyz0+a((i*7-6):i*7,:);
% end
% xyz0=xyz0./6;
xyz0=a(36:42,:);
lab0=xyz2lab(xyz0,'user',xyzw);
for i=1:5
    lab=xyz2lab(a((i*7-6):i*7,:),'user',xyzw);
    de(:,i)=cielabde(lab,lab0);
end
lab1=xyz2lab(a(1:7,:),'user',xyzw);
lab2=xyz2lab(a(29:35,:),'user',xyzw);
de1=cielabde(lab1,lab2);