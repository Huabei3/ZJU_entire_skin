%  load('cam16ucsinput.mat');
% %  for i=1:8 cat1(i,1:3)=ciecat02_d([433.8,475,566.4],a(1,1:3),a(i,1:3),'CAT16',90,100,0.5);end
%   load('w25xyz.mat');
  load('choice3.mat');
%  for ii=1:16
%   for j=1:25
%   cat((ii*25-25+j),:)=ciecat02_d(c(ii,:),[92.0918  100.0000  119.7704],xyz25(j,:),'CAT16',106,100,1); 
%   end  
%  end
load('skin16lab.mat');
%   Jab(:,1:3)=XYZ2CAM16UCS(cat,a(9,1:3),a(9,4),a(9,5),b(9,:));
% lab=xyz2lab(cat,'user',[433.8,475,566.4].*5);
for k=1:8
 for i=1:9
  for jj=1:30
a1=reshape(aa1(:,jj),400,9);
a2=reshape(aa2(:,jj),400,9); 
a3=reshape(aa3(:,jj),400,9);
% Jab(:,1:3)=XYZ2CAM16UCS(cat,a(i,1:3),a(i,4),a(i,5),b(i,:));
if sum(a1((k*25-24):k*25,i))==0 
%     aaa1(jj,(3*i-2):(3*i))=aaa1(jj-1,(3*i-2):(3*i));
else
aaa1(jj,(3*i-2):(3*i))=sum(a1((k*25-24):k*25,i).*lab((k*25-24):k*25,1:3))./sum(a1((k*25-24):k*25,i));
end
if sum(a2((k*25-24):k*25,i))==0 
%     aaa2(jj,(3*i-2):(3*i))=aaa2(jj-1,(3*i-2):(3*i));
else
aaa2(jj,(3*i-2):(3*i))=sum(a2((k*25-24):k*25,i).*lab((k*25-24):k*25,1:3))./sum(a2((k*25-24):k*25,i));
end
if sum(a3((k*25-24):k*25,i))==0 
%     aaa3(jj,(3*i-2):(3*i))=aaa3(jj-1,(3*i-2):(3*i));
else
aaa3(jj,(3*i-2):(3*i))=sum(a3((k*25-24):k*25,i).*lab((k*25-24):k*25,1:3))./sum(a3((k*25-24):k*25,i));
end
  end
  bb1(k,(3*i-2):(3*i))=mean(aaa1(:,(3*i-2):(3*i)));
  bb2(k,(3*i-2):(3*i))=mean(aaa2(:,(3*i-2):(3*i)));
  bb3(k,(3*i-2):(3*i))=mean(aaa3(:,(3*i-2):(3*i)));
 end

bb=[bb1(:,25:27);
    bb2(:,25:27);
    bb3(:,25:27)];
% ccc=lut3d_rgb2xyz([255,255,255]);
% cc=xyz2lab(bb,'user',[433.8000  475.0000  566.4000]);



color=[220,0,10;220,150,10;0,220,10;0,10,220;
       220,0,10;220,150,10;0,220,10;0,10,220;0,0,0;
       220,0,10;220,150,10;0,220,10;0,10,220;
       220,0,10;220,150,10;0,220,10;0,10,220;0,0,0];
obj1=["o","o","o","o","o","o","o","o",
      "^","^","^","^", "^","^","^","^"];
fig1 = figure();
set(fig1,'Position',[100 100 800 300]);

 subplot(1,3,1);
 subplot('position', [0.04 0.12 0.29 0.74]); 
for il=1:9
    score1=aaa1(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = mean(score1);           % 均值
s = inv(cov(score1));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
[h] = ellipsefig0306(M,s,r,1,il); % 绘制置信椭圆
axis([0 30 0 30]);hold on;grid on;
 set(gca,'XTick',[0:5:30]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:30]);%设置要显示坐标刻度

xlabel('a,','FontSize',15);
ylabel('b,','FontSize',15);
%  plot(M(1),M(2),obj1(il),'Color',color(il-11+ii*11,:)./255,'MarkerFaceColor',color(il-11+ii*11,:)./255,'MarkerSize',5);
end
for il=1:9
    score1=aaa1(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = mean(score1);           % 均值
 plot(M(1),M(2),obj1(il),'Color',color(il,:)./255,'MarkerFaceColor',color(il,:)./255,'MarkerSize',5);
end
title('Oriental results');
legend({'3000 h','4000 h','5000 h','6500 h','3000 l','4000 l','5000 l', '6500 l','dark'});
set(legend,'Position',[0.0505 0.4882 0.0862 0.357]);

subplot(1,3,2);
subplot('position', [0.37 0.12 0.29 0.74]);
for il=1:9
    score1=aaa2(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = mean(score1);           % 均值
s = inv(cov(score1));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
[h] = ellipsefig0306(M,s,r,1,il); % 绘制置信椭圆
axis([0 30 0 30]);hold on;grid on;
 set(gca,'XTick',[0:5:30]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:30]);%设置要显示坐标刻度
xlabel('a,','FontSize',15);
ylabel('b,','FontSize',15);
%  plot(M(1),M(2),obj1(il),'Color',color(il-11+ii*11,:)./255,'MarkerFaceColor',color(il-11+ii*11,:)./255,'MarkerSize',5);
end
for il=1:9
    score1=aaa2(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = mean(score1);           % 均值
 plot(M(1),M(2),obj1(il),'Color',color(il,:)./255,'MarkerFaceColor',color(il,:)./255,'MarkerSize',5);
end
title('SouthAsian results');
legend({'3000 h','4000 h','5000 h','6500 h','3000 l','4000 l','5000 l', '6500 l','dark'});
set(legend,'Position',[0.379 0.49 0.0862 0.357]);

subplot(1,3,3);
subplot('position', [0.70 0.12 0.29 0.74]); 
for il=1:9
    score1=aaa3(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = mean(score1);           % 均值
s = inv(cov(score1));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
[h] = ellipsefig0306(M,s,r,1,il); % 绘制置信椭圆
axis([0 30 0 30]);hold on;grid on;
 set(gca,'XTick',[0:5:30]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:30]);%设置要显示坐标刻度

xlabel('a,','FontSize',15);
ylabel('b,','FontSize',15);
%  plot(M(1),M(2),obj1(il),'Color',color(il-11+ii*11,:)./255,'MarkerFaceColor',color(il-11+ii*11,:)./255,'MarkerSize',5);
end
for il=1:9
    score1=aaa3(:,(3*il-1):(3*il));
[m,n] = size(score1);
p = min(m,n);   % 维数
M = mean(score1);           % 均值
 plot(M(1),M(2),obj1(il),'Color',color(il,:)./255,'MarkerFaceColor',color(il,:)./255,'MarkerSize',5);
end
title('Caucasian results');
legend({'3000 h','4000 h','5000 h','6500 h','3000 l','4000 l','5000 l', '6500 l','dark'});
set(legend,'Position',[0.7105 0.49 0.0862 0.357]);

sgtitle(strcat('CAM16UCS  J,a,b, result under 8 lightings -- image',num2str(k)));
saveas(gcf,strcat('Image ',num2str(k),' Jab'),'png');
end