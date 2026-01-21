load('fit29i15t.mat')
for i=1:29
 parr=parrr(i*15-14:i*15,:);
%  mcdm(i,1)=MCDM(parr(1:3,3:5));    
%  mcdm(i,2)=MCDM(parr(4:6,3:5));
%  mcdm(i,3)=MCDM(parr(7:9,3:5));    
%  mcdm(i,4)=MCDM(parr(10:12,3:5));
%  mcdm(i,5)=MCDM(parr(13:15,3:5));
lab(i,:)=mean(parrr(i*15-14:i*15,1:10));
end