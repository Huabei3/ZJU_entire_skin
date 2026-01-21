load Chinese
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[h] = ellipsefig(M(2:3),P,r,1); % 绘制置信椭圆
axis equal;
hold on;
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(M(2),M(3),'y.','MarkerSize',20);
C=sqrt(M(3)^2+M(2)^2);
h=atan(M(3)/M(2))*180/pi;
for i=1:30
    plot(score(i,2),score(i,3),'g.','MarkerSize',20);
end
hold off;