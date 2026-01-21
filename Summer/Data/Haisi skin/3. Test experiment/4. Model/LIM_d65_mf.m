load('LIM_d65_mf.mat');
for i=1:5
par1m(i,:)=ellipsoidfit4(lab1m,cm); 
par1f(i,:)=ellipsoidfit4(lab1f,cf); 
par2m(i,:)=ellipsoidfitlim(lab2m,cm);
par2f(i,:)=ellipsoidfitlim(lab2f,cf);
end