load('david_CAT_HSpaper_1107.mat');
load('data_HS_david_1107.mat');
for i=1:29
xyz=lab2xyz(a(i,:),'d65_64');
f2=ciecat02_d(xyz,[94.811 100.00 107.304],[96.720 100.00 81.427],'CAT16',100,100,1); 
b1(i,:)=xyz2lab(f2,'user',[96.720 100.00 81.427]);
end
