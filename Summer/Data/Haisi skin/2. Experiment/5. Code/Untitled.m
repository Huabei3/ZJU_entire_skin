[num,txt,raw]=xlsread(strcat('./317.xlsx')); 
 t=txt(2:11971,4);
for i=1:11970
tt=cell2mat(t(i,1));
t1(i,1)=tt(34);
t2(i,:)=tt(36:37);
end
t11=str2num(t1);
t22=str2num(t2);