load('skin8lab.mat');
load('choice.mat');
str=["黄女","棕男","白男","黑女","黑男","白女","黄男","棕女"];
color=[255,29,0;155,115,0;15,74,155;0,205,0;0,105,0; 30,144,255;155,19,0;255,215,0 ]./255;
for j=5
for i=1:22
    
 lab=c(:,(3*j-2):(3*j));
 
 e1=reshape(ac(:,i),225,8); 
 b1(:,i)=e1(:,j);
 d1(:,i)=(sum(reshape(b1(:,i),9,25)))';
 f1(i,(3*j-2):(3*j))=sum(lab.*d1(:,i))./sum(d1(:,i));
 
 e2=reshape(ap(:,i),225,8); 
 b2(:,i)=e2(:,j);
 d2(:,i)=(sum(reshape(b2(:,i),9,25)))';
 f2(i,(3*j-2):(3*j))=sum(lab.*d2(:,i))./sum(d2(:,i));
 
 e3=reshape(aw(:,i),225,8); 
 b3(:,i)=e3(:,j);
 d3(:,i)=(sum(reshape(b3(:,i),9,25)))';
 f3(i,(3*j-2):(3*j))=sum(lab.*d3(:,i))./sum(d3(:,i));
end
score=f1(:,(3*j-2):(3*j));
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
text(5,2*j,str(j),'fontsize',15,'color',color(j,:));
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[V, D] = eig(P); 
aa = sqrt(r/D(1)./3);
bb = sqrt(r/D(4).*900);
t = linspace(0, 2*pi, 60);
xy = V*[aa*cos(t);bb*sin(t)];   % 坐标旋转
h = plot(xy(1,:)+M(2),xy(2,:)+M(3), 'color',color(j,:),'linewidth', 2);
hold on

score=f2(:,(3*j-2):(3*j));
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
text(5,2*j,str(j),'fontsize',15,'color',color(j,:));
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[V, D] = eig(P); 
aa = sqrt(r/D(1)./3);
bb = sqrt(r/D(4).*900);
t = linspace(0, 2*pi, 60);
xy = V*[aa*cos(t);bb*sin(t)];   % 坐标旋转
h = plot(xy(1,:)+M(2),xy(2,:)+M(3), '--','color',color(j,:),'linewidth', 2);
hold on

score=f3(:,(3*j-2):(3*j));
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
text(5,2*j,str(j),'fontsize',15,'color',color(j,:));
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[V, D] = eig(P); 
aa = sqrt(r/D(1)./3);
bb = sqrt(r/D(4).*900);
t = linspace(0, 2*pi, 60);
xy = V*[aa*cos(t);bb*sin(t)];   % 坐标旋转
h = plot(xy(1,:)+M(2),xy(2,:)+M(3),':', 'color',color(j,:),'linewidth', 2);
hold on

axis([0 30 0 30]);
hold on
axis equal;
grid on;
hold on;
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
hold on
end