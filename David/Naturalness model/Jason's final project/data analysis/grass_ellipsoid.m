function r = grass_ellipsoid(lab)

% estimate whether the color is grass color in cielab space,if be return 1.

% grass ellipsoid parameters

x0 = 49.7;
y0 = -16.3;
z0 = 19.5;
u0 = 0.000755838;
u1 = 0.00032089;
u2 = 0.00280571;
u3 = -0.0010427;
u4 = 0.000955474;
u5 = 0.00123239;



x = lab(:,1);
y = lab(:,2);
z = lab(:,3);

t = u0*(x-x0).^2+u1*(x-x0).*(y-y0)+u2*(y-y0).^2+u3*(x-x0).*(z-z0)+u4*(y-y0).*(z-z0)+u5*(z-z0).^2;

r = (t <= 1);