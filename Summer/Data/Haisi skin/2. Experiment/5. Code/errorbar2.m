c1=bc1';c2=bc2';c3=bc3';
bb1=mean(c1)./2./8*9;bb2=mean(c2)./2./8*9;bb3=mean(c3)./2./8*9;
bb=[bb1;bb2;bb3]';
 bar(bb,0.5);hold on;
s1=std(bc1,0,2);s2=std(bc2,0,2);s3=std(bc3,0,2);
s=[s1,s2,s3];
hold on;
errorbar([1 2 3 4 5], bb(:,2), s(:,2), 'k', 'Linestyle', 'None'); 
hold on;
errorbar([1.225 2.225 3.225 4.225 5.225], bb(:,3),s(:,3), 'k', 'Linestyle', 'None'); 
hold on;
errorbar([0.775 1.775 2.775 3.775 4.775], bb(:,1), s(:,1), 'k', 'Linestyle', 'None'); 
% errorbar(bb',s);hold on;
%  h = barwitherr(bb', s);% Plot with errorbars

xlabel('Display Duv');ylabel('score');
sgtitle(strcat('Observer preferred display Duv'));
set(gca,'xticklabel',{'-0.01','-0.005','0','+0.005','+0.01'});
legend({'Oriental obs.','SouthAsian obs.','Caucasian obs.'});
set(gca,'YTick',[0:100:1200]);%设置要显示坐标刻度