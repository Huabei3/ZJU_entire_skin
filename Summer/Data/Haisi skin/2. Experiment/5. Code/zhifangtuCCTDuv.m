clear all
load('choicedata.mat');
bb1=b1';bb2=b2';bb3=b3';
bb1=sum(bb1);bb2=sum(bb2);bb3=sum(bb3);
bb1=bb1';bb2=bb2';bb3=bb3';

for j=1:8
cc1=bb1((25*j-24):25*j,1);cc2=bb2((25*j-24):25*j,1);cc3=bb3((25*j-24):25*j,1);
cc1=reshape(cc1,5,5);cc2=reshape(cc2,5,5);cc3=reshape(cc3,5,5);

set(gcf,'position',[100,100,900,300]); 

subplot(1,3,1);subplot('position', [0.04 0.12 0.29 0.74]); 
bar3(cc1);
xlabel('Dosplay CCT');ylabel('Display Duv');zlabel('sccore');
set(gca,'yticklabel',{'-0.010','-0.005','0','+0.005','+0.010'});
set(gca,'xticklabel',{'4000K','5000K','6500K','8000K','10000K'});
title('Oriental result');view(-35,35);

subplot(1,3,2);subplot('position', [0.37 0.12 0.29 0.74]);
bar3(cc2);
xlabel('Dosplay CCT');ylabel('Display Duv');zlabel('sccore');
set(gca,'yticklabel',{'-0.010','-0.005','0','+0.005','+0.010'});
set(gca,'xticklabel',{'4000K','5000K','6500K','8000K','10000K'});
title('South Asian result');view(-35,35);

subplot(1,3,3);subplot('position', [0.70 0.12 0.29 0.74]); 
bar3(cc3);
xlabel('Dosplay CCT');ylabel('Display Duv');zlabel('sccore');
set(gca,'yticklabel',{'-0.010','-0.005','0','+0.005','+0.010'});
set(gca,'xticklabel',{'4000K','5000K','6500K','8000K','10000K'});
title('Caucasian result');view(-35,35);

sgtitle(strcat('Image. ',num2str(j),' display CCT & Duv score histogram'));
saveas(gcf,strcat('CCTDuv',num2str(j)),'png');
end