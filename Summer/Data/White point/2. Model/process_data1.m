% b=a';
% c=a';
% y=sortrows(b,1);
% z=sortrows(c,1);
% aa=y(:,2);
% bb=z(:,2);
% figure,plot(aa,bb,'*');
% min(min(corrcoef(aa,bb))); 
for i=1:12
    d(:,1)=b(:,i);
    d(:,2)=c(:,i);
    e=sortrows(d,1);
    f(:,i)=e(:,2);
end
load('C:\Users\Administrato\Desktop\score\ZYT_P_dark.mat')
b(:,1)=a';
load('C:\Users\Administrato\Desktop\score\ZYT_P_3000.mat')
b(:,2)=a';
load('C:\Users\Administrato\Desktop\score\ZYT_P_4000.mat')
b(:,3)=a';
load('C:\Users\Administrato\Desktop\score\ZYT_P_5000.mat')
b(:,4)=a';
load('C:\Users\Administrato\Desktop\score\ZYT_P_6000.mat')
b(:,5)=a';
load('C:\Users\Administrato\Desktop\score\ZYT_P_7000.mat')
b(:,6)=a';
load('C:\Users\Administrato\Desktop\score\ZYT_N_dark.mat')
b(:,7)=a';
load('C:\Users\Administrato\Desktop\score\ZYT_N_3000.mat')
b(:,8)=a';
load('C:\Users\Administrato\Desktop\score\ZYT_N_4000.mat')
b(:,9)=a';
load('C:\Users\Administrato\Desktop\score\ZYT_N_5000.mat')
b(:,10)=a';
load('C:\Users\Administrato\Desktop\score\ZYT_N_6000.mat')
b(:,11)=a';
load('C:\Users\Administrato\Desktop\score\ZYT_N_7000.mat')
b(:,12)=a';
