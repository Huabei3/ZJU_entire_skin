





x = [abs(ddjl) abs(DDC)];
y = zscore;
% lb = [-1,-1,-1];
% ub = [1,1,1];
% f = @(a,x)a(1)*(x(:,1)-a(4)).^2+a(2)*(x(:,2)-a(5)).^2+a(3)*(x(:,3)-a(6)).^2;
options = optimoptions('lsqcurvefit','MaxFunctionEvaluations',10000);
f = @(a,x)a(1)*x(:,1) + a(2)*x(:,2) + a(3);
[a,r] = lsqcurvefit(f,[1,1,1],x,y,[],[],options);

y0 = a(1)*x(:,1) + a(2)*x(:,2) + a(3);
scatter(y0, y);
corrcoef(y0, y)
mySTRESS(y0, y)
cv(y0, y)
% ty1 = reshape(y0,10,6);
% ty11 = ty1(1:5,:);
% ty12 = ty1(6:10,:);
% ty2 = (ty11+ty12)/2;
% my0 = reshape(ty2,30,1);
% % my0 = mean(reshape(y0,10,6),2);
% 
% % my = mean(reshape(y,10,6),2);
% ty1 = reshape(y,10,6);
% ty11 = ty1(1:5,:);
% ty12 = ty1(6:10,:);
% ty2 = (ty11+ty12)/2;
% my = reshape(ty2,30,1);
% scatter(my0, my);
% corrcoef(my0, my)
% mySTRESS(my0, my)
% cv(my0, my)
