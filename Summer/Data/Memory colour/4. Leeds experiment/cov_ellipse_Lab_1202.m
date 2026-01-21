 clear all
load('cov_choice_1202.mat');
fig=figure();
set(fig,'Position', [100 100 600 600]);

%=================CHN-Leeds=============================
for i=1:21
    score(i,:)=sum(b(:,7:9).*aLeeds(99:147,i))./sum(aLeeds(99:147,i));
     plot(score(i,2),score(i,3),'.','color',[0.8 0.4 0],'MarkerSize',15);hold on;
end
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[h] = cov_fig_1202(M(2:3),P,r,1,1);   % 绘制置信椭圆
axis equal;hold on;
plot(M(2),M(3),'k^','MarkerSize',8,'MarkerFace',[0.8 0.4 0]);
C=sqrt(M(3)^2+M(2)^2);
h=atan(M(3)/M(2))*180/pi;
% =================CHN-UK=============================
for i=1:21
    score(i,:)=sum(b(:,7:9).*aUK(99:147,i))./sum(aUK(99:147,i));
     plot(score(i,2),score(i,3),'.','color',[0.8 0 0],'MarkerSize',15);hold on;
end
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[h] = cov_fig_1202(M(2:3),P,r,1,2);   % 绘制置信椭圆
axis equal;hold on;
plot(M(2),M(3),'k^','MarkerSize',8,'MarkerFace',[0.8 0 0]);
C=sqrt(M(3)^2+M(2)^2);
h=atan(M(3)/M(2))*180/pi;
%=================CHN-ZJU=============================
for i=1:9
    score(i,:)=sum(b(:,7:9).*aZJU(99:147,i))./sum(aZJU(99:147,i));
     plot(score(i,2),score(i,3),'.','color',[0.8 0.8 0],'MarkerSize',15);hold on;
end
for i=1:11
    score(i+9,:)=sum(b1(:,7:9).*aZJU1(97:144,i))./sum(aZJU1(97:144,i));
     plot(score(i+9,2),score(i+9,3),'.','color',[0.8 0.8 0],'MarkerSize',15);hold on;
end
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[h] = cov_fig_1202(M(2:3),P,r,1,3);   % 绘制置信椭圆
axis equal;hold on;
plot(M(2),M(3),'k^','MarkerSize',8,'MarkerFace',[0.8 0.8 0]);
C=sqrt(M(3)^2+M(2)^2);
h=atan(M(3)/M(2))*180/pi;
%=================CHN-PK=============================
for i=1:31
    score(i,:)=sum(b1(:,7:9).*aPK(97:144,i))./sum(aPK(97:144,i));
     plot(score(i,2),score(i,3),'.','color',[0.1 0.8 0],'MarkerSize',15);hold on;
end
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[h] = cov_fig_1202(M(2:3),P,r,1,4);   % 绘制置信椭圆
axis equal;hold on;
plot(M(2),M(3),'k^','MarkerSize',8,'MarkerFace',[0.1 0.8 0]);
C=sqrt(M(3)^2+M(2)^2);
h=atan(M(3)/M(2))*180/pi;
% %=================CHN-AF=============================
for i=1:11
    score(i,:)=sum(b(:,7:9).*aAF(99:147,i))./sum(aAF(99:147,i));
     plot(score(i,2),score(i,3),'.','color',[0 0.3 0.8],'MarkerSize',15);hold on;
end
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[h] = cov_fig_1202(M(2:3),P,r,1,5);   % 绘制置信椭圆
axis equal;hold on;
plot(M(2),M(3),'k^','MarkerSize',8,'MarkerFace',[0 0.3 0.8]);
C=sqrt(M(3)^2+M(2)^2);
h=atan(M(3)/M(2))*180/pi;
%=======================plot==================================
axis([-4 10 74 88]);hold on;grid on;
set(gca,'XTick',[-100:2:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:2:120]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title('Memory results on CIELAB a*b*');
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
