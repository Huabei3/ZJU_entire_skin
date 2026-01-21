

load naturenesszscore;
load DE;
DE0 = [];
zscore0 = [];
imgnum = 4;

for i = 1 : 6
    zscore0 = [zscore0 ; zscore(25*(i-1)+(imgnum-1)*5+1:25*(i-1)+(imgnum-1)*5+5,:)];
    DE0 = [DE0 ; DE(25*(i-1)+(imgnum-1)*5+1:25*(i-1)+(imgnum-1)*5+5,:)];
end
scatter(DE0(:,1),zscore0);




NZ = zscore0;
X = [DE0 ones(30 , 1)];
Y = NZ;
k = regress(Y , X);
Z = X * k;
s = mySTRESS(Y , Z);
scatter(Z , Y);

X1 = [DE ones(150 , 1)];
k = regress(Y , X1);
Z1 = X1 * k;
s1 = mySTRESS(zscore , Z1);
scatter(Z1 , zscore);


