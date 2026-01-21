load Chinese
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[h] = ellipsefig(M(2:3),P,r,1);   % 绘制置信椭圆
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

u0=s(1,1);
u1=s(1,2)+s(2,1);
u2=s(2,2);
u3=s(1,3)+s(3,1);
u4=s(2,3)+s(3,2);
u5=s(3,3);
q=90-0.5*atan(u4/(u5-u2))*180/pi;

plot(compare(1,1),compare(1,2),'s','MarkerSize',8,'MarkerFaceColor',[1,0.5,0],'MarkerEdgeColor',[1,0.5,0]);
plot(compare(2,1),compare(2,2),'s','MarkerSize',8,'MarkerFaceColor',[1,1,0],'MarkerEdgeColor',[1,0.5,0]);
plot(compare(3,1),compare(3,2),'s','MarkerSize',8,'MarkerFaceColor',[1,1,0],'MarkerEdgeColor',[1,0.75,0]);
plot(compare(4,1),compare(4,2),'s','MarkerSize',8,'MarkerFaceColor',[1,1,0],'MarkerEdgeColor',[0,0,0]);
plot(compare(5,1),compare(5,2),'m.','MarkerSize',25);
plot(compare(6,1),compare(6,2),'^','MarkerSize',8,'MarkerFaceColor',[1,0,1],'MarkerEdgeColor',[1,0,1]);
plot(compare(7,1),compare(7,2),'^','MarkerSize',8,'MarkerFaceColor',[1,0.5,0],'MarkerEdgeColor',[1,0.5,0]);
plot(compare(8,1),compare(8,2),'^','MarkerSize',8,'MarkerFaceColor',[0,0,0],'MarkerEdgeColor',[0,0,0]);
plot(compare(9,1),compare(9,2),'^','MarkerSize',8,'MarkerFaceColor',[0,1,0],'MarkerEdgeColor',[0,1,0]);
plot(compare(10,1),compare(10,2),'o','MarkerSize',8,'MarkerEdgeColor',[1,0.5,0]);
plot(compare(11,1),compare(11,2),'m-o','MarkerSize',8);
plot(compare(12,1),compare(12,2),'k-o','MarkerSize',8);
plot(compare(13,1),compare(13,2),'c-o','MarkerSize',8);
plot(compare(14,1),compare(14,2),'d','MarkerSize',8,'MarkerFaceColor',[1,0.5,0],'MarkerEdgeColor',[0,0,0]);
plot(compare(15,1),compare(15,2),'d','MarkerSize',8,'MarkerFaceColor',[1,0,1],'MarkerEdgeColor',[0,0,0]);
plot(compare(16,1),compare(16,2),'d','MarkerSize',8,'MarkerFaceColor',[0,0,0],'MarkerEdgeColor',[0,0,0]);
plot(compare(17,1),compare(17,2),'+','MarkerSize',8,'Color',[0,0,1]);
plot(compare(18,1),compare(18,2),'+','MarkerSize',8,'Color',[1,0,0]);
plot(compare(19,1),compare(19,2),'+','MarkerSize',8,'Color',[0,1,0]);
plot(compare(20,1),compare(20,2),'+','MarkerSize',8,'Color',[1,1,0]);


plot(compare(1,1),compare(1,2),'^','MarkerSize',8,'MarkerFaceColor',[1,0,1],'MarkerEdgeColor',[1,0,1]);
plot(compare(2,1),compare(2,2),'^','MarkerSize',8,'MarkerFaceColor',[1,0.5,0],'MarkerEdgeColor',[1,0.5,0]);
plot(compare(3,1),compare(3,2),'^','MarkerSize',8,'MarkerFaceColor',[0,0,0],'MarkerEdgeColor',[0,0,0]);
plot(compare(4,1),compare(4,2),'^','MarkerSize',8,'MarkerFaceColor',[0,1,0],'MarkerEdgeColor',[0,1,0]);
plot(compare(5,1),compare(5,2),'d','MarkerSize',8,'MarkerFaceColor',[1,0.5,0],'MarkerEdgeColor',[0,0,0]);
plot(compare(6,1),compare(6,2),'d','MarkerSize',8,'MarkerFaceColor',[1,0,1],'MarkerEdgeColor',[0,0,0]);
plot(compare(7,1),compare(7,2),'d','MarkerSize',8,'MarkerFaceColor',[0,0,0],'MarkerEdgeColor',[0,0,0]);
plot(compare(8,1),compare(8,2),'o','MarkerSize',7,'MarkerFaceColor',[0,0,1],'MarkerEdgeColor',[0,0,1]);
plot(compare(9,1),compare(9,2),'o','MarkerSize',7,'MarkerFaceColor',[1,0,0],'MarkerEdgeColor',[1,0,0]);
plot(compare(10,1),compare(10,2),'o','MarkerSize',7,'MarkerFaceColor',[0,1,0],'MarkerEdgeColor',[0,1,0]);
plot(compare(11,1),compare(11,2),'o','MarkerSize',7,'MarkerFaceColor',[0,1,1],'MarkerEdgeColor',[0,1,1]);
