function r = sky_ellipsoid(lab)

% estimate whether the color is sky color in cielab space,if be return 1.

% sky ellipsoid parameters

x0 = 62.8;
y0 = -5.6;
z0 = -28.5;
u0 = 0.000934281;
u1 = 0.00154247;
u2 = 0.00624211;
u3 = -0.000745766;
u4 = 0.00116825;
u5 = 0.00131317;



x = lab(:,1);
y = lab(:,2);
z = lab(:,3);

t = u0*(x-x0).^2+u1*(x-x0).*(y-y0)+u2*(y-y0).^2+u3*(x-x0).*(z-z0)+u4*(y-y0).*(z-z0)+u5*(z-z0).^2;

% r = (t <= 1);
r = (t <= 0.5);