load('allchoice.mat');
a1=reshape(a1,400,9); 
a2=reshape(a2,400,9); 
a3=reshape(a3,400,9);
b1=a1(1:200,:)+a1(201:400,:);
b2=a2(1:200,:)+a2(201:400,:);
b3=a3(1:200,:)+a3(201:400,:);
for i=1:40 
    c1(i,:)=sum(b1((5.*i-4):5.*i,:));
    c2(i,:)=sum(b2((5.*i-4):5.*i,:));
    c3(i,:)=sum(b3((5.*i-4):5.*i,:));
end

for j=1:8
set(gcf,'position',[100,100,1200,300]);    
subplot(1,3,1);rimg=bar3(c1((5*j-4):5*j,:));
xlabel('Ambient CCT');ylabel('Display CCT');zlabel('sccore');
set(gca,'xticklabel',{'3000 high','4000 high','5000 high','6500 high','3000 low','4000 low','5000 low', '6500 low','dark'});
set(gca,'yticklabel',{'4000K','5000K','6500K','8000K','10000K'});
title('Chinese result');
view(125,35);

subplot(1,3,2);rimg=bar3(c2((5*j-4):5*j,:));
xlabel('Ambient CCT');ylabel('Display CCT');zlabel('sccore');
set(gca,'xticklabel',{'3000 high','4000 high','5000 high','6500 high','3000 low','4000 low','5000 low', '6500 low','dark'});
set(gca,'yticklabel',{'4000K','5000K','6500K','8000K','10000K'});
title('South Asian result');
view(125,35);

subplot(1,3,3);rimg=bar3(c3((5*j-4):5*j,:));
xlabel('Ambient CCT');ylabel('Display CCT');zlabel('sccore');
set(gca,'xticklabel',{'3000 high','4000 high','5000 high','6500 high','3000 low','4000 low','5000 low', '6500 low','dark'});
set(gca,'yticklabel',{'4000K','5000K','6500K','8000K','10000K'});
title('Caucasian result');
view(125,35);

sgtitle(strcat('Image. ',num2str(j),' preferred score histogram'));
saveas(gcf,[int2str(j)],'png');
end