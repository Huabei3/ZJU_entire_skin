load('spddata.mat');
nam=["大茄子";"小茄子";"洋葱";"火龙果";"提子";"葡萄";"蓝莓";"西红柿";"紫甘蓝";"红辣椒";"红色太空椒";"胡萝卜";"橙子";"黄色太空椒";"香蕉";"柠檬";"青苹果";"黄瓜皮";"花菜";"青菜叶";"黄瓜片";"奇异果";"百事可乐";"苹果1";"苹果2";"苹果3";"油桃"];
for i=1:27
    b=reshape(a(:,i),40,43);
    c=mean(b')';
    b=[b,c];
    d=tan(b(3,:).*pi./180);
    e=sqrt(b(2,:).^2./(1+d.^2));
    f=abs(e.*d);
    
    for j=1:44
    if b(3,j)>270
        f(j)=-f(j);  
    else if b(3,j)>180
        e(j)=-e(j);f(j)=-f(j);    
    else if b(3,j)>90
        e(j)=-e(j); 
    end
    end
    end
    end
    scatter(e(1,:),f(1,:),25,'o'); hold on;
    scatter(e(1,44),f(1,44),125,'o','filled');
    amin=floor(min(e(1,:)))-5;amax=ceil(max(e(1,:)))+5;
    bmin=floor(min(f(1,:)))-5;bmax=ceil(max(f(1,:)))+5;
    axis equal; axis on;
axis([amin amax bmin bmax]);hold on
y1=-100:0.1:100;x1=0*y1;plot(x1,y1,'k');
x2=-100:0.1:100;y2=0*x2;plot(x2,y2,'k');
title(strcat('Plot on CIELAB (a*b*) - ',nam(i,:)),'FontSize',15);
set(gca,'XTick',[-100:2:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:2:100]);%设置要显示坐标刻度
grid on; 
xlabel('a*','FontName','Times New Roman','FontSize',15);
ylabel('b*','FontName','Times New Roman','FontSize',15);
saveas(gcf,strcat('./spdab',num2str(i),'.jpg'));
close all;
end

