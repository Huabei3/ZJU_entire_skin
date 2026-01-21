J=s1(:,1);
a=s1(:,2);
b=s1(:,3);
w=s1(:,4);  %percentage

p0 = [1 1 1 1 1 1 1 1 1 1];  
X=[J,a,b];
[p,r,j] = nlinfit(X,w,@pengrui,p0);
y = pengrui(p, X);
plot(w,y);
pr=corrcoef(w,y);
mse=mean((w-y).^2);

% find the max
CCT=3000:50:8000;
Duv=-0.02:0.001:0.02;
for i=1:101
    for j=1:41
        c=i*41-41+j;
        XYZ=CCT2xyz(CCT(i),Duv(j));
        cform = makecform('xyz2upvpl');
        uvY = applycform(XYZ,cform);
        u=uvY(1);
        v=uvY(2);
        Y=uvY(3);
        Ydark=Y.*0.54;
        uvYdark(1)=u;
        uvYdark(2)=v;
        uvYdark(3)=Ydark;
        cform = makecform('upvpl2xyz');
        xyzdark = applycform(uvYdark,cform);
        XYZ_D65=xyzdark./100;
        JzAzBz= XYZ2JzAzBz_n(XYZ_D65);       
        Jab01(c,:)=JzAzBz;        
    end
end
yy = pengrui(p, Jab01);

