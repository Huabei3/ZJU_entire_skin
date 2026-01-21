% clear all
load('Dfit1021.mat');
% load('data0621-3.mat');
j=1;
a3=[MCDM(a(1:5,:));MCDM(a(6:10,:));MCDM(a(11:15,:));MCDM(a(16:20,:))]';
for D=1:1:10
    for i=1:4
f2=ciecat02_d(xyz,f1(i,:)./f1(i,2).*100,[94.813 100.000 107.262],'CAT16',100,100,D./10); 
b1=xyz2lab(f2,'user',[95.047 100.00 108.883]);
% b2=[b1(j,:);b1(j+5,:);b1(j+10,:);b1(j+15,:)];
% b3=[b1(4,:);b1(9,:);b1(14,:);b1(19,:)];
% b4(i)=cielabde(b2(i,:),b3(i,:));
a1(D,:)=[MCDM(b1(1:5,:));MCDM(b1(6:10,:));MCDM(b1(11:15,:));MCDM(b1(16:20,:))]';
a2=mean(a1')';
    end
% D1(D,:)=b4;
 end
