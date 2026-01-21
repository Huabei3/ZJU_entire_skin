clear all
load('data0621-3.mat');
color=[255,0,0;255,162,0;225,225,0;146,208,80;91,155,213]./255;
D=[0.454 0.521 0.562 0.599 0.622]/5;
for ob=1:28
    for ol=1:5
    c=reshape(a(:,ob),100,5);
    xyz=lab2xyz(b,'user',[433.8 475.0 566.4]);
    f2=ciecat02_d(xyz,f1(ol,:)./f1(ol,2).*475,[94.813 100.000 107.262],'CAT16',100,100,D(ol)); 
    b1=xyz2lab(f2,'user',[433.8 475.0 566.4]);
    b1(:,3)=b1(:,3)+2;
    d1(ob,(ol*3-2):ol*3)=sum(b1(1:25,:).*c(1:25,ol))./sum(c(1:25,ol)~=0,1);
    d2(ob,(ol*3-2):ol*3)=sum(b1(26:50,:).*c(26:50,ol))./sum(c(26:50,ol)~=0,1);
    d3(ob,(ol*3-2):ol*3)=sum(b1(51:75,:).*c(51:75,ol))./sum(c(51:75,ol)~=0,1);
    d4(ob,(ol*3-2):ol*3)=sum(b1(76:100,:).*c(76:100,ol))./sum(c(76:100,ol)~=0,1);
    end
end
d1(11,:)=d1(12,:);d1(19,:)=d1(20,:);
e1=reshape(mean(d1)',3,5)';
e2=reshape(mean(d2)',3,5)';
e3=reshape(mean(d3)',3,5)';
e4=reshape(mean(d4)',3,5)';
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
% axis([16 26 16 26]);hold on;grid on;
%  set(gca,'XTick',[16:2:26]);%设置要显示坐标刻度
%  set(gca,'YTick',[16:2:26]);%设置要显示坐标刻度
 axis([0 40 0 40]);hold on;grid on;
 set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
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
[h,V,ab1(il+5,1),ab1(il+5,2)] = ellipsefig0621(M,s,r,1,il); % 绘制置信椭圆
ab1(il+5,3)=atan(V(1,1)./V(1,2))./pi.*180;
% axis([12 22 12 22]);hold on;grid on;
%  set(gca,'XTick',[12:2:22]);%设置要显示坐标刻度
%  set(gca,'YTick',[12:2:22]);%设置要显示坐标刻度
 axis([0 40 0 40]);hold on;grid on;
 set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
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
[h,V,ab1(il+10,1),ab1(il+10,2)] = ellipsefig0621(M,s,r,1,il); % 绘制置信椭圆
ab1(il+10,3)=atan(V(1,1)./V(1,2))./pi.*180;
% axis([12 22 12 22]);hold on;grid on;
%  set(gca,'XTick',[12:2:22]);%设置要显示坐标刻度
%  set(gca,'YTick',[12:2:22]);%设置要显示坐标刻度
 axis([0 40 0 40]);hold on;grid on;
 set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
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
[h,V,ab1(il+15,1),ab1(il+15,2)] = ellipsefig0621(M,s,r,1,il); % 绘制置信椭圆
ab1(il+15,3)=atan(V(1,1)./V(1,2))./pi.*180;
% axis([15 25 15 25]);hold on;grid on;
%  set(gca,'XTick',[15:2:25]);%设置要显示坐标刻度
%  set(gca,'YTick',[15:2:25]);%设置要显示坐标刻度
 axis([0 40 0 40]);hold on;grid on;
 set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(M(1),M(2),'o','Color',color(il,:),'MarkerFaceColor',color(il,:),'MarkerSize',8);
end
title('South Asian results');

sgtitle('Preferred skin color centers on CIELAB (CAT D=Zhai)');

for j=1:20
    if ab1(j,1)>ab1(j,2)
        ab2(j,1)=ab1(j,1)./ab1(j,2);ab2(j,2)=90-ab1(j,3);
    else
        ab2(j,2)=ab1(j,2)./ab1(j,1);ab2(j,2)=ab1(j,3);
    end
end