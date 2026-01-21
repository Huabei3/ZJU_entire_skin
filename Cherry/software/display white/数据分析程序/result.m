xyzw=[171.4,179.1,202.1]; %230
% xyzw=[250.5,260.3,293.9]; %400

JAB = XYZ2CAM16UCS(XYZ,xyzw,0.01,20,'dark');
 for i=1:11
     zscore=score400(:,i);
     idx=zscore>0;
     xdata=JAB(idx,:);
     ydata=zscore(idx,:);
     [par,r,y] = ellipsoidfit4(xdata,ydata);
     res(i,:)=par;
     pr(i)=r;
 end
 for i=1:11
     zscore=score230(:,i);
    idx=zscore>0;
     xdata=uv230(idx,:);
     ydata=zscore(idx,:);
     [par,r,y] = ellipsoidfit5(xdata,ydata);
     res(i,:)=par;
     pr(i)=r;
 end
for i=11
     jab=res(i,5:7);
     xyz = CAM16UCS2XYZ2(jab,xyzw,0.01,20,'dark');
     [CCT_out,duv_out]=CCTa(xyz,1964);
     result(i,1)=CCT_out;
     result(i,2)=duv_out;
end
for i=1:5
     jab=res(i,5:7);
     CCT=light(i,1);
     Duv=light(i,2);
     xyz = CAM16UCS2XYZ(jab,xyzw,32,20,'avg',CCT,Duv);
     [CCT_out,duv_out]=CCTa(xyz,1964);
     result(i,1)=CCT_out;
     result(i,2)=duv_out;
end
for i=6:10
     jab=res(i,5:7);
     CCT=light(i,1);
     Duv=light(i,2);
     xyz = CAM16UCS2XYZ(jab,xyzw,62,20,'avg',CCT,Duv);
     [CCT_out,duv_out]=CCTa(xyz,1964);
     result(i,1)=CCT_out;
     result(i,2)=duv_out;
end
 axis equal;
hold on;
axis([0 1 0 1]);
grid on
xlabel('visual percentage','FontSize',15);
ylabel('predicted percentage','FontSize',15);

for i=11
     jab=res(i,5:7);
     xyz = CAM16UCS2XYZ2(jab,xyzw,0.01,20,'dark');
     xYz(i,:)=xyz;
     uvY=xyz2uvY(xyz);
     uvy(i,:)=uvY;
end

for i=1:5
     jab=res(i,5:7);
     CCT=light(i,1);
     Duv=light(i,2);
     xyz = CAM16UCS2XYZ(jab,xyzw,32,20,'avg',CCT,Duv);
     xYz(i,:)=xyz;
     uvY=xyz2uvY(xyz);
     uvy(i,:)=uvY;
end
for i=6:10
     jab=res(i,5:7);
     CCT=light(i,1);
     Duv=light(i,2);
     xyz = CAM16UCS2XYZ(jab,xyzw,62,20,'avg',CCT,Duv);
     xYz(i,:)=xyz;
     uvY=xyz2uvY(xyz);
     uvy(i,:)=uvY;
end


     XYZ=uvY2xyz(uvY);
     [CCT_out,duv_out]=CCTa(XYZ,1964);
x=0.16:0.001:0.3;  
y=0.42:0.001:0.56;      
[x,y]=meshgrid(x,y);
%z=(a(6)./exp(sqrt(a(1).*(x-a(4)).^2+a(2).*(y-a(5)).^2+a(3).*(x-a(4)).*(y-a(5)))));
z=1./(1+exp((sqrt(a(1)*(x-a(4)).^2+a(2)*(y-a(5)).^2+a(3)*(x-a(4)).*(y-a(5))))-a(6)));
mesh(x,y,z)
hold on
zscore=score230(:,11);
idx=zscore>0;
     x0=uv230(idx,1);
     y0=uv230(idx,2);
     z0=zscore(idx,:);
scatter3(x0,y0,z0,'ko','MarkerFaceColor','k');
xlabel('u¡®','FontSize',15);
ylabel('v¡®','FontSize',15);
zlabel('P%','FontSize',15);
contour(x,y,z,5);
[C,~]=contour(x,y,z);

for i =1:10
syms x
syms y
g=gg(i,:);
s =g(1)*(x-g(4)).^2+g(2)*(y-g(5)).^2+g(3)*(x-g(4)).*(y-g(5));
N = coeffs(expand(s));
f=g(6)^2-N(1);
d=N(4);
c=N(3);
e=N(2);
b=N(5);
a=N(6);
[aa,bb,h] = ellipsefig1(a,b,c,d,e,f);
ratio=max(aa/bb,bb/aa);
jiao=90-0.5*atan(g(3)/(g(2)-g(1)))*180/pi;
axis equal;
hold on;
plot(g(4),g(5),'.','Color',[0 0 1],'MarkerSize',15);
res(i,1:2)=g(4:5);
res(i,3)=max(aa,bb);
res(i,4)=ratio;
res(i,5)=jiao;
end

xdata=result(1:5,1);
ydata=result(1:5,2);
[par,r,y] = neutral(xdata,ydata);

tx=result(6:10,1);
ty=result(6:10,2);
g0 = [1];  
[g,r,j] = nlinfit(tx,ty,@neutral1,g0);
y = neutral1(g, tx);
pr=corrcoef(ty,y);

x=[2000:10:10000];
y=(par(1).*log(x)+par(2));
    
plot(x,y,'Color',[0 0 0],'LineWidth',2);
axis equal;
hold on;
plot(result(1:5,1),result(1:5,2),'o','MarkerFaceColor',[1 0.5 0],'MarkerSize',5);
plot(result(6:10,1),result(6:10,2),'o','MarkerFaceColor',[1 0 1],'MarkerSize',5);
plot(result(11:21,1),result(11:21,2),'o','MarkerFaceColor',[0 1 0],'MarkerSize',5);
plot(result(22:28,1),result(22:28,2),'o','MarkerFaceColor',[ 0 1 1],'MarkerSize',5);
plot(result(29:37,1),result(29:37,2),'o','MarkerFaceColor',[0 0 1],'MarkerSize',5);
xlim([2000 10000]);
ylim([2000 10000]);
legend('equation','ZJU-500','ZJU-1000','KIST','HK poly','Zhai');
