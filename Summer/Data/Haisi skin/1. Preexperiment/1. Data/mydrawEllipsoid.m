function [J,a,b] = mydrawEllipsoid(a0, R)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
ta=(-15:0.1:15);
tb=(-60:0.1:20);
tJ=(80:0.1:110);
[a,b,J] = meshgrid(ta,tb,tJ);
a = a(:);
b = b(:);
J = J(:);
% d = a0(1)*J.^2 + a0(2)*a.^2 + a0(3)*b.^2 + a0(4)*J + a0(5)*a + a0(6)*b;
d = a0(1)*J.^2 + a0(2)*a.^2 + a0(3)*b.^2 + a0(4)*J.*a + a0(5)*J.*b + a0(6)*a.*b + a0(7)*J + a0(8)*a + a0(9)*b + a0(10);
% d = a0(1)*J.^2 + a0(2)*a.^2 + a0(3)*b.^2 + a0(4)*a.*b;
dp = d - R;
idx = dp.^2 < 0.01;
scatter3(a(idx),b(idx),J(idx),'.');
% scatter(b(idx),J(idx),'.');
hold on
axis equal
% [A, B, theta] = ellipsePar(a(idx),b(idx),J(idx))
% axis equal
% xlabel('a''');
% ylabel('b''');
% zlabel('J''');
J = mean(J(idx));
a = mean(a(idx));
b = mean(b(idx));
end

