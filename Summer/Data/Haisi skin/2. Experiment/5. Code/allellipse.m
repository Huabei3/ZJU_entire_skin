 load('uv25.mat');
 load('num-P.mat');

for jj=1:16
    for k=1:9
u=a(1:(25*jj),1);
v=a(1:(25*jj),2);

w=num(1:(25*jj),k);  %percentage

p0 = [1 1 1 1 1 1 ];  
X=[u,v];
[p,r] = nlinfit(X,w,@summer,p0);
y = summer(p, X);
plot(w,y);
pr=corrcoef(w,y);
mse(jj,k)=mean((w-y).^2);

% find the max
CCT=6000:50:10000;
Duv=-0.015:0.001:0.015;
for i=1:81
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
tab1(jj,(2*k-1))=uu;
tab1(jj,(2*k))=vv;
uvYtab=[uu,vv,0.54];
XYZtab=uvY2xyz(uvYtab);
tab5(jj,(3*k-2):(3*k))=XYZtab;
[CCTtab,Duvtab]=CCTa(XYZtab);
tab2(jj,k)=CCTtab;
tab3(jj,k)=Duvtab;
tab4(jj,k)=pr(2,1);
    end
end
