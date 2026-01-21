 load('spd24data.mat');

for i=1:24
    plot(d(1:31,1)',a(1:31,i)','linewidth',1);hold on;
end

axis([400 700 0 1]);hold on
legend('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24');
title(strcat('Spectral power distribution plot of 24 MCCC'),'FontSize',15);
set(gca,'XTick',[400:30:700]);%设置要显示坐标刻度
set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
grid on;
xlabel('wavelength(nm)','FontName','Times New Roman','FontSize',15);
ylabel('reflectance','FontName','Times New Roman','FontSize',15);
% saveas(gcf,strcat('./spd',num2str(i),'.jpg'));
% close all;