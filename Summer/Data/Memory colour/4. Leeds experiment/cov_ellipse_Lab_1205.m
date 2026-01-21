 clear all
load('cov_choice_1205.mat');
fig=figure();
set(fig,'Position', [100 100 600 600]);
for j=23:24
%=================CHN-ZJU=============================
for i=1:62
    score(i,:)=sum(b(:,j*3-2:j*3).*a(j*49-48:j*49,i))./sum(a(j*49-48:j*49,i));
end
for i=1:42
    score(i+62,:)=sum(b1(:,j*3-2:j*3).*aa(j*48-47:j*48,i))./sum(aa(j*48-47:j*48,i));
end
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[h] = cov_fig_1202(M(2:3),P,r,1,6);   % 绘制置信椭圆
axis equal;hold on;
plot(M(2),M(3),'k^','MarkerSize',8,'MarkerFace',[0.4 0.4 0.4]);
C=sqrt(M(3)^2+M(2)^2);
h=atan(M(3)/M(2))*180/pi;
text(M(2)+3,M(3),num2str(j));
end
%=======================plot==================================
axis([-100 100 -100 100]);hold on;grid on;
set(gca,'XTick',[-100:20:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:20:120]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title('Memory results on CIELAB a*b*');
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
