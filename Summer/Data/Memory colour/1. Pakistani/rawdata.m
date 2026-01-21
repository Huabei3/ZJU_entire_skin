% N=reshape(N,1632,10);P=reshape(P,1632,10);C=reshape(C,1632,10);
load('rawdata.mat');
% N=reshape(mean(N'),48,34);P=reshape(mean(P'),48,34);C=reshape(mean(C'),48,34);
for i=1:10
b1(i,:)=sum(reshape(C(:,i),48,34));
b2(i,:)=sum(reshape(N(:,i),48,34));
b3(i,:)=sum(reshape(P(:,i),48,34));
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