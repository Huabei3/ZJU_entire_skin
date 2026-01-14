function n = flch(a,xdata)

dl = xdata(:,1)-a(1);
dc = xdata(:,2)-a(2);
dh = xdata(:,3)-a(3);
dH = sqrt(xdata(:,2)*a(2)).*sin(dh/2);
de = a(4)*sqrt(dl.^2+a(5)*dc.^2+a(6)*dH.^2+a(7)*dl.*dc+a(8)*dl.*dH+a(9)*dc.*dH);
flag = dl.^2+a(5)*dc.^2+a(6)*dH.^2+a(7)*dl.*dc+a(8)*dl.*dH+a(9)*dc.*dH;
n = 1./(1+exp(de-a(10))).*(flag>=0);

end
