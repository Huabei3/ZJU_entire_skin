for i1=1
load('num-C');
load('skin8lab')
l=c(:,(3*i1-2));
a=c(:,(3*i1-1));
b=c(:,3*i1);
w=num((25*i1-24):25*i1,9);  %percentage
p0 = [1 1 1 1 1 1 1 1 1 1];  
X=[l,a,b];
[p,r,k] = nlinfit(X,w,@labsummer,p0);
y = labsummer(p, X);
plot(w,y);
pr=corrcoef(w,y);
mse=mean((w-y).^2);

% find the max[
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
        lab=xyz2lab(XYZ_D65,'user',[433.8 475.0 566.4]);       
        lab01(c,:)=lab;        
    end
end
yy = labsummer(p, lab01);
[l1,a1,b1]=mydrawEllipsoid(p,0.55);
tab1(i1,1)=l1;
tab1(i1,2)=a1;
tab1(i1,3)=b1;
tab1(i1,4)=pr(2,1);
end
