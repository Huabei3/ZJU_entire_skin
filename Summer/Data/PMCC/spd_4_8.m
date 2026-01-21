 load('spddata1.mat');
nam=["大茄子";"小茄子";"洋葱";"火龙果";"提子";"葡萄";"蓝莓";"西红柿";"紫甘蓝";"红辣椒";"红色太空椒";"胡萝卜";"橙子";"黄色太空椒";"香蕉";"柠檬";"青苹果";"黄瓜皮";"花菜";"青菜叶";"黄瓜片";"奇异果肉";"百事可乐";"红苹果";"油桃";"紫色菊花";"绣球花";"桔梗花";"粉紫色玫瑰";"飞燕草";"玫瑰花叶子";"绣球花叶子";"桔梗叶子"];
for i=27:33
   b=reshape(a(:,i),40,43);
    c=mean(b')';
    b=[b,c];
%=============================== plot =====================================
set(gcf,'position',[100 10 230 600])
%============================== a*b* ======================================
subplot(3,1,1); 
set(gca,'position',[0.15 0.65 0.7 0.3])
    scatter(b(2,1:43),b(3,1:43),25,'o'); hold on;
    scatter(mean(b(2,:)),mean(b(3,:)),125,'o','filled');
    amin=floor(min(b(2,1:43)))-5;amax=ceil(max(b(2,1:43)))+5;
    bmin=floor(min(b(3,1:43)))-5;bmax=ceil(max(b(3,1:43)))+5;
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
    bb=sqrt(b(2,:).^2+b(3,:).^2);
    scatter(bb(1,:),b(1,:),25,'o'); hold on;
    scatter(bb(1,44),b(1,44),125,'o','filled');
    cmin=floor(min(bb(1,:)))-5;cmax=ceil(max(bb(1,:)))+5;
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
    plot(d(3:33,1)',b(6:36,j)','b-');hold on;
    end
    plot(d(3:33,1)',b(6:36,44)','r-','linewidth',3);

axis([400 700 0 1]);hold on
% title('Spectral power distribution plot ','FontSize',15);
set(gca,'XTick',[400:40:700]);%设置要显示坐标刻度
set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
grid on;
xlabel('wavelength(nm)','FontName','Times New Roman','FontSize',15);
ylabel('reflectance','FontName','Times New Roman','FontSize',15);
%=============================== title ====================================
sgtitle(nam(i,:));

saveas(gcf,strcat('./spdall',num2str(i),'.jpg'));
% close all ;
end

