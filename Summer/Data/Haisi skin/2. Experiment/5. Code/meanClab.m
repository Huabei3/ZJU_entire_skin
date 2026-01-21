load('skin8lab.mat');
load('choice.mat');
str=["OF","SM","CM","AF","AM","CF","OM","SF"];
color=[255,29,0;155,115,0;15,74,155;0,205,0;0,105,0; 30,144,255;155,19,0;255,215,0 ]./255;
for j=1:8
    
 lab=c(:,(3*j-2):(3*j));
 ee1=mean(ac(:,:)')';
 e1=reshape(ee1,225,8);
 d1=mean(reshape(e1(:,j),9,25))';
 f1(j,:)=sum(lab.*d1(:,1))./sum(d1(:,1));
 score=f1(j,1:3);

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
h = plot(xy(1,:)+M(2),xy(2,:)+M(3), 'color',color(j,:),'linewidth', 1.5);

axis([0 25 0 25]);
hold on
axis equal;
grid on;
hold on;
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
hold on
plot(M(2),M(3),'.','Color',color(j,:),'MarkerSize',30);
hold on
end
