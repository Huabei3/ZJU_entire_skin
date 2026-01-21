

load QC;
load QCL;
load QN;
load colorfulness_60_oppo;
CZ = zscore;
s1 = mySTRESS(CZ , QC');
r1 = corrcoef(CZ , QC');

load naturalness_60_oppo;
NZ = zscore;
s2 = mySTRESS(NZ , QN');
r2 = corrcoef(NZ , QN');

load contrast_60_oppo;
CLZ = zscore;
s3 = mySTRESS(CLZ , QCL');
r3 = corrcoef(CLZ , QCL');

load zscore60_oppo;




X1 = [QN'  QC' QCL' QN'.*QC' QCL'.*QN'  QC'.*QCL' QN'.^2 QC'.^2 QCL'.^2 ones(60 , 1)];
X2 = [NZ  CZ  CLZ  ones(60 , 1)];
Y = zscore;
k1 = regress(Y , X1);
% k1 = lsqlin(X1 , Y, [], [],[],[],[0.6,0,-10,-10],[]);
% k1 = [1.69 1.27 -0.22 0.37]'; % huawei model
k2 = regress(Y , X2);
Z1 = X1 * k1;
Z2 = X2 * k2;
ss1 = mySTRESS(Y , Z1);
t = corrcoef(Y , Z1);
rr1 = t(1,2);
ss2 = mySTRESS(Y , Z2);
t2 = corrcoef(Y , Z2);
rr2 = t2(1,2);
scatter(Z1, Y);

