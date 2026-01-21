for i=1:12
a=e(i,3)*2;b=e(i,4)*2;
c=sqrt(a^2+b^2);t=(e(i,5)+90)./180.*pi;
x0=e(i,1);y0=e(i,2);
syms x y 
f1=(a^2+c^2*cos(t)^2)*(x-x0).^2+(a^2+c^2*sin(t)^2)*(y-y0).^2+c^2*sin(2*t)*(x-x0)*(y-y0)-a^2*b^2;
figure(1);
h1=ezplot(f1,[-1.5*a+x0,1.5*a+x0,-1.5*a+y0,1.5*a+y0,]);hold on;
set(h1,'Color',[0.5,0.5,0.5]);hold on;
text(x0-5,y0,num2str(i));
plot(x0,y0,'k.');
% plot([par(i,4),par1(i,4)],[par(i,5),par1(i,5)],'Color',[0.3,0.3,0.3]);
end
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
%=============================================set fig=====================================
set(gcf,'position',[100 100 500 500]);
axis([-100 100 -100 100]);hold on;grid on;
set(gca,'XTick',[-100:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:20:100]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title('YT Memory results on CIELAB a*b*');