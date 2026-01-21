load('choicedata.mat');
load('skin16lab.mat');
load('skin16lab1.mat')
for i=1:8
    for j=1:9
        d1(j,3*i-2:3*i)=sum(b1(25*i-24:25*i,j).*b(:,3*i-2:3*i))./sum(b1(25*i-24:25*i,j));
    end
    d2(i*9-8:i*9,1:3)=d1(:,i*3-2:i*3);
end
e2=mean(d1);
e3=reshape(e2',3,8)';
e3(:,4)=sqrt(e3(:,2).^2+e3(:,3).^2);
e3(:,5)=atan(e3(:,3)./e3(:,2))./3.1416.*180;