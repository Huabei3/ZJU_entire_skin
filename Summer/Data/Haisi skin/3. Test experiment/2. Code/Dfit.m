clear all
load('data1011.mat');
load('data0621-3.mat');
D=[0.454 0.521 0.562 0.599 0.622];
for i=1:10
for ol=1:5
f2=ciecat02_d(xyz,f1(ol,:)./f1(ol,2).*475,[94.813 100.000 107.262],'CAT16',100,100,D(ol).*i./10); 
b1=xyz2lab(f2,'user',[433.8 475.0 566.4]);
mc(ol,1)=MCDM(b1(1:5,:));
mc(ol,2)=MCDM(b1(6:10,:));
mc(ol,3)=MCDM(b1(11:15,:));
mc(ol,4)=MCDM(b1(16:20,:));
D1(ol,i)=D(ol).*i./10;
end
md(:,i)=mean(mc)';
end
md(5,:)=mean(md);