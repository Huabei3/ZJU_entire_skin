load('spddata1.mat');
nam=["大茄子";"小茄子";"洋葱";"火龙果";"提子";"葡萄";"蓝莓";"西红柿";"紫甘蓝";"红辣椒";"红色太空椒";"胡萝卜";"橙子";"黄色太空椒";"香蕉";"柠檬";"青苹果";"黄瓜皮";"花菜";"青菜叶";"黄瓜片";"奇异果";"百事可乐";"苹果1";"苹果2";"苹果3";"油桃"];
for i=1:25
    b=reshape(a(:,i),40,43);
    c=mean(b')';
    b=[b,c];     
    scatter(b(2,:),b(1,:)',25,'o'); hold on;
    scatter(b(2,44),b(1,44),25,'o','k','filled');hold on;
    text(b(2,44)+1,b(1,44),num2str(i),'FontWeight','Bold');
end
for i=26:33
    b=reshape(a(:,i),40,43);
    c=mean(b')';
    b=[b,c]; 
    bb=sqrt(b(2,:).^2+b(3,:).^2);
    scatter(bb(1,:),b(1,:),25,'o'); hold on;
    scatter(bb(1,44),b(1,44),25,'o','k','filled');hold on;
    text(bb(1,44)+1,b(1,44),num2str(i),'FontWeight','Bold');
end
for i=1:24
  scatter(g(i,4),g(i,1),25,'o','r','filled');hold on;  
  text(g(i,4)+1,g(i,1),num2str(i),'Color','red');
end
% for i=1:8
%   scatter(h(i,4),h(i,1),25,'o','k','filled');hold on;  
%   text(h(i,4)+1,h(i,1),num2str(i+25));
% end
axis equal; axis on;
axis([0 100 0 100]);hold on
y1=-100:0.1:100;x1=0*y1;plot(x1,y1,'k');
x2=-100:0.1:100;y2=0*x2;plot(x2,y2,'k');
title('Plot on CIELAB (C*L*)','FontSize',15);
set(gca,'XTick',[0:10:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:10:100]);%设置要显示坐标刻度
grid on; 
xlabel('C*','FontName','Times New Roman','FontSize',15);
ylabel('L*','FontName','Times New Roman','FontSize',15);