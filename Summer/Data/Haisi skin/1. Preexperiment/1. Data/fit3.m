load('num1.mat')
J2=Jab(:,1);
a2=Jab(:,2);
b2=Jab(:,3);
w=1-num(:,3)./20;  %percentage
jm(1)=max(J2);jm(2)=min(J2);jm(3)=mean(J2);
am(1)=max(a2);am(2)=min(a2);am(3)=mean(a2);
bm(1)=max(b2);bm(2)=min(b2);bm(3)=mean(b2);


 p0 = [1 1 1 1 1 1 1 1 1 1]; 
p0(1)=1./(jm(1)-jm(2)).^2;
p0(2)=1./(am(1)-am(2)).^2;
p0(3)=1./(bm(1)-bm(2)).^2;
p0(4)=1;p0(5)=1;p0(6)=1;
p0(7)=jm(3);
p0(8)=am(3);
p0(9)=bm(3);

X=[J2,a2,b2];
[p,r,j] = nlinfit(X,w,@summer1,p0);
a=p
y = summer1(p, X);
plot(w,y);
pr=corrcoef(w,y);
mse=mean((w-y).^2);

tht=atan(p(6)./(p(2)-p(3)))./2;
A=1./(p(3)+p(6)./2.*cot(tht));
B=1./(p(2)-p(6)./2.*cot(tht));

