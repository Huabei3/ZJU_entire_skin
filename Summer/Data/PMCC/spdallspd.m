 load('spddata1.mat');
nam=["大茄子";"小茄子";"洋葱";"火龙果";"提子";"葡萄";"蓝莓";"西红柿";"紫甘蓝";"红辣椒";"红色太空椒";"胡萝卜";"橙子";"黄色太空椒";"香蕉";"柠檬";"青苹果";"黄瓜皮";"花菜";"青菜叶";"黄瓜片";"奇异果";"百事可乐";"苹果1";"苹果2";"苹果3";"油桃"];
for i=1:33
    b=reshape(a(:,i),40,43);
    c=mean(b')';
    cc(:,i)=c;
    b=[b,c];
    e=sqrt(b(2,:).^2+b(3,:).^2);
    plot(d(3:33,1)',b(6:36,44)','linewidth',1);hold on;
end

axis([400 700 0 1]);hold on
legend('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33');
title(strcat('Spectral power distribution plot of memory colors'),'FontSize',15);
set(gca,'XTick',[400:30:700]);%设置要显示坐标刻度
set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
grid on;
xlabel('wavelength(nm)','FontName','Times New Roman','FontSize',15);
ylabel('reflectance','FontName','Times New Roman','FontSize',15);
% saveas(gcf,strcat('./spd',num2str(i),'.jpg'));
% close all;