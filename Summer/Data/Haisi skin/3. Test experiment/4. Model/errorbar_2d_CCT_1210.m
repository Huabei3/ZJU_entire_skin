clear all
fig=figure();
% set(fig,'Position', [100 100 600 600]);
load('center0610.mat')
sum(reshape(a,500,28)');
b=ans';
b=reshape(b,100,5);
c=b(1:25,:)+b(26:50,:)+b(51:75,:)+b(76:100,:);
cc(1,:)=sum(c(1:5,:));
cc(2,:)=sum(c(6:10,:));
cc(3,:)=sum(c(11:15,:));
cc(4,:)=sum(c(16:20,:));
cc(5,:)=sum(c(21:25,:));
cc=cc./11.2;
cc=cc';
 aa=bar(cc,0.5);hold on;
color=[1 0.1 0;1 0.6 0.1;1 1 0.1;0.1 1 0.2;0.1 0.4 0.9]./1.05;
for i=1:5
set(aa(i),'FaceColor',color(i,:));
end
s1=std(c(1:5,:),0,2);s2=std(c(6:10,:),0,2);s3=std( c(11:15,:),0,2);s4=std( c(16:20,:),0,2);s5=std( c(21:25,:),0,2);
s=[s1,s2,s3,s4,s5];
s=s'./11.2;
hold on;
errorbar([0.7 1.7 2.7 3.7 4.7], cc(1:5,1), s(:,1), 'k', 'Linestyle', 'None'); 
hold on;
errorbar([0.85 1.85 2.85 3.85 4.85], cc(1:5,2),s(:,2), 'k', 'Linestyle', 'None'); 
hold on;
errorbar([1 2 3 4 5], cc(1:5,3), s(:,3), 'k', 'Linestyle', 'None'); 
hold on;
errorbar([1.15 2.15 3.15 4.15 5.15], cc(1:5,4), s(:,4), 'k', 'Linestyle', 'None'); 
hold on;
errorbar([1.3 2.3 3.3 4.3 5.3], cc(1:5,5), s(:,5), 'k', 'Linestyle', 'None'); 

% sgtitle(strcat('Observer preferred display CCT'));

% legend({'Light 3000K','Light 4000K','Light 5000K','Light 6500K','Light 8000K'});
%  axis([0 100 0 100]);hold on;grid on;
% set(gca,'XTick',[-100:10:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:10:100]);%设置要显示坐标刻度
ylim([0,100]);
set(gca,'XGrid','off','YGrid','on')
set(gca,'xticklabel',{'3000K','4000K','5000K','6500K','8000K'});
legend({'Image 4000K','Image 5000K','Image 6500K','Image 8000K','Image 10000K'});
xlabel('Image CCT');ylabel('P%');