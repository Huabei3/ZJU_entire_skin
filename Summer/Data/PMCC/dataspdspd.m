load('spddata.mat');
nam=["大茄子";"小茄子";"洋葱";"火龙果";"提子";"葡萄";"蓝莓";"西红柿";"紫甘蓝";"红辣椒";"红色太空椒";"胡萝卜";"橙子";"黄色太空椒";"香蕉";"柠檬";"青苹果";"黄瓜皮";"花菜";"青菜叶";"黄瓜片";"奇异果";"百事可乐";"苹果1";"苹果2";"苹果3";"油桃"];
for i=13
    b=reshape(a(:,i),40,43);
    c=mean(b')';
    b=[b,c];
    e=sqrt(b(2,:).^2+b(3,:).^2);
    for j=1:43
    plot(d(1:36,1)',b(4:39,j)','b-');hold on;
    end
    plot(d(1:36,1)',b(4:39,44)','r-','linewidth',3);

axis([350 750 0 1]);hold on
% title(strcat('Spectral power distribution plot - ',nam(i,:)),'FontSize',15);
set(gca,'XTick',[350:40:750]);%设置要显示坐标刻度
set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
grid on;
xlabel('wavelength(nm)','FontName','Times New Roman','FontSize',15);
ylabel('reflectance','FontName','Times New Roman','FontSize',15);
% saveas(gcf,strcat('./spd',num2str(i),'.jpg'));
% close all;
end

