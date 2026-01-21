clear all;
fig=figure();
set(fig,'Position', [100 100 600 600]);
%=================cov=============================
load('cov_choice_1202.mat');
for i=1:27 blc(:,i*3)=b(:,i*3-2); blc(:,i*3-1)=sqrt(b(:,i*3-1).^2+b(:,i*3).^2); blc(:,i*3-2)=atan(b(:,i*3)./b(:,i*3-1)); end
for i=1:21
    score(i,:)=sum(blc(:,7:9).*aLeeds(99:147,i))./sum(aLeeds(99:147,i));
end
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[h] = cov_fig_1202(M(2:3),P,r,1,1);   % 绘制置信椭圆
axis equal;hold on;
plot(M(2),M(3),'k^','MarkerSize',8,'MarkerFace',[0.8 0.4 0]);
C=sqrt(M(3)^2+M(2)^2);
h=atan(M(3)/M(2))*180/pi;
for i=3
% =================3D_4=============================
cl=[0.8,0.4,0;0.8,0,0;0.8,0.8,0;0.1,0.8,0;0,0.3,0.8;0,0,0];
load('Leeds_CH_0905.mat');
for j=3  
cc(:,j*3)=b(:,j*3-2); 
cc(:,j*3-1)=sqrt(b(:,j*3-1).^2+b(:,j*3).^2);
cc(:,j*3-2)=atan2(b(:,j*3),b(:,j*3-1))./pi.*180;
end 
b=cc;
c(1,1:3)=min(b(:,3*i-2:3*i));
c(2,1:3)=max(b(:,3*i-2:3*i));
 xdata=b(:,3*i-2:3*i);
 ydata=ap(:,i);
 f1=@(a,xdata)(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
%   f1=@(a,xdata)(1./(1+exp(sqrt(a(1)*(sqrt(xdata(:,2).*a(6)).*sin((xdata(:,1)-a(5))./2)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
  rmax=0;
 for t=1:100
     a0=[-rand,rand,rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,0,-5,c(1,:),1],[0.6,2,6,6,c(2,:),4],options);
     y=(1./(1+exp(sqrt(a(1)*(sqrt(xdata(:,2).*a(6)).*sin((xdata(:,1)-a(5))./2)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
     r=corrcoef(y,ydata);
     if r(1,2) >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(i,1:8)=afinal;
 par=real(par);
 par(i,5:7)=[88.37,70.25,64.35];
 a=afinal;
 y=(1./(1+exp(sqrt(a(1)*(sqrt(xdata(:,2).*a(6)).*sin((xdata(:,1)-a(5))./2)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);hold on;
 r=corrcoef(y,ydata);
 par(i,9)=r(1,2);
f=['sqrt(',num2str(par(i,2)),'*(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
h=ezplot(f,[-100,120]);set(h,'Color',cl(3,:),'LineWidth',3);hold on;
text(par(i,6)+1,par(i,7),num2str(i),'fontsize',10);
plot(par(i,6),par(i,7),'o','Color',cl(3,:),'MarkerFaceColor',cl(3,:),'MarkerSize',6);hold on;
% =================3D_6=============================
load('Leeds_CH_0905.mat');
for j=1:28  
cc(:,j*3)=b(:,j*3-2); 
cc(:,j*3-1)=sqrt(b(:,j*3-1).^2+b(:,j*3).^2);
cc(:,j*3-2)=atan2(b(:,j*3),b(:,j*3-1))./pi.*180;
end 
b=cc;
c(1,1:3)=min(b(:,3*i-2:3*i));
c(2,1:3)=max(b(:,3*i-2:3*i));
 xdata=b(:,3*i-2:3*i);
 ydata=ap(:,i);
 f1=@(a,xdata)(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
%  f1=@(a,xdata)(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))>=0);
  rmax=0;
 for t=1:100
     a0=[-rand,rand,rand,rand,rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,0,-5,c(1,:),1,-2,-1],[0.5,2,6,6,c(2,:),4,1,1],options);
     y=(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))>=0);
     r=corr(y,ydata);
     if r >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(i,1:10)=afinal;
 par(i,1:4)=par(i,1:4).*3;par(i,9:10)=par(i,9:10).*3;
 a=afinal;
 y=(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))>=0);hold on;
 r=corr(y,ydata);
 par(i,11)=r;
f=['sqrt(',num2str(par(i,2)),'*(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
h=ezplot(f,[-100,120]);set(h,'Color',cl(4,:),'LineWidth',3);hold on;
text(par(i,6)+1,par(i,7),num2str(i),'fontsize',10);
plot(par(i,6),par(i,7),'o','Color',cl(4,:),'MarkerFaceColor',cl(4,:),'MarkerSize',6);hold on;
end
%=======================plot==================================
axis([0 100 0 100]);hold on;grid on;
set(gca,'XTick',[-100:10:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:10:120]);%设置要显示坐标刻度
xlabel('C*_a_b','FontSize',15);
ylabel('L*','FontSize',15);
title('Memory results on CIELAB C*_a_bL*');
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
