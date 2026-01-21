load('data.mat')
 for i=1:19800
if data(i,5)==2
    data(i,5)=0;
end 
 end
 c=zeros(90,1);
 for  i=1:220
     d=data((i*90-89):i*90,5);
  c=c+d;
 end
     