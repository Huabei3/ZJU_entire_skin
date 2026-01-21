function r = skin_ellipsoid(lab)

% estimate whether the color is skin color in cielab space,if be return 1.

% skin ellipsoid parameters

x0 = 59;
y0 = 18.7;
z0 = 19.6;
u0 = 0.00073397;
u1 = 0.000356861;
u2 = 0.0037019;
u3 = 0.000150894;
u4 = -0.00278318;
u5 = 0.00196303;



x = lab(:,1);
y = lab(:,2);
z = lab(:,3);

t = u0*(x-x0).^2+u1*(x-x0).*(y-y0)+u2*(y-y0).^2+u3*(x-x0).*(z-z0)+u4*(y-y0).*(z-z0)+u5*(z-z0).^2;

r = (t <= 1);