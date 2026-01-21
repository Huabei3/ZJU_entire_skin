load zscore160_huawei;
load QC;
load QCL;
load QN;
X1 = [QN'  QC' QCL' QN'.*QC' QCL'.*QN'  QC'.*QCL' QN'.^2 QC'.^2 QCL'.^2 ones(160 , 1)];

Y = zscore;
k1 = regress(Y , X1);
% k1 = [0.52;4.29;-1.23;-0.94]; %oppo model
Z1 = X1 * k1;

ss1 = mySTRESS(Y , Z1);
temp = corrcoef(Y , Z1);
ss2 = temp(1,2);


scatter(Y, Z1);

