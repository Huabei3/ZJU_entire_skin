ab=score(31:60,2:3);
mab=mean(ab);
X=ab-mab;
[m,n] = size(X);
p = min(m,n);   % 维数
M = mean(X);           % 均值
s = inv(cov(X));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
[h] = ellipsefig(M,s,r,1);   % 绘制置信椭圆
axis equal;
hold on;
for i=1:m
    plot(X(i,1),X(i,2),'.','Color',[0 0 1],'MarkerSize',15);
end
line([-5 5],[0 0],'Color',[0 0 0],'linewidth', 1)
plot([0 0],[-5 5],'Color',[0 0 0],'linewidth', 1);
plot([-5 5],[-5 5],'--','Color',[0 0 0],'linewidth', 1.5)
axis([-5 5 -5 5]);
grid on;
xlabel('Δa*','FontSize',15);
ylabel('Δb*','FontSize',15);
title('中国人女性图像');
