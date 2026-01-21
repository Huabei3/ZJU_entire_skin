load('spddata1.mat');
nam=["大茄子";"小茄子";"洋葱";"火龙果";"提子";"葡萄";"蓝莓";"西红柿";"紫甘蓝";"红辣椒";"红色太空椒";"胡萝卜";"橙子";"黄色太空椒";"香蕉";"柠檬";"青苹果";"黄瓜皮";"花菜";"青菜叶";"黄瓜片";"奇异果肉";"百事可乐";"红苹果";"油桃"];
for i=4
    b=reshape(a(:,i),40,43);
    c=mean(b')';
    b=[b,c];
%=============================== plot =====================================
set(gcf,'position',[100 10 230 600])
%============================== a*b* ======================================
subplot(3,1,1); 
set(gca,'position',[0.15 0.65 0.7 0.3])
    dd=tan(b(3,:).*pi./180);
    e=sqrt(b(2,:).^2./(1+dd.^2));
    f=abs(e.*dd);
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
    scatter(mean(e(1,:)),mean(f(1,:)),125,'o','filled');
    amin=floor(min(e(1,:)))-5;amax=ceil(max(e(1,:)))+5;
    bmin=floor(min(f(1,:)))-5;bmax=ceil(max(f(1,:)))+5;
axis equal; axis on;
axis([amin amax bmin bmax]);hold on
y1=-100:0.1:100;x1=0*y1;plot(x1,y1,'k');
x2=-100:0.1:100;y2=0*x2;plot(x2,y2,'k');
% title('Plot on CIELAB (a*b*) - ','FontSize',15);
set(gca,'XTick',[-100:5:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:5:100]);%设置要显示坐标刻度
grid on; 
xlabel('a*','FontName','Times New Roman','FontSize',15);
ylabel('b*','FontName','Times New Roman','FontSize',15);
%============================== c*l* ======================================
subplot(3,1,2);
set(gca,'position',[0.15 0.33 0.7 0.28])
scatter(b(2,:),b(1,:)',25,'o'); hold on;
    scatter(b(2,44),b(1,44),125,'o','filled');
    cmin=floor(min(b(2,:)))-5;cmax=ceil(max(b(2,:)))+5;
    lmin=floor(min(b(1,:)))-5;lmax=ceil(max(b(1,:)))+5;
axis equal;
axis([cmin cmax lmin lmax]);hold on
y1=-100:0.1:100;x1=0*y1;plot(x1,y1,'k');
x2=-100:0.1:100;y2=0*x2;plot(x2,y2,'k');
% title('Plot on CIELAB (C*L*) - ','FontSize',15);
set(gca,'XTick',[-100:5:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:5:100]);%设置要显示坐标刻度
grid on; 
xlabel('C*','FontName','Times New Roman','FontSize',15);
ylabel('L*','FontName','Times New Roman','FontSize',15);
%=============================== spd ======================================
subplot(3,1,3);
set(gca,'position',[0.15 0.07 0.7 0.2])
for j=1:43
    plot(d(1:36,1)',b(4:39,j)','b-');hold on;
    end
    plot(d(1:36,1)',b(4:39,44)','r-','linewidth',3);

axis([350 750 0 0.7]);hold on
% title('Spectral power distribution plot ','FontSize',15);
set(gca,'XTick',[350:40:750]);%设置要显示坐标刻度
set(gca,'YTick',[0:0.1:0.7]);%设置要显示坐标刻度
grid on;
xlabel('wavelength(nm)','FontName','Times New Roman','FontSize',15);
ylabel('reflectance','FontName','Times New Roman','FontSize',15);
%=============================== title ====================================
sgtitle(nam(i,:));

saveas(gcf,strcat('./spdall',num2str(i),'.jpg'));
% close all ;
end

