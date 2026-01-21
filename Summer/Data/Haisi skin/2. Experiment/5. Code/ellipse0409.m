load('cam16ucsinput.mat');
  load('choice4.mat');
  load('choicehalf.mat');
 for ii=1:16
  for j=1:25
  cat((ii*25-25+j),:)=ciecat02_d(c(ii,:),[92.0918  100.0000  119.7704],xyz25(j,:),'CAT16',106,100,1); 
  end  
 end
load('skin16lab.mat');
 lab=xyz2lab(cat,'user',[433.8,475,566.4].*5);
 
for k=1:4
 for i=1:5
  for jj=1:30
a1=reshape(aa1(:,jj),400,5);
a2=reshape(aa2(:,jj),400,5); 
a3=reshape(aa3(:,jj),400,5);
if sum(a1((k*25-24):k*25,i))==0 
else
aaa1(jj,(3*i-2):(3*i))=sum(a1((k*25-24):k*25,i).*lab((k*25-24):k*25,1:3))./sum(a1((k*25-24):k*25,i));
end
if sum(a2((k*25-24):k*25,i))==0 
else
aaa2(jj,(3*i-2):(3*i))=sum(a2((k*25-24):k*25,i).*lab((k*25-24):k*25,1:3))./sum(a2((k*25-24):k*25,i));
end
if sum(a3((k*25-24):k*25,i))==0 
else
aaa3(jj,(3*i-2):(3*i))=sum(a3((k*25-24):k*25,i).*lab((k*25-24):k*25,1:3))./sum(a3((k*25-24):k*25,i));
end
  end
  bb1(k,(3*i-2):(3*i))=mean(aaa1(:,(3*i-2):(3*i)));
  bb2(k,(3*i-2):(3*i))=mean(aaa2(:,(3*i-2):(3*i)));
  bb3(k,(3*i-2):(3*i))=mean(aaa3(:,(3*i-2):(3*i)));
 end

bb=[bb1(:,13:15);
    bb2(:,13:15);
    bb3(:,13:15)];
color=[220,0,10;220,150,10;0,220,10;0,10,220;0,0,0;
       220,0,10;220,150,10;0,220,10;0,10,220;0,0,0];
obj1=["o","o","o","o","o","o","o","o"];
fig1 = figure();
set(fig1,'Position',[100 100 800 300]);

 subplot(1,3,1);
 subplot('position', [0.04 0.12 0.29 0.74]); 
for il=1:5
    score1=aaa1(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = M1(k*5-5+il,2:3);           % 均值
s = inv(cov(score1));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
[h,V,ab1(k*5-5+il,1),ab1(k*5-5+il,2)] = ellipsefig0409(M,s,r,1,il); % 绘制置信椭圆
ab1(k*5-5+il,3)=atan(V(1,1)./V(1,2))./pi.*180;
axis([10 25 10 25]);hold on;grid on;
 set(gca,'XTick',[10:3:25]);%设置要显示坐标刻度
 set(gca,'YTick',[10:3:25]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
%  plot(M(1),M(2),obj1(il),'Color',color(il-11+ii*11,:)./255,'MarkerFaceColor',color(il-11+ii*11,:)./255,'MarkerSize',5);
end
for il=1:5
    score1=aaa1(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = M1(k*5-5+il,2:3);           % 均值
 plot(M(1),M(2),obj1(il),'Color',color(il,:)./255,'MarkerFaceColor',color(il,:)./255,'MarkerSize',5);
end
title('Oriental results');
legend({'3000K','4000K','5000K','6500K','dark'});
set(legend,'Position',[0.0505 0.4882 0.0862 0.357]);

subplot(1,3,2);
subplot('position', [0.37 0.12 0.29 0.74]);
for il=1:5
    score1=aaa2(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = M2(k*5-5+il,2:3);           % 均值
s = inv(cov(score1));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
[h,V,ab1(k*5-5+il,4),ab1(k*5-5+il,5)]  = ellipsefig0409(M,s,r,1,il); % 绘制置信椭圆
ab1(k*5-5+il,6)=atan(V(1,1)./V(1,2))./pi.*180;
axis([10 25 10 25]);hold on;grid on;
 set(gca,'XTick',[10:3:25]);%设置要显示坐标刻度
 set(gca,'YTick',[10:3:25]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
%  plot(M(1),M(2),obj1(il),'Color',color(il-11+ii*11,:)./255,'MarkerFaceColor',color(il-11+ii*11,:)./255,'MarkerSize',5);
end
for il=1:5
    score1=aaa2(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = M2(k*5-5+il,2:3);            % 均值
 plot(M(1),M(2),obj1(il),'Color',color(il,:)./255,'MarkerFaceColor',color(il,:)./255,'MarkerSize',5);
end
title('SouthAsian results');
legend({'3000K','4000K','5000K','6500K','dark'});
set(legend,'Position',[0.379 0.49 0.0862 0.357]);

subplot(1,3,3);
subplot('position', [0.70 0.12 0.29 0.74]); 
for il=1:5
    score1=aaa3(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = M3(k*5-5+il,2:3);            % 均值
s = inv(cov(score1));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
[h,V,ab1(k*5-5+il,7),ab1(k*5-5+il,8)]  = ellipsefig0409(M,s,r,1,il); % 绘制置信椭圆
ab1(k*5-5+il,9)=atan(V(1,1)./V(1,2))./pi.*180;
axis([10 25 10 25]);hold on;grid on;
 set(gca,'XTick',[10:3:25]);%设置要显示坐标刻度
 set(gca,'YTick',[10:3:25]);%设置要显示坐标刻度

xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);

end
for il=1:5
    score1=aaa3(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = M3(k*5-5+il,2:3);             % 均值
 plot(M(1),M(2),obj1(il),'Color',color(il,:)./255,'MarkerFaceColor',color(il,:)./255,'MarkerSize',5);
end
title('Caucasian results');
legend({'3000K','4000K','5000K','6500K','dark'});
set(legend,'Position',[0.7105 0.49 0.0862 0.357]);

sgtitle('African Image results under 5 lightings');
% saveas(gcf,strcat('Image African ab'),'png');
end
for i=1:20
if ab1(i,1)>ab1(i,2)
    ab1(i,3)=90-ab1(i,3);
else
    ab=ab1(i,1);ab1(i,1)=ab1(i,2);ab1(i,2)=ab;
end
if ab1(i,4)>ab1(i,5)
    ab1(i,6)=90-ab1(i,6);
else
    ab=ab1(i,4);ab1(i,4)=ab1(i,5);ab1(i,5)=ab;
end
if ab1(i,7)>ab1(i,8)
    ab1(i,9)=90-ab1(i,9);
else
    ab=ab1(i,7);ab1(i,7)=ab1(i,8);ab1(i,8)=ab;
end
end