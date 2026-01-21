s=CCT_D;
x1=s(:,1);
x2=s(:,2);
x3=s(:,3);
y=s(:,4);
p0 = [1 1 ];   
X=[x1,x2,x3];
[p,r,j] = nlinfit(X,y,@pengrui4,p0);
z = pengrui4(p, X);

pr=corrcoef(y,z);
plot(y,z,'o');
mse=mean((y-z).^2);

s=uvLD;
x1=s(:,1);
x2=s(:,2);
x3=s(:,3);
y=s(:,4);
p0 = [1 1 1 1 1 1];   
X=[x1,x2,x3];
[p,r,j] = nlinfit(X,y,@pengrui6,p0);
z = pengrui6(p, X);

pr=corrcoef(y,z);
plot(y,z,'o');
mse=mean((y-z).^2);
CCT=CCT_D(:,1);
for i=1:8
    CCT=CCT_D(i,1);
    XYZ(i,:) = CCT2xyz( CCT );
end

cform = makecform('xyz2upvpl');
     uvY2 = applycform(XYZ,cform);