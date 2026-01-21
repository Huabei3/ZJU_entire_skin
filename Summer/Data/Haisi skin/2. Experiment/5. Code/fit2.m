load('uv45.mat');
 load('num.mat');
u=a(1:45,1);
v=a(1:45,2);

w=num(1:45,1)./20;  %percentage

p0 = [1 1 1 1 1 1 ];  
X=[u,v];
[p,r] = nlinfit(X,w,@summer,p0);
y = summer(p, X);
plot(w,y);
pr=corrcoef(w,y);
mse=mean((w-y).^2);

% find the max
CCT=3000:50:10000;
Duv=-0.015:0.001:0.015;
for i=1:141
    for j=1:31
        c=i*31-31+j;
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
        uv= xyz2uvY(XYZ_D65);       
        uv01(c,:)=uv;        
    end
end
yy = summer(p, uv01);