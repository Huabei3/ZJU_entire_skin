 load('ellipseresult.mat');
color=[220,0,10;220,150,10;0,220,10;0,10,220;
       220,0,10;220,150,10;0,220,10;0,10,220;
       220,0,10;220,150,10;0,220,10;0,10,220;
       220,0,10;220,150,10;0,220,10;0,10,220];
obj1=["o","o","o","o","o","o","o","o",
      "^","^","^","^", "^","^","^","^"];
fig1 = figure();
set(fig1,'Position',[100 100 900 500]);

subplot(1,3,1);
for il=1:8
    score1=aaa1(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = mean(score1);           % 均值
s = inv(cov(score1));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
[h] = ellipsefig0306(M,s,r,1,il); % 绘制置信椭圆
axis([0 3 -3 3]);hold on;grid on;
 set(gca,'XTick',[0:0.5:3]);%设置要显示坐标刻度
 set(gca,'YTick',[-3:0.5:3]);%设置要显示坐标刻度
xlabel('a,','FontSize',15);
ylabel('b,','FontSize',15);
%  plot(M(1),M(2),obj1(il),'Color',color(il-11+ii*11,:)./255,'MarkerFaceColor',color(il-11+ii*11,:)./255,'MarkerSize',5);
end
for il=1:8
    score1=aaa1(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = mean(score1);           % 均值
 plot(M(1),M(2),obj1(il),'Color',color(il,:)./255,'MarkerFaceColor',color(il,:)./255,'MarkerSize',5);
end
title('Oriental results');
legend({'3000 h','4000 h','5000 h','6500 h','3000 l','4000 l','5000 l', '6500 l'});

subplot(1,3,2);
for il=1:8
    score1=aaa2(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = mean(score1);           % 均值
s = inv(cov(score1));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
[h] = ellipsefig0306(M,s,r,1,il); % 绘制置信椭圆
axis([0 3 -3 3]);hold on;grid on;
 set(gca,'XTick',[0:0.5:3]);%设置要显示坐标刻度
 set(gca,'YTick',[-3:0.5:3]);%设置要显示坐标刻度
xlabel('a,','FontSize',15);
ylabel('b,','FontSize',15);
%  plot(M(1),M(2),obj1(il),'Color',color(il-11+ii*11,:)./255,'MarkerFaceColor',color(il-11+ii*11,:)./255,'MarkerSize',5);
end
for il=1:8
    score1=aaa2(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = mean(score1);           % 均值
 plot(M(1),M(2),obj1(il),'Color',color(il,:)./255,'MarkerFaceColor',color(il,:)./255,'MarkerSize',5);
end
title('SouthAsian results');
legend({'3000 h','4000 h','5000 h','6500 h','3000 l','4000 l','5000 l', '6500 l'});

subplot(1,3,3);
for il=1:8
    score1=aaa3(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = mean(score1);           % 均值
s = inv(cov(score1));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
[h] = ellipsefig0306(M,s,r,1,il); % 绘制置信椭圆
axis([0 3 -3 3]);hold on;grid on;
 set(gca,'XTick',[0:0.5:3]);%设置要显示坐标刻度
 set(gca,'YTick',[-3:0.5:3]);%设置要显示坐标刻度
xlabel('a,','FontSize',15);
ylabel('b,','FontSize',15);
%  plot(M(1),M(2),obj1(il),'Color',color(il-11+ii*11,:)./255,'MarkerFaceColor',color(il-11+ii*11,:)./255,'MarkerSize',5);
end
for il=1:8
    score1=aaa3(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = mean(score1);           % 均值
 plot(M(1),M(2),obj1(il),'Color',color(il,:)./255,'MarkerFaceColor',color(il,:)./255,'MarkerSize',5);
end
title('Caucasian results');
legend({'3000 h','4000 h','5000 h','6500 h','3000 l','4000 l','5000 l', '6500 l'});


sgtitle('CAM16UCS  J,a,b, result under 8 lightings');
saveas(gcf,'Image 1 Jab','png');