
load('skin16lab.mat');
load('Chinese30.mat');
color=[200,0,0;0,200,0;200,200,0;0,0,200;200,200,0;200,0,0;0,200,0;0,0,200;0,0,0];
obj1=["o","o","o","o","^","^","^","^","s"];
fig1 = figure();
set(fig1,'Position',[100 100 500 500]);
for ii=4
for il=1:9
    for io=1:30
    a=C((400*(il-1)+25*(ii-1)+1):(400*(il-1)+25*(ii-1)+25),io);
    n=sum(a==1);
    if n==0
    b(il,ii,io,1:3)=c(18,(ii*3-2):ii*3);
    else
    b1=c(:,(ii*3-2):ii*3);
    b(il,ii,io,1:3)=sum(a.*b1)./n;
    end
    end
    f(1:30,1:3)=b(il,ii,1:30,:);
    score=f;
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
MM(il,:)=M;
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[h] = ellipsefig1225(M(2:3),P,r,1,il); % 绘制置信椭圆
axis([10 27 10 26]);hold on;grid on;
 set(gca,'XTick',[10:2:26]);%设置要显示坐标刻度
 set(gca,'YTick',[10:2:26]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(M(2),M(3),obj1(il),'Color',color(il,:)./255,'MarkerFaceColor',color(il,:)./255,'MarkerSize',5);
end
end