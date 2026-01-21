 for i=1:4
     zscore=score_o(:,i);
     cielab=skin_lab(:,(i-1)*3+1:(i-1)*3+3);
     [par,r,y] = ellipsoidfit4(cielab,zscore);
     res(i,:)=par;
     pr(i)=r;
     yy(:,i)=y;
 end
  for i=1:4
     zscore=(score_o(:,i)*30+score_s(:,i)*30+score_c(:,i)*31)/(30+30+31);
     cielab=skin_lab(:,(i-1)*3+1:(i-1)*3+3);
     [par,r,y] = ellipsoidfit4(cielab,zscore);
     res(i,:)=par;
     pr(i)=r;
     yy(:,i)=y;
 end
 
 
for i =1:4
syms y
s =g(2)*(y-g(6)).^2+g(3)*(z-g(7)).^2+g(4)*(y-g(6)).*(z-g(7));
N = coeffs(expand(s));
f=g(9)^2/g(1)^2-N(1);
d=N(4);
c=N(3);
e=N(2);
b=N(5);
a=N(6);
a0=g(6);
b0=g(7);
chroma=sqrt(a0^2+b0^2);
hue=atan(b0/a0)*180/pi;
[aa,bb,h] = ellipsefig1(a,b,c,d,e,f);
ratio=max(aa/bb,bb/aa);
jiao=90-0.5*atan(g(4)/(g(3)-g(2)))*180/pi;
axis equal;
hold on;
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(g(6),g(7),'.','Color',[0 0 1],'MarkerSize',15);
res(i,1:3)=g(5:7);
res(i,4)=chroma;
res(i,5)=hue;
res(i,6)=max(aa,bb);
res(i,7)=ratio;
res(i,8)=jiao;
end

for i =1:4
syms x
syms y
g=gg(i,:);
s =(y-g(5)).^2+g(2)*(x-g(6)).^2;
N = coeffs(expand(s));
f=g(9)^2/g(1)^2-N(1);
d=N(4);
c=N(3);
e=N(2);
b=0;
a=N(5);
[aa,bb,h] = ellipsefig1(a,b,c,d,e,f);
axis equal;
hold on;
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(g(6),g(5),'.','Color',[0 1 0],'MarkerSize',15);
end

g=gg(i,:);
xc=[g(6),g(7),g(5)];
%r=g(9)^2/g(1)^2;
r=g(8)^2;
P(1,1)=g(2);
P(2,2)=g(3);
P(3,3)=g(1);
P(1,2)=g(4)/2;
p(2,1)=g(4)/2;
P(1,3)=0;
P(3,1)=0;
P(2,3)=0;
P(3,2)=0;
ellipsefig(xc,P,r,2);
axis equal;
hidden off;
hold on;
axis([5 35 5 35]);

E=a(1)*sqrt((xdata(:,1)-a(5)).^2+a(2)*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)));

 for i=1:4
     zscore=score_s(:,i);
     cielab=skin_lab(:,(i-1)*3+1:(i-1)*3+3);
     [par,r,y] = ellipsoidfit2(cielab,zscore);
     res(i,:)=par;
     pr(i)=r;
     yy(:,i)=y;
 end
 for i=1:4
     zscore=(score_o(:,i)*30+score_s(:,i)*30+score_c(:,i)*31)/(30+30+31);
     cielab=skin_lab(:,(i-1)*3+1:(i-1)*3+3);
     [par,r,y] = ellipsoidfit2(cielab,zscore);
     res(i,:)=par;
     pr(i)=r;
     yy(:,i)=y;
 end
 
 for i =1:16
syms y
syms z
g=gg(i,:);
s =g(2)*(y-g(6)).^2+g(3)*(z-g(7)).^2+g(4)*(y-g(6)).*(z-g(7));
N = coeffs(expand(s));
f=g(9)^2-N(1);
d=N(4);
c=N(3);
e=N(2);
b=N(5);
a=N(6);
a0=g(6);
b0=g(7);
chroma=sqrt(a0^2+b0^2);
hue=atan(b0/a0)*180/pi;
[aa,bb,h] = ellipsefig1(a,b,c,d,e,f);
ratio=max(aa/bb,bb/aa);
jiao=90-0.5*atan(g(4)/(g(3)-g(2)))*180/pi;
axis equal;
hold on;
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(g(6),g(7),'.','Color',[0 0.5 0.5],'MarkerSize',15);
res(i,1:3)=g(5:7);
res(i,4)=chroma;
res(i,5)=hue;
res(i,6)=max(aa,bb);
res(i,7)=ratio;
res(i,8)=jiao;
 end

s =(g(2)*(y-g(6)).^2+g(3)*(z-g(7)).^2+g(4)*(y-g(6)).*(z-g(7)))./f;
N = coeffs(expand(s));
f=(log(g(8)/0.5))^2/g(1)^2;

fmesh('(g(2)*(y-g(6)).^2+g(3)*(z-g(7)).^2+g(4)*(y-g(6)).*(z-g(7)))./f');

x=5:0.1:40;  
y=5:0.1:40;      
[x,y]=meshgrid(x,y);
z=(g(8)./exp(g(1)*sqrt(g(2)*(x-g(6)).^2+g(3)*(y-g(7)).^2+g(4)*(x-g(6)).*(y-g(7)))));
mesh(x,y,z)
hold on
x0=skin_lab(:,2);
y0=skin_lab(:,3);
z0=zscore;
scatter3(x0,y0,z0,'ko','MarkerFaceColor','k');
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
zlabel('P%','FontSize',15);
title('All observers: Caucasian image');
contour(x,y,z,8);

