fig=figure();
set(fig,'Position', [100 100 400 400]);
hold on

[J,Q,C,M,S,h,H]= CAM16_frwd(a,c,34,100,'dark');
[J1,Q1,C1,M1,S1,h1,H1]= CAM16_frwd(b,c,34,100,'dark');

axis([0 50 200 400]);
for i=1:16
plot(M(1,i),Q(1,i),'o','color',[0.1 0.1 0.8],'MarkerFaceColor',[0.1 0.1 0.8]);
plot(M1(1,i),Q1(1,i),'^','color',[0 0.6 0],'MarkerFaceColor',[0 0.6 0]);
text(M1(1,i),Q1(1,i),num2str(i),'fontsize',10);
plot([M(1,i),M1(1,i)],([Q(1,i),Q1(1,i)]),'k');
end
set(gca,'XTick',[0:5:50]);%设置要显示坐标刻度
set(gca,'YTick',[200:20:400]);%设置要显示坐标刻度
grid on

