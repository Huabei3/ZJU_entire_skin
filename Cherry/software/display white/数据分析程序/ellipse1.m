for i=1:10
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
% ª≠“ª∞„Õ÷‘≤£∫ax*x+bx*y+c*y*y+d*x+e*y = f
delta = b^2-4*a*c;
x0 = (b*e-2*c*d)/delta;
y0 = (b*d-2*a*e)/delta;
r = a*x0^2 + b*x0*y0 +c*y0^2 + f;
aa = sqrt(r/a); 
bb = sqrt(-4*a*r/delta);
ratio=max(aa/bb,bb/aa);
jiao=90-0.5*atan(g(3)/(g(2)-g(1)))*180/pi;
res(i,1:2)=g(4:5);
res(i,3)=max(aa,bb);
res(i,4)=ratio;
res(i,5)=jiao;
end