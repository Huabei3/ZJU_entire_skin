clear all
load('data0621-3.mat');
load('meanlab.mat');
c=mean(a')';
c=reshape(c,100,5);

for D=1:1:21
    for i=1:5
    xyz=lab2xyz(b,'user',[433.8 475.0 566.4]);
    f2=ciecat02_d(xyz,f1(i,:)./f1(i,2).*475,[94.813 100.000 107.262],'CAT16',100,100,D./1000+0.449); 
    b1=xyz2lab(f2,'user',[433.8 475.0 566.4]);
    b1(:,3)=b1(:,3)+3;
    for j=1:4
par(i+5*j-5,:)=ellipsoidfit5(b1(25*j-24:25*j,:),c(25*j-24:25*j,i));
    end
    end
aa=[41.64 	41.42 	41.29 	41.16 	41.08 	67.21 	66.89 	66.70 	66.52 	66.41 	68.84 	68.52 	68.32 	68.13 	68.02 	59.41 	59.12 	58.94 	58.78 	58.68 ];
lab=[aa',par(:,5:6)];
de(:,D)=cielabde(lab,bb);
a1(D,:)=[MCDM(lab(1:5,:));MCDM(lab(6:10,:));MCDM(lab(11:15,:));MCDM(lab(16:20,:))]';
a2=mean(a1')';
end