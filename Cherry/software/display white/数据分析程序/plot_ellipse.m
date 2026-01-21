 for i=1:4
     zscore=score_o(:,i);
     cielab=skin_lab(:,(i-1)*3+1:(i-1)*3+3);
     [par,r,y] = ellipsoidfit3(cielab,zscore);
     res(i,:)=par;
     pr(i)=r;
     yy(:,i)=y;
 end
  for i=1:4
     zscore=(score_o(:,i)*30+score_s(:,i)*30+score_c(:,i)*31)/(30+30+31);
     cielab=skin_lab(:,(i-1)*3+1:(i-1)*3+3);
     [par,r,y] = ellipsoidfit3(cielab,zscore);
     res(i,:)=par;
     pr(i)=r;
     yy(:,i)=y;
 end
 
 
for i =1:5
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
ellipsefig1(a,b,c,d,e,f);
axis equal;
hold on;
xlabel('u¡¯','FontSize',15);
ylabel('v¡¯','FontSize',15);
% plot(g(4),g(5),'.','Color',[1 0 0],'MarkerSize',15);
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
ylabel('L*','FontSize',15);
plot(g(6),g(5),'.','Color',[0 1 0],'MarkerSize',15);
end

g=gg(i,:);
xc=[g(6),g(7),g(5)];
r=g(9)^2/g(1)^2;
P(1,1)=g(2);
P(2,2)=g(3);
P(3,3)=1;
P(1,2)=g(4)/2;
p(2,1)=g(4)/2;
P(1,3)=0;
P(3,1)=0;
P(2,3)=0;
P(3,2)=0;
ellipsefig(xc,P,r,2);
axis equal;
hold on;
axis([5 35 5 35]);

E=a(1)*sqrt((xdata(:,1)-a(5)).^2+a(2)*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)));

