load('num1.mat')
J2=Jab(:,1);
a2=Jab(:,2);
b2=Jab(:,3);
w=num(:,1);  %percentage

p0 = [1 1 1 1 1 1]; 
X=[J2,a2,b2];

[p,r,j] = nlinfit(X,w,@summer2,p0);
a=p
y = summer2(p, X);
plot(w,y);
pr=corrcoef(w,y);
mse=mean((w-y).^2);

