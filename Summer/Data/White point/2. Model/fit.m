load('uv97.mat');
%  load('img1.mat');
 for zz=1:12
u=uv97(1:24,1);
v=uv97(1:24,2);

w=ww(73:96,zz);  %percentage

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

[uu,vv]=mydraw(p,0.55);
tab(1,1)=uu;
tab(1,2)=vv;
uvYtab=[uu,vv,0.54];
XYZtab=uvY2xyz(uvYtab);
[CCTtab,Duvtab]=CCTa(XYZtab);
tab(1,3)=CCTtab;
tab(1,4)=Duvtab;
tab(1,5)=pr(2,1);
ta(zz,:)=tab;
end