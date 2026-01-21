% a-b平面椭圆
syms y
syms z
s =par(2)*(y-par(6)).^2+par(3)*(z-par(7)).^2+par(4)*(y-par(6)).*(z-par(7)); 
N = coeffs(expand(s));
x = -log(par(8));
f=x^2/par(1)^2-N(1);
d=N(4);
c=N(3);
e=N(2);
b=N(5);
a=N(6);
a0=par(6);
b0=par(7);
chroma=sqrt(a0^2+b0^2); % chroma
hue=atan(b0/a0)*180/pi; % hue angle
[aa,bb,h] = ellipsefig1(a,b,c,d,e,f);
ratio=max(aa/bb,bb/aa); % 长轴比短轴
jiao=90-0.5*atan(par(4)/(par(3)-par(2)))*180/pi;  % 偏移角度
axis equal;
hold on;
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(par(6),par(7),'.','Color',[0 0 1],'MarkerSize',15);

function  [aa,bb,h] = ellipsefig1(a,b,c,d,e,f)
% 画一般椭圆：ax*x+bx*y+c*y*y+d*x+e*y = f
delta = b^2-4*a*c;
if delta >= 0
    warning('这不是一个椭圆')
    return;
end
x0 = (b*e-2*c*d)/delta;
y0 = (b*d-2*a*e)/delta;
r = a*x0^2 + b*x0*y0 +c*y0^2 + f;
if r <= 0
    warning('这不是一个椭圆')
    return;
end


aa = sqrt(r/a); 
bb = sqrt(-4*a*r/delta);
t = linspace(0, 2*pi, 60);
xy = [1 -b/(2*a);0 1]*[aa*cos(t);bb*sin(t)];
h = plot(xy(1,:)-x0,xy(2,:)-y0, 'Color',[0.5 0.5 0.5], 'linewidth', 2);
end
