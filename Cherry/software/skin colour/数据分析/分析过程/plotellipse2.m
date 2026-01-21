syms y
syms z
s =par(2)*(y-par(6)).^2+par(3)*(z-par(7)).^2+par(4)*(y-par(6)).*(z-par(7)); 
N = coeffs(expand(s));
f=par(8)^2-N(1);
d=N(4);
c=N(3);
e=N(2);
b=N(5);
a=N(6);
a0=par(6);
b0=par(7);
[aa,bb,h] = ellipsefig1(a,b,c,d,e,f);
axis equal;
hold on;
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(par(6),par(7),'.','Color',[0 0 0],'MarkerSize',20);

syms x
syms y
res=test(4,:);
s =(x-res(5)).^2+res(2)*(y-res(6)).^2+res(3)*(x-res(5)).*(y-res(6)); 
N = coeffs(expand(s));
f=res(4)^2/res(1)^2-N(1);
d=N(4);
c=N(3);
e=N(2);
b=N(5);
a=N(6);
a0=res(5);
b0=res(6);
[aa,bb,h] = ellipsefig1(a,b,c,d,e,f);
plot(res(5),res(6),'*','Color',[0 1 1],'MarkerSize',8);

par=par_3(4,:);
syms y
syms z
s =par(2)*(y-par(6)).^2+par(3)*(z-par(7)).^2+par(4)*(y-par(6)).*(z-par(7)); 
N = coeffs(expand(s));
f=par(8)^2/par(1)^2-N(1);
d=N(4);
c=N(3);
e=N(2);
b=N(5);
a=N(6);
a0=par(6);
b0=par(7);
[aa,bb,h] = ellipsefig1(a,b,c,d,e,f);
plot(par(6),par(7),'^','Color',[1 1 0],'MarkerSize',5,'MarkerFaceColor',[1 1 0]);

syms x
syms y
res=par_4(7,:);
s =(x-res(5)).^2+res(2)*(y-res(6)).^2+res(3)*(x-res(5)).*(y-res(6)); 
N = coeffs(expand(s));
f=res(4)^2/res(1)^2-N(1);
d=N(4);
c=N(3);
e=N(2);
b=N(5);
a=N(6);
a0=res(5);
b0=res(6);
[aa,bb,h] = ellipsefig1(a,b,c,d,e,f);
hold on
plot(res(5),res(6),'d','MarkerSize',5,'MarkerFaceColor',[1 0.5 0],'MarkerEdgeColor',[0 0 0]);

plot(skin(2,1),skin(2,2),'p','MarkerSize',7,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[0 0 0]);
hold on

legend('','grey-dark(WP1)','','grey-3000K(WP2)','','grey-4000K(WP2)','','grey-5000K(WP2)','','grey-6500K(WP2)','',...
    'blue-dark(WP3)','','green-dark(WP3)','','red-dark(WP3)','','yellow-dark(WP3)','',...
    'Indoor Office(WP4)','','Indoor Cafe(WP4)','','Outdoor Street Daylight(WP4)','','Sky(WP4)','','Garden Cloudy(WP4)','','Outdoor Street Night(WP4)','','Garden Sunny(WP4)');
axis([0 30 0 30]);

legend('grey-dark(WP1)','grey-3000K(WP2)','grey-4000K(WP2)','grey-5000K(WP2)','grey-6500K(WP2)',...
    'blue-dark(WP3)','green-dark(WP3)','red-dark(WP3)','yellow-dark(WP3)',...
    'Indoor Office(WP4)','Indoor Cafe(WP4)','Outdoor Street Daylight(WP4)','Sky(WP4)','Garden Cloudy(WP4)','Outdoor Street Night(WP4)','Garden Sunny(WP4)');
