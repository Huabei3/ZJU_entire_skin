clear all
load('data0621.mat');
color=[255,0,0;255,162,0;225,225,0;146,208,80;91,155,213]./255;
for ob=1:28
    for ol=1:5
        c=reshape(a(:,ob),100,5);
    d1(ob,(ol*3-2):ol*3)=sum(b(1:25,:).*c(1:25,ol))./sum(c(1:25,ol)~=0,1);
    d2(ob,(ol*3-2):ol*3)=sum(b(26:50,:).*c(26:50,ol))./sum(c(26:50,ol)~=0,1);
    d3(ob,(ol*3-2):ol*3)=sum(b(51:75,:).*c(51:75,ol))./sum(c(51:75,ol)~=0,1);
    d4(ob,(ol*3-2):ol*3)=sum(b(76:100,:).*c(76:100,ol))./sum(c(76:100,ol)~=0,1);
    end
end
d1(11,:)=d1(12,:);d1(19,:)=d1(20,:);
e1=reshape(mean(d1)',3,5)';e1(:,3)=e1(:,3)+2;
e2=reshape(mean(d2)',3,5)';e2(:,3)=e2(:,3)+2;
e3=reshape(mean(d3)',3,5)';e3(:,3)=e3(:,3)+2;
e4=reshape(mean(d4)',3,5)';e4(:,3)=e4(:,3)+2;
e=[e1;e2;e3;e4];


%=============================画椭圆===================================
subplot(2,2,1);
subplot('position', [0.1 0.55 0.35 0.35]); 
for il=1:5
score1=d1(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = e1(il,2:3);           % 均值
s = inv(cov(score1));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
[h,V,ab1(il,1),ab1(il,2)] = ellipsefig0621(M,s,r,1,il); % 绘制置信椭圆
ab1(il,3)=atan(V(1,1)./V(1,2))./pi.*180;
axis([0 30 0 30]);hold on;grid on;
 set(gca,'XTick',[0:5:30]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:30]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(M(1),M(2),'o','Color',color(il,:),'MarkerFaceColor',color(il,:),'MarkerSize',8);
end
title('Aferican results');

%=============================画椭圆===================================
subplot(2,2,2);
subplot('position', [0.6 0.55 0.35 0.35]); 
for il=1:5
score2=d2(:,(3*il-1):(3*il));
[m,n] = size(score2);
p = min(m,n);   % 维数
M = e2(il,2:3);           % 均值
s = inv(cov(score2));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
[h,V,ab1(il,1),ab1(il,2)] = ellipsefig0621(M,s,r,1,il); % 绘制置信椭圆
ab1(il,3)=atan(V(1,1)./V(1,2))./pi.*180;
axis([0 30 0 30]);hold on;grid on;
 set(gca,'XTick',[0:5:30]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:30]);%设置要显示坐标刻度xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(M(1),M(2),'o','Color',color(il,:),'MarkerFaceColor',color(il,:),'MarkerSize',8);
end
title('Caucasian results');

%=============================画椭圆===================================
subplot(2,2,3);
subplot('position', [0.1 0.1 0.35 0.35]); 
for il=1:5
score3=d3(:,(3*il-1):(3*il));
[m,n] = size(score3);
p = min(m,n);   % 维数
M = e3(il,2:3);           % 均值
s = inv(cov(score3));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
[h,V,ab1(il,1),ab1(il,2)] = ellipsefig0621(M,s,r,1,il); % 绘制置信椭圆
ab1(il,3)=atan(V(1,1)./V(1,2))./pi.*180;
axis([0 30 0 30]);hold on;grid on;
 set(gca,'XTick',[0:5:30]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:30]);%设置要显示坐标刻度xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(M(1),M(2),'o','Color',color(il,:),'MarkerFaceColor',color(il,:),'MarkerSize',8);
end
title('Oriental results');

%=============================画椭圆===================================
subplot(2,2,4);
subplot('position', [0.6 0.1 0.35 0.35]); 
for il=1:5
score4=d4(:,(3*il-1):(3*il));
[m,n] = size(score4);
p = min(m,n);   % 维数
M = e4(il,2:3);           % 均值
s = inv(cov(score4));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
[h,V,ab1(il,1),ab1(il,2)] = ellipsefig0621(M,s,r,1,il); % 绘制置信椭圆
ab1(il,3)=atan(V(1,1)./V(1,2))./pi.*180;
axis([0 30 0 30]);hold on;grid on;
 set(gca,'XTick',[0:5:30]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:30]);%设置要显示坐标刻度xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(M(1),M(2),'o','Color',color(il,:),'MarkerFaceColor',color(il,:),'MarkerSize',8);
end
title('South Asian results');

sgtitle('Preferred skin color centers on CIELB (display white)');