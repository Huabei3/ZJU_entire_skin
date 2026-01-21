color=[255,0,0;255,162,0;225,225,0;146,208,80;91,155,213]./255;
for i=1:5 
    scatter(a(i),b(i),80,color(i,:),'filled');hold on;
end
j=2500:100:11500
j1=0.5652*(1-1072./j);
j2=0.723*(1-1116./j);
    plot(j,j1);plot(j,j2);
axis([2000 12000 0.3 0.7]);hold on;grid on;
 set(gca,'XTick',[2000:1000:12000]);%设置要显示坐标刻度
 set(gca,'YTick',[0.3:0.05:0.7]);%设置要显示坐标刻度
xlabel('Ambient CCT','FontSize',15);
ylabel('D value','FontSize',15);