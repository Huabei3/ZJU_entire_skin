for i1=1:8
load('num-C');
num=(mean(num'))';
load('skin8lab');

a=c(:,(3*i1-1));
b=c(:,3*i1);
w=num((25*i1-24):(25*i1),1); 

  %percentage

p0 = [1 1 1 1 1 1];  
X=[a,b];
[p,r] = nlinfit(X,w,@summer,p0);
y = summer(p, X);
plot(w,y);
pr=corrcoef(w,y);
mse=mean((w-y).^2);

[a,b]=mydraw(p,0.3);
lab1(i1,:)=[a,b,mse];

end
