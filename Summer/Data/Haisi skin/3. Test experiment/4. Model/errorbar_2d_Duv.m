clear all
load('center0610.mat')
sum(reshape(a,500,28)');
b=ans';
b=reshape(b,100,5);
c=b(1:25,:)+b(26:50,:)+b(51:75,:)+b(76:100,:);
dd(1,:)=c(1,:)+c(6,:)+c(11,:)+c(16,:)+c(21,:);
dd(2,:)=c(2,:)+c(7,:)+c(12,:)+c(17,:)+c(22,:);
dd(3,:)=c(3,:)+c(8,:)+c(13,:)+c(18,:)+c(23,:);
dd(4,:)=c(4,:)+c(9,:)+c(14,:)+c(19,:)+c(24,:);
dd(5,:)=c(5,:)+c(10,:)+c(15,:)+c(20,:)+c(25,:);
 bar(dd,0.5);hold on;
 d1=[c(1,:);c(6,:);c(11,:);c(16,:);c(21,:)];
 d2=[c(2,:);c(7,:);c(12,:);c(17,:);c(22,:)];
 d3=[c(3,:);c(8,:);c(13,:);c(18,:);c(23,:)];
 d4=[c(4,:);c(9,:);c(14,:);c(19,:);c(24,:)];
 d5=[c(5,:);c(10,:);c(15,:);c(20,:);c(25,:)];
s1=std(d1(1:5,:),0,2);s2=std(d2(1:5,:),0,2);s3=std(d3(1:5,:),0,2);s4=std(d4(1:5,:),0,2);s5=std(d5(1:5,:),0,2);
s=[s1,s2,s3,s4,s5];
hold on;
errorbar([0.7 1.7 2.7 3.7 4.7], dd(1:5,1), s(:,1), 'k', 'Linestyle', 'None'); 
hold on;
errorbar([0.85 1.85 2.85 3.85 4.85], dd(1:5,2),s(:,2), 'k', 'Linestyle', 'None'); 
hold on;
errorbar([1 2 3 4 5], dd(1:5,3), s(:,3), 'k', 'Linestyle', 'None'); 
hold on;
errorbar([1.15 2.15 3.15 4.15 5.15], dd(1:5,4), s(:,4), 'k', 'Linestyle', 'None'); 
hold on;
errorbar([1.3 2.3 3.3 4.3 5.3], dd(1:5,5), s(:,5), 'k', 'Linestyle', 'None'); 
xlabel('Display Duv');ylabel('score');
sgtitle(strcat('Observer preferred display Duv'));
set(gca,'xticklabel',{'-0.010','-0.005','0.000','+0.005','+0.010'});
legend({'Light 3000K','Light 4000K','Light 5000K','Light 6500K','Light 8000K'});
set(gca,'YTick',[0:100:1200]);%设置要显示坐标刻度