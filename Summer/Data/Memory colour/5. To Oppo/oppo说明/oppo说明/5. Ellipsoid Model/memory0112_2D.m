clear all
% 在中国进行实验的记忆色在CIELAB a*-b*平面上的椭圆模型
% 适用于中国被试和巴基斯坦被试结果
% 载入喜好率数据 
% 中国人：‘data1221c.mat’；
% 巴基斯坦人：‘data1221c.mat’；
 load('data1221c.mat');
%确定渲染中心的边界  
c1=min(b);c2=max(b);
for i=1:24
    for j=1
 %a*-b*平面渲染中心     
 xdata=b(1:16,3*i-1:3*i);
 %各渲染中心喜好率  a1: 鲜艳率；a2: 自然率；a3：喜好率
 ydata=a3(1:16,i);
  %记忆色椭圆模型
 f1=@(a,xdata)(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
 rmax=0;
 for t=1:100
  %拟合记忆色椭圆参数
     a0=[-rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,-0.1,c1(3*i-1:3*i),1],[0.1,0.1,0.1,c2(3*i-1:3*i),3],options);
     y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
     r=corr(y,ydata);
     if r >= rmax
        rmax=r;
        afinal=a;
     end
 end
 %记忆色椭圆参数拟合结果
 par(i,1:6)=afinal;
 a=afinal;
 %记忆色椭圆模型预测结果
 y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3).*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
%计算视觉数据和预测结果相关系数
 r=corr(y,ydata);
 par(i,7)=r;
 parr(j,:)=par(i,:);
 %画出椭圆
f1=['sqrt(',num2str(par(i,1)),'*(x-',num2str(par(i,4)),')^2+',num2str(par(i,2)),'*(y-',num2str(par(i,5)),')^2+',num2str(par(i,3)),'*(x-',num2str(par(i,4)),')','*(y-',num2str(par(i,5)),'))','=',num2str(par(i,6))];
h1=ezplot(f1,[-100,120]);set(h1,'Color',[0,0,1]);hold on;
plot(par(i,4),par(i,5),'^','Color',[0,0,1],'MarkerFaceColor',[0,0,1],'MarkerSize',7);hold on;
 %计算椭圆倾角，长短轴
theta = 0.5*atan(par(i,3)/(par(i,1)-par(i,2)))./pi.*180+90;
maj = sqrt(4*par(i,6)./(par(i,1)+par(i,2)-sqrt((par(i,1)-par(i,2)).^2+par(i,3).^2)));
min = sqrt(4*par(i,6)./(par(i,1)+par(i,2)+sqrt((par(i,1)-par(i,2)).^2+par(i,3).^2)));
theta1(j,1) = 0.5*atan(par(i,3)/(par(i,1)-par(i,2)))./pi.*180+90;
maj1(j,1) = sqrt(4*par(i,6)./(par(i,1)+par(i,2)-sqrt((par(i,1)-par(i,2)).^2+par(i,3).^2)));
min1(j,1) = sqrt(4*par(i,6)./(par(i,1)+par(i,2)+sqrt((par(i,1)-par(i,2)).^2+par(i,3).^2)));
if maj<min
  bb=min;
  min=maj;
  maj=bb;
end
  mr=maj./min;
  pa(j,:)=[par(i,1:6),r,theta,maj,mr];
    end 
 parrr(i,:)=parr;
%  画出对应渲染中心的喜好率是否大于50%，即是否接受
for j=1:16
     if a3(j,i)>0.5
         plot(b(j,3*i-1),b(j,3*i),'+','Color',[0.7,0,0]);
     else
         plot(b(j,3*i-1),b(j,3*i),'X','Color',[0,0.6,0]);
     end
 end
  clear cc;
end
axis([20 70 15 65]);hold on;grid on;
set(gca,'XTick',[0:5:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:5:100]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title('Memory results on CIELAB a*b*');