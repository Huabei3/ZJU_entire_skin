clear all
load('data1221.mat')
for i=1:32
b1(i,:)=sum(reshape(c1(:,i),48,34));
b2(i,:)=sum(reshape(c2(:,i),48,34));
b3(i,:)=sum(reshape(c3(:,i),48,34));
for j=1:34
    if b1(i,j)>40|b1(i,j)<8
       b1(i,j)=1;
    else b1(i,j)=0;
    end
    if b2(i,j)>40|b2(i,j)<8
       b2(i,j)=1;
    else b2(i,j)=0;
    end
    if b3(i,j)>40|b3(i,j)<8
       b3(i,j)=1;
    else b3(i,j)=0;
    end
end
end
a(1,:)=sum(b1');a(2,:)=sum(b2');a(3,:)=sum(b3');