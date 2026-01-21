load('skin8lab.mat');
load('choice.mat');
load('result9lab.mat');
load('race3obs22.mat')
xyz=lab2xyz(a,'user',[321.7,346.3,375.8]);
d4=0.11.*0.723.*(1-1116./b(:,2)+8.46.*b(:,3)-49266.*b(:,3)./b(:,2));

fig=figure();
set(fig,'Position', [100 100 500 500]);
axis equal;
hold on

% === 4 race,obj,ir ("Caucasian","Oriental","South Asian","African")
str=["Caucasian","Oriental","South Asian","African"];
color=[255,29,0;255,185,0;0,205,0;15,74,155]./255;

for j=4
 score1=f1(:,(3*j-2):(3*j));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = mean(score1);           % 均值
MM3(j,:)=M;
s = inv(cov(score1));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);

[V, D] = eig(P); 
aa = sqrt(r/D(1)./2);
bb = sqrt(r/D(4).*150);
t = linspace(0, 2*pi, 60);
xy = V*[aa*cos(t);bb*sin(t)];   % 坐标旋转
h = plot(xy(1,:)+M(2),xy(2,:)+M(3),'-', 'color','b','linewidth', 1.5);
plot(M(2),M(3),'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5);


 score2=f2(:,(3*j-2):(3*j));
[m,n] = size(score2);
p = min(m,n);   % 维数
M = mean(score2);           % 均值
MM2(j,:)=M;
s = inv(cov(score2));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);

[V, D] = eig(P); 
aa = sqrt(r/D(1)./2);
bb = sqrt(r/D(4).*150);
t = linspace(0, 2*pi, 60);
xy = V*[aa*cos(t);bb*sin(t)];   % 坐标旋转
h = plot(xy(1,:)+M(2),xy(2,:)+M(3),'-', 'color','g','linewidth', 1.5);
plot(M(2),M(3),'o','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',5);

 score3=f3(:,(3*j-2):(3*j));
[m,n] = size(score3);
p = min(m,n);   % 维数
M = mean(score3);           % 均值
MM1(j,:)=M;
s = inv(cov(score3));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);

[V, D] = eig(P); 
aa = sqrt(r/D(1)./2);
bb = sqrt(r/D(4).*150);
t = linspace(0, 2*pi, 60);
xy = V*[aa*cos(t);bb*sin(t)];   % 坐标旋转
h = plot(xy(1,:)+M(2),xy(2,:)+M(3),'-', 'color','r','linewidth', 1.5);
plot(M(2),M(3),'o','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',5);

axis([0 30 0 30]);hold on
title('Preferrred African skin color','FontSize',20)
set(gca,'XTick',[0:5:30]);%设置要显示坐标刻度
set(gca,'YTick',[0:5:30]);%设置要显示坐标刻度
grid on;
xlabel('a*','FontName','Times New Roman','FontSize',15);
ylabel('b*','FontName','Times New Roman','FontSize',15);
end