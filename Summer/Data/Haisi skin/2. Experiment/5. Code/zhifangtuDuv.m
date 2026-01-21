load('choicedata.mat');
for i=1:5
bb1(i,:)=b1(i,:)+b1((i+5),:)+b1((i+10),:)+b1((i+15),:)+b1((i+20),:);
bb2(i,:)=b1(i,:)+b1((i+5),:)+b1((i+10),:)+b1((i+15),:)+b1((i+20),:);
bb3(i,:)=b1(i,:)+b1((i+5),:)+b1((i+10),:)+b1((i+15),:)+b1((i+20),:);
end

for j=1:8
for i=1:5
cc1(i,:)=b1((i+j*25-25),:)+b1((i+j*25-20),:)+b1((i+j*25-15),:)+b1((i+j*25-10),:)+b1((i+j*25-5),:);
cc2(i,:)=b2((i+j*25-25),:)+b2((i+j*25-20),:)+b2((i+j*25-15),:)+b2((i+j*25-10),:)+b2((i+j*25-5),:);
cc3(i,:)=b3((i+j*25-25),:)+b3((i+j*25-20),:)+b3((i+j*25-15),:)+b3((i+j*25-10),:)+b3((i+j*25-5),:);
end


set(gcf,'position',[100,100,900,300]); 

subplot(1,3,1);subplot('position', [0.04 0.12 0.29 0.74]); 
bar3(cc1);
xlabel('Ambient CCT');ylabel('Display Duv');zlabel('sccore');
set(gca,'yticklabel',{'-0.010','-0.005','0','+0.005','+0.010'});
set(gca,'xticklabel',{'3000 high','4000 high','5000 high','6500 high','3000 low','4000 low','5000 low', '6500 low','dark'});
title('Oriental result');view(60,45);

subplot(1,3,2);subplot('position', [0.37 0.12 0.29 0.74]);
bar3(cc2);
xlabel('Ambient CCT');ylabel('Display Duv');zlabel('sccore');
set(gca,'yticklabel',{'-0.010','-0.005','0','+0.005','+0.010'});
set(gca,'xticklabel',{'3000 high','4000 high','5000 high','6500 high','3000 low','4000 low','5000 low', '6500 low','dark'});
title('South Asian result');view(60,45);

subplot(1,3,3);subplot('position', [0.70 0.12 0.29 0.74]); 
bar3(cc3);
xlabel('Ambient CCT');ylabel('Display Duv');zlabel('sccore');
set(gca,'yticklabel',{'-0.010','-0.005','0','+0.005','+0.010'});
set(gca,'xticklabel',{'3000 high','4000 high','5000 high','6500 high','3000 low','4000 low','5000 low', '6500 low','dark'});
title('Caucasian result');view(60,45);

sgtitle(strcat('Image. ',num2str(j),' display Duv & Ambient CCT score histogram'));
saveas(gcf,strcat('Duv',num2str(j)),'png');
end