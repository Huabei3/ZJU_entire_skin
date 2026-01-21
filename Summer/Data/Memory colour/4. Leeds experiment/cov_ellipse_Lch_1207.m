 clear all
load('cov_choice_1205.mat');
for i=1:24 blc(:,i*3)=b(:,i*3-2); blc(:,i*3-1)=sqrt(b(:,i*3-1).^2+b(:,i*3).^2); blc(:,i*3-2)=atan(b(:,i*3)./b(:,i*3-1)); end
for i=1:34 blc1(:,i*3)=b1(:,i*3-2); blc1(:,i*3-1)=sqrt(b1(:,i*3-1).^2+b1(:,i*3).^2); blc1(:,i*3-2)=atan(b1(:,i*3)./b1(:,i*3-1)); end
fig=figure();
set(fig,'Position', [100 100 600 600]);
load('Leeds_CH_0905.mat');
for j=3
for i=1:62
    score(i,:)=sum(blc(:,j*3-2:j*3).*a(j*49-48:j*49,i))./sum(a(j*49-48:j*49,i));
end
for i=1:49 
    if an(i,3)>0.5
        plot(blc(i,j*3-1),blc(i,j*3),'x','color',[1 0.2 0.2],'MarkerSize',15);hold on; 
    else
        plot(blc(i,j*3-1),blc(i,j*3),'x','color',[0.4 0.4 0.4],'MarkerSize',15);hold on; 
        end
end
for i=1:42
    score(i+62,:)=sum(blc1(:,j*3-2:j*3).*aa(j*48-47:j*48,i))./sum(aa(j*48-47:j*48,i));
end
for i=1:48 
    if an(i,3)>0.5
    plot(blc1(i,j*3-1),blc1(i,j*3),'x','color',[1 0.2 0.2],'MarkerSize',15);hold on; 
     else
    plot(blc1(i,j*3-1),blc1(i,j*3),'x','color',[0.4 0.4 0.4],'MarkerSize',15);hold on; 
    end

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
plot(M(2),M(3),'ko','MarkerSize',5,'MarkerFace',[0 0 0]);
C=sqrt(M(3)^2+M(2)^2);
h=atan(M(3)/M(2))*180/pi;
text(M(2)+3,M(3),num2str(j));
end
load('cov_choice_1202.mat');
%=================CHN-Leeds=============================
for i=1:21
    score(i,:)=sum(blc(:,7:9).*aLeeds(99:147,i))./sum(aLeeds(99:147,i));
%      plot(score(i,2),score(i,3),'.','color',[0.8 0.4 0],'MarkerSize',15);hold on;
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
% =================CHN-UK=============================
for i=1:21
    score(i,:)=sum(blc(:,7:9).*aUK(99:147,i))./sum(aUK(99:147,i));
%      plot(score(i,2),score(i,3),'.','color',[0.8 0 0],'MarkerSize',15);hold on;
end
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[h] = cov_fig_1202(M(2:3),P,r,1,2);   % 绘制置信椭圆
axis equal;hold on;
plot(M(2),M(3),'k^','MarkerSize',8,'MarkerFace',[0.8 0 0]);
C=sqrt(M(3)^2+M(2)^2);
h=atan(M(3)/M(2))*180/pi;
%=================CHN-ZJU=============================
for i=1:9
    score(i,:)=sum(blc(:,7:9).*aZJU(99:147,i))./sum(aZJU(99:147,i));
%      plot(score(i,2),score(i,3),'.','color',[0.8 0.8 0],'MarkerSize',15);hold on;
end
for i=1:11
    score(i+9,:)=sum(blc1(:,7:9).*aZJU1(97:144,i))./sum(aZJU1(97:144,i));
%      plot(score(i+9,2),score(i+9,3),'.','color',[0.8 0.8 0],'MarkerSize',15);hold on;
end
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[h] = cov_fig_1202(M(2:3),P,r,1,3);   % 绘制置信椭圆
axis equal;hold on;
plot(M(2),M(3),'k^','MarkerSize',8,'MarkerFace',[0.8 0.8 0]);
C=sqrt(M(3)^2+M(2)^2);
h=atan(M(3)/M(2))*180/pi;
%=================CHN-PK=============================
for i=1:31
    score(i,:)=sum(blc1(:,7:9).*aPK(97:144,i))./sum(aPK(97:144,i));
%      plot(score(i,2),score(i,3),'.','color',[0.1 0.8 0],'MarkerSize',15);hold on;
end
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[h] = cov_fig_1202(M(2:3),P,r,1,4);   % 绘制置信椭圆
axis equal;hold on;
plot(M(2),M(3),'k^','MarkerSize',8,'MarkerFace',[0.1 0.8 0]);
C=sqrt(M(3)^2+M(2)^2);
h=atan(M(3)/M(2))*180/pi;
% % %=================CHN-AF=============================
for i=1:11
    score(i,:)=sum(blc(:,7:9).*aAF(99:147,i))./sum(aAF(99:147,i));
%      plot(score(i,2),score(i,3),'.','color',[0 0.3 0.8],'MarkerSize',15);hold on;
end
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[h] = cov_fig_1202(M(2:3),P,r,1,5);   % 绘制置信椭圆
axis equal;hold on;
plot(M(2),M(3),'k^','MarkerSize',8,'MarkerFace',[0 0.3 0.8]);
C=sqrt(M(3)^2+M(2)^2);
h=atan(M(3)/M(2))*180/pi;

for i=3
load('Leeds_CH_0905.mat');
cl=[0.8,0.4,0;0.8,0,0;0.8,0.8,0;0.1,0.8,0;0,0.3,0.8;0,0,0];
%=================3D_6=============================
for j=1:3  
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
 y=(1-1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))>=0);hold on;
 r=corr(y,ydata);
 par(i,11)=r;
f=['sqrt(',num2str(par(i,2)),'*(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
h=ezplot(f,[-100,120]);set(h,'Color',cl(4,:),'LineWidth',3);hold on;
text(par(i,6)+1,par(i,7),num2str(i),'fontsize',10);
plot(par(i,6),par(i,7),'o','Color',cl(4,:),'MarkerFaceColor',cl(4,:),'MarkerSize',6);hold on;
end
%=======================plot==================================
axis([50 100 50 100]);hold on;grid on;
set(gca,'XTick',[-100:5:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:5:120]);%设置要显示坐标刻度
xlabel('C*_a_b','FontSize',15);
ylabel('L*','FontSize',15);
title('Memory results on CIELAB C*_a_bL*');
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);

