
c1=cc1';c2=cc2';c3=cc3';
bb1=mean(c1')*2./8*9;bb2=mean(c2')*2./8*9;bb3=mean(c3')*2./8*9;
bb=[bb1;bb2;bb3]';
 bar(bb,0.5);hold on;
s1=std(cc1,0,2);s2=std(cc2,0,2);s3=std(cc3,0,2);
s=[s1,s2,s3]./2;
hold on;
errorbar([1 2 3 4 5], bb(:,2), s(:,2), 'k', 'Linestyle', 'None'); 
hold on;
errorbar([1.225 2.225 3.225 4.225 5.225], bb(:,3),s(:,3), 'k', 'Linestyle', 'None'); 
hold on;
errorbar([0.775 1.775 2.775 3.775 4.775], bb(:,1), s(:,1), 'k', 'Linestyle', 'None'); 
% errorbar(bb',s);hold on;
%  h = barwitherr(bb', s);% Plot with errorbars
xlabel('Display CCT');ylabel('score');
sgtitle(strcat('Observer preferred display CCT'));
set(gca,'xticklabel',{'4000K','5000K','6500K','8000K','10000K'});
legend({'Oriental obs.','SouthAsian obs.','Caucasian obs.'});
% 
% set(gca,'XTick',[0.15:0.03:0.3]);%设置要显示坐标刻度
set(gca,'YTick',[0:100:1200]);%设置要显示坐标刻度
% set(gcf,[100,100,500,500]);
% Average=[12,11,7,7,6,5];
%  Var_positive=[0.1,0.2,0.5,0.5,0.3,0.1];   %正向的方差
%  Var_nagetive=[0.5,0.4,0.3,1,0.3,0.5];    %负向的方差
%  Time=1:1:5;
%  errorbar(Time,Average,Var_nagetive,Var_positive)   %函数调用格式errorbar(A,B,X,Y)
%  % X为负向误差，Y为正向误差
%  xlabel('Display CCT');ylabel('Z-scoroe');
%   % 生成示例数据
%   x=1:10;
%   y=cumsum(randn(1,10));
%   lower = y - (rand(1,10));
%   upper = y + (rand(1,10));
%   
%   % 由于errorbar函数使用相对差值在图形上绘图，所以
%   % 需要将绝对差值转变为相对差值。
%   L = y - lower;
%  U = upper -y;
% 
% % 绘图时需要设定 hold on % 柱状图
%  clf;
% figure(1);
% hold on;
%  bar(x,y);
% 18 % 此处需要隐藏折线
% 19 errorbar(x,y,L,U,'Marker','none','LineStyle','none');