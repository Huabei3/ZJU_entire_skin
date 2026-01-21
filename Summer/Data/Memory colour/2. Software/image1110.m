clear all
load('target1110.mat');
 for j=1:24
y1(:,1)=y(:,1).*n(j,1);
y1(:,2)=y(:,2).*n(j,2);
y1(:,3)=y(:,3).*n(j,3);
for i=1:48
    tlab(i,j*3-2:j*3)=x(j,1:3)+y1(i,1:3);
end
 end
a(1,:)=min(tlab);a(2,:)=max(tlab);
ma=reshape(a(2,:)',3,24)';ma(:,4)=sqrt(ma(:,2).^2+ma(:,3).^2);
mi=reshape(a(1,:)',3,24)';mi(:,4)=sqrt(mi(:,2).^2+mi(:,3).^2);
a1=[mi(:,1),ma(:,1),mi(:,2),ma(:,2),mi(:,3),ma(:,3),mi(:,4),ma(:,4)];