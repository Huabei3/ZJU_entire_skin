load('spddata.mat');
fig=figure();
set(fig,'Position', [100 100 700 230]);
for i=13
    b=reshape(a(:,i),40,43);
    c=mean(b')';
    b=[b,c];
    e=sqrt(b(2,:).^2+b(3,:).^2);
    for j=1:43
    plot(d(1:36,1)',b(4:39,j)','color',[0.7,0.7,0.7]);hold on;
    end
    plot(d(1:36,1)',b(4:39,44)','k:','linewidth',3);

axis([380 720 0 1]);hold on
set(gca,'XTick',[380:20:720]);%设置要显示坐标刻度
set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
grid on;
xlabel('wavelength(nm)','FontName','Times New Roman','FontSize',15);
ylabel('reflectance','FontName','Times New Roman','FontSize',15);

end