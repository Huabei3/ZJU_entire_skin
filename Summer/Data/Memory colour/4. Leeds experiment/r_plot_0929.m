% a1~a5: CH_leeds, CH_ZJU, UK, PK, AF
fig=figure();
set(fig,'Position', [100 100 800 800]);

subplot(5,5,1);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a1p,a1p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a1p,a1p);
r1=round(r(1,2),3);
title(strcat('r=',num2str(r1)));

subplot(5,5,2);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a1p,a2p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a1p,a2p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,3);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a1p,a3p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a1p,a3p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,4);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a1p,a4p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度度
r=corrcoef(a1p,a4p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,5);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a1p,a5p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a1p,a5p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,6);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a2p,a1p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度度
r=corrcoef(a2p,a1p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,7);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a2p,a2p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a2p,a2p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,8);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a2p,a3p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a2p,a3p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,9);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a2p,a4p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a2p,a4p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,10);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a2p,a5p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a2p,a5p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,11);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a3p,a1p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a3p,a1p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,12);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a3p,a2p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a3p,a2p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,13);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a3p,a3p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a3p,a3p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,14);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a3p,a4p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a3p,a4p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,15);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a3p,a5p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a3p,a5p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,16);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a4p,a1p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a4p,a1p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,17);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a4p,a2p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a4p,a2p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,18);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a4p,a3p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a4p,a3p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,19);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a4p,a4p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a4p,a4p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,20);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a4p,a5p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a4p,a5p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,21);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a5p,a1p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a5p,a1p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,22);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a5p,a2p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a5p,a2p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,23);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a5p,a3p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a5p,a3p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,24);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a5p,a4p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(a5p,a4p);
title(strcat('r=',num2str(r(1,2))));

subplot(5,5,25);
axis equal;grid on;
hold on
axis([0 100 0 100]);
scatter(a5p,a5p,3);
% set(gca,'XTick',[0:0.2:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.2:1]);%设置要显示坐标刻度
set(gca,'XTick',[0:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:20:100]);%设置要显示坐标刻度
r=corrcoef(ap,ap);
title(strcat('r=',num2str(r(1,2))));
