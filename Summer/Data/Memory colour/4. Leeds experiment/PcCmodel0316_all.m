% clear all;
load('CPplot0225.mat');
% load('CPplot0225a.mat');
fig=figure();
set(fig,'Position', [100 100 550 550]);
grid on;hold on;
axis([0 100 0 1]);hold on;
 j=[1,2,3,4,5,8,10,11,12,13,16,19,20,21,22,23,24];
 a=zeros(48,1);
for ii=1:17
    i=j(ii);
    Qn=anall(:,i);
    a=a+Qn;
end
an1(:,1)=a./17;

jj=[6,7,9,14,15,17,18];
a=zeros(48,1);
for ii=1:7
    i=jj(ii);
        Qn=anall(:,i);
    a=a+Qn;
end
an1(:,2)=a./7;
an1(:,3)=mean(anall')';
for i=1:3
%     Qp=apall(:,i);
    Q=an1(:,i);
 testC=0:0.1:100;
 testQc=exp(aa(i,1)-aa(i,2).*testC-aa(i,3).*log(testC));
 testQp=(aa(i,4).*mean(Q)+aa(i,5).*testQc+aa(i,6));
 testQp=(testQp-testQp(1)).*2.5;
 plot(testC,testQp,'color',rgb(i,:)./140,'LineWidth',2); hold on;
end
hl=legend('type1-mean','type2-mean','all-mean');
set(legend,'Location','NorthEastOutside');
set(hl,'Box','off');
set(gca,'XTick',[0:10:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
xlabel('C*','FontName','Times New Roman','FontSize',15);
ylabel('Qp*','FontName','Times New Roman','FontSize',15);


