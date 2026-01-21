load('choicedata.mat');
bb1=b1';bb2=b2';bb3=b3';
bb1=mean(bb1);bb2=mean(bb2);bb3=mean(bb3);
bb1=bb1';bb2=bb2';bb3=bb3';
bc1=zeros(5,5);bc2=zeros(5,5);bc3=zeros(5,5);
for j=1:8
cc1=bb1((25*j-24):25*j,1);cc2=bb2((25*j-24):25*j,1);cc3=bb3((25*j-24):25*j,1);
cc1=reshape(cc1,5,5);cc2=reshape(cc2,5,5);cc3=reshape(cc3,5,5);
bc1=bc1+cc1;bc2=bc2+cc2;bc3=bc3+cc3;
end
set(gcf,'position',[100,100,900,300]); 

subplot(1,3,1);subplot('position', [0.04 0.12 0.29 0.74]); 
bar3(bc1);
xlabel('Dosplay CCT');ylabel('Display Duv');zlabel('sccore');
set(gca,'yticklabel',{'-0.010','-0.005','0','+0.005','+0.010'});
set(gca,'xticklabel',{'4000K','5000K','6500K','8000K','10000K'});
title('Oriental result');view(-35,35);

subplot(1,3,2);subplot('position', [0.37 0.12 0.29 0.74]);
bar3(bc2);
xlabel('Dosplay CCT');ylabel('Display Duv');zlabel('sccore');
set(gca,'yticklabel',{'-0.010','-0.005','0','+0.005','+0.010'});
set(gca,'xticklabel',{'4000K','5000K','6500K','8000K','10000K'});
title('South Asian result');view(-35,35);

subplot(1,3,3);subplot('position', [0.70 0.12 0.29 0.74]); 
bar3(bc3);
xlabel('Display CCT');ylabel('Display Duv');zlabel('sccore');
set(gca,'yticklabel',{'-0.010','-0.005','0','+0.005','+0.010'});
set(gca,'xticklabel',{'4000K','5000K','6500K','8000K','10000K'});
title('Caucasian result');view(-35,35);

sgtitle(strcat('All image display CCT & Duv score histogram'));
saveas(gcf,'CCTDuv','png');
