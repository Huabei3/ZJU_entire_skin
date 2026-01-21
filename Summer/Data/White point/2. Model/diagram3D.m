% A=[w];%x,y,z轴坐标
d=c(73:96,1)+92;
x=spot(:,1);y=spot(:,2);z=d;
scatter3(x,y,z)%散点图
figure
[X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');%插值
pcolor(X,Y,Z);shading interp%伪彩色图
figure,contourf(X,Y,Z) %等高线图
figure,surf(X,Y,Z);%三维曲面
