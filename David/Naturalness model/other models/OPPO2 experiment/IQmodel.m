% load naturalness_natural
% NZ = zscore;
load QN;
load QC;
load QCL;

load iq_natural;
iq = zscore;
x = [QN QC QCL];
y = iq;
% lb = [-1,-1,-1];
% ub = [1,1,1];
% f = @(a,x)a(1)*(x(:,1)-a(4)).^2+a(2)*(x(:,2)-a(5)).^2+a(3)*(x(:,3)-a(6)).^2;
options = optimoptions('lsqcurvefit','MaxFunctionEvaluations',10000);
f = @(a,x)a(1)*x(:,1) + a(2)*x(:,2) + a(3)*x(:,3) + a(4);
[a,r] = lsqcurvefit(f,[1,1,1,1],x,y,[0,0,-10,-10],[10,10,10,10],options);

y0 = a(1)*x(:,1) + a(2)*x(:,2) + a(3)*x(:,3) + a(4);

scatter(y0, y);
corrcoef(y0, y)
mySTRESS(y0, y)
cv(y0, y)

