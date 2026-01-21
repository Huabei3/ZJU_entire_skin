cct=2000:1:9000;
D1=ones(1,7001);
D2(1,1:7001)=(1-1./3.6.*exp((-314.7-42)./92));
D3=0.723.*(1-1116./cct);
D4=0.726.*(1-2179./cct);
D5=zeros(1,7001);
D6=0.239.*0.723.*(1-1116./cct);
D7=0.2914.*(1-2084./cct);
plot(cct,D1,'LineWidth',3);hold on;plot(cct,D2,'LineWidth',3);hold on;
plot(cct,D3,'LineWidth',3);hold on;plot(cct,D4,'LineWidth',3);hold on;
plot(cct,D5,'LineWidth',3);hold on;plot(cct,D6,'LineWidth',3);hold on;
plot(cct,D7,'LineWidth',3);hold on;grid on;
axis([2000 9000 -0.2 1.2]);hold on;grid on;
set(gca,'XTick',[2000:1000:9000]);%设置要显示坐标刻度
set(gca,'YTick',[-0.2:0.2:1.2]);%设置要显示坐标刻度
xlabel('CCT','FontSize',15);
ylabel('D','FontSize',15);
legend('D1：1','D2：CAT02','D3：Zhai','D4：Peng','D5：0','D6：coefficient','D7：Optimal');