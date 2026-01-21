function [u,v] = mydraw(a0, R)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% tu=(0.17:0.01:0.26);
% tv=(0.42:0.01:0.54);
tu=(-45:1:50);
tv=(-45:1:50);

[u,v] = meshgrid(tu,tv);
u = u(:);
v = v(:);

% d = a0(1)*J.^2 + a0(2)*a.^2 + a0(3)*b.^2 + a0(4)*J + a0(5)*a + a0(6)*b;
d = a0(1)*u.^2 + a0(2)*v.^2 + a0(3).*u.*v+ a0(4).*u + a0(5).*v + a0(6);
% d = a0(1)*J.^2 + a0(2)*a.^2 + a0(3)*b.^2 + a0(4)*a.*b;
dp = d - R;
idx = dp.^2 < 0.01;
scatter (u(idx),v(idx)'.');
% scatter(b(idx),J(idx),'.');
hold on
axis equal
% [A, B, theta] = ellipsePar(a(idx),b(idx),J(idx))
% axis equal
% xlabel('a''');
% ylabel('b''');
% zlabel('J''');
u = mean(u(idx));
v = mean(v(idx));

end