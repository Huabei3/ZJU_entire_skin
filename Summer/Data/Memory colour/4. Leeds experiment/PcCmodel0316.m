% clear all;
% load('CPplot0225.mat');
% load('CPplot0225a.mat');
fig=figure();
set(fig,'Position', [100 100 550 550]);
grid on;hold on;
axis([0 100 0 1]);hold on;
for i=6:7
    Qp=apall(:,i);
    Qn=anall(:,i);
    C=sqrt(bZ(:,i*3-1).^2+bZ(:,i*3).^2);
 
 xdata=[Qn,exp(aa(i,1)-aa(i,2).*C-aa(i,3).*log(C))];
 ydata=Qp;
 f1=@(a,xdata)(a(1).*xdata(:,1)+a(2).*xdata(:,2)+a(3));
 rmax=0;
 for t=1:100
     a0=[rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0.5,0,-1],[1,0.5,0],options);
     y=a(1).*xdata(:,1)+a(2).*xdata(:,2)+a(3);
     r=corrcoef(y,ydata);
     if r(1,2) >= rmax
        rmax=r(1,2);
        afinal=a;
     end
 end
 aaa(i,:)=a;
 pr(i)=rmax;

 testC=0:0.1:100;
 testQc=exp(aa(i,1)-aa(i,2).*testC-aa(i,3).*log(testC));
 testQp=(aaa(i,1).*mean(Qn)+aaa(i,2).*testQc+aaa(i,3));
 testQp=(testQp-testQp(1)).*2.5;
 plot(testC,testQp,'color',rgb(i,:)./140,'LineWidth',2); hold on;
end
hl=legend('Stewberry','Orange','Banana','Green Apple','Kiwi','Purple Grape','Blueberry','Tamato','Purple Cabbage','Carrot','Pumpkin','Corn','Green Pepper','Aubergine','Pork','Lemon','Broccoli','Pepsi','Blue Sky','Summer Grass','Rose','Pine','Smurf','Lavender');
set(legend,'Location','NorthEastOutside');
set(hl,'Box','off');
set(gca,'XTick',[0:10:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
xlabel('C*','FontName','Times New Roman','FontSize',15);
ylabel('Qp*','FontName','Times New Roman','FontSize',15);


