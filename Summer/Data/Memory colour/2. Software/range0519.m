clear all
load('targat6.mat');

for j=1:29
y1(:,1)=y(:,1).*n(j,1);
y1(:,2)=y(:,2).*n(j,2);
y1(:,3)=y(:,3).*n(j,3);
for i=1:48
tlab(i,:)=x(j,1:3)+y1(i,1:3);
end
tlab(:,4)=sqrt(tlab(:,2).^2+tlab(:,3).^2);
tlab(:,5)=atan(tlab(:,2)./tlab(:,3))./3.1416.*180;
ra(j,1)=min(tlab(:,4));ra(j,2)=max(tlab(:,4));
ra(j,3)=ra(j,1)-sqrt(x(j,2).^2+x(j,3).^2);
ra(j,4)=ra(j,2)-sqrt(x(j,2).^2+x(j,3).^2);
ra(j,5)=min(tlab(:,5));ra(j,6)=max(tlab(:,5));
ra(j,7)=ra(j,5)-atan(x(j,2)./x(j,3))./3.1416.*180;
ra(j,8)=ra(j,6)-atan(x(j,2)./x(j,3))./3.1416.*180;
clear tlab
end