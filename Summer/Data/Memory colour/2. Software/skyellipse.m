t=0:pi/200:2*pi;
a=29.3;b=12.2;
x0=-5.6;y0=-28.5;t0=-79.1./180.*pi;

t=0:pi./200:2*pi;
x1=a.*cos(t);
y1=b.*sin(t);
xx1=x1.*cos(t0)-y1.*sin(t0)+x0;
yy1=y1.*cos(t0)+x1.*sin(t0)+y0;
x2=a./2.*cos(t);
y2=b./2.*sin(t);
xx2=x2.*cos(t0)-y2.*sin(t0)+x0;
yy2=y2.*cos(t0)+x2.*sin(t0)+y0;

plot(xx1,yy1);
hold on
plot(xx2,yy2);

r=0:pi/4:2*pi;
x3=a.*cos(r);
y3=b.*sin(r);
xx3=x3.*cos(t0)-y3.*sin(t0)+x0;
yy3=y3.*cos(t0)+x3.*sin(t0)+y0;
x4=a./2.*cos(r);
y4=b./2.*sin(r);
xx4=x4.*cos(t0)-y4.*sin(t0)+x0;
yy4=y4.*cos(t0)+x4.*sin(t0)+y0;

scatter(xx3,yy3,50,'k');
scatter(xx4,yy4,50,'k');
scatter(-5.6,-28.5,100);

axis([-30 30 -60 10]);
set(gca,'XTick',[-30:10:30]);%设置要显示坐标刻度
set(gca,'YTick',[-60:10:10]);%设置要显示坐标刻度
grid on
xlabel('a*');ylabel('b*');
axis on;%显示坐标轴
title('95% ellipse of blue sky colours in CIELAB a*-b* coordinates');