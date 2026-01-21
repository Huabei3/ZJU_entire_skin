load('david_CAT_HSpaper_1209.mat')
ct=[3000,4000,5000,6500,8000];
fig=figure();
set(fig,'Position', [100 100 600 600]);
% 
color=[255,0,0;255,162,0;225,225,0;146,208,80;91,155,213]./255;
load('data_HS_david_1107.mat');
plot([-10,50], [-10,50],'color',[0.7,0.7,0.7]);hold on;
for il=1:5
 c1=min(b(26:50,2:3));c2=max(b(26:50,2:3));
 xdata=b(26:50,2:3);
 ydata=a1(26:50,il);
 f1=@(a,xdata)(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
 rmax=0;
 for t=1:100
     a0=[-rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,-0.1,c1,1],[0.1,0.1,0.1,c2,3],options);
     y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
     r=corr(y,ydata);
     if r >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(il,1:6)=afinal;
 a=afinal;
 y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3).*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
 r=corr(y,ydata);
  par(il,7)=r;par(il,5)=par(il,5)+3;
f1=['sqrt(',num2str(par(il,1)),'*(x-',num2str(par(il,4)),')^2+',num2str(par(il,2)),'*(y-',num2str(par(il,5)),')^2+',num2str(par(il,3)),'*(x-',num2str(par(il,4)),')','*(y-',num2str(par(il,5)),'))','=',num2str(par(il,6))];
h1=ezplot(f1,[-100,120]);set(h1,'Color',color(il,:),'linewidth',2,'linestyle',':');hold on;
plot(par(il,4),par(il,5),'.','Color',color(il,:),'MarkerFaceColor',color(il,:),'MarkerSize',25);hold on;
axis([-10 50 -10 50]);hold on;grid on;
 set(gca,'XTick',[-10:10:50]);%设置要显示坐标刻度
 set(gca,'YTick',[-10:10:50]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
end





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


for il=1:5
score2=d2(:,(3*il-1):(3*il));
[m,n] = size(score2);
p = min(m,n);   % 维数
M = e2(il,2:3);           % 均值
s = inv(cov(score2));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
[h,V,ab1(il,1),ab1(il,2)] = ellipsefig0621(M,s,r,1,il); % 绘制置信椭圆
set(h,'linewidth',2,'Color',color(il,:));hold on;
ab1(il,3)=atan(V(1,1)./V(1,2))./pi.*180;
axis([-10 40 -10 40]);hold on;grid on;
 set(gca,'XTick',[-20:10:40]);%设置要显示坐标刻度
 set(gca,'YTick',[-20:10:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(M(1),M(2),'^','Color',color(il,:),'MarkerFaceColor',color(il,:),'MarkerSize',8);
end