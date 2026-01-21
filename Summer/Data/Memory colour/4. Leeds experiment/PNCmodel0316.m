clear all;
load('CPplot0225.mat');
fig=figure();
set(fig,'Position', [100 100 550 550]);
grid on;hold on;
axis([0 100 0 1]);hold on;

for i=1:24
    Qp=apall(:,i);
    Qn=anall(:,i);
    C=sqrt(bZ(:,i*3-1).^2+bZ(:,i*3).^2);
 
 xdata=C;
 ydata=Qp;
 f1=@(a,xdata)(exp(a(1)-a(2).*xdata(:,1)-a(3).*log(xdata(:,1))));
 rmax=0;
 for t=1:100
     a0=[rand,rand,rand].*20;
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[-20,0,-20],[-5,1,0],options);
     y=exp(a(1)-a(2).*xdata(:,1)-a(3).*log(xdata(:,1)));
     r=corrcoef(y,ydata);
     if r(1,2) >= rmax
        rmax=r(1,2);
        afinal=a;
     end
 end
 aa(i,:)=a;
 pr(i)=rmax;
 testC=0:1:100;
 testQp=exp(a(1)-a(2).*testC-a(3).*log(testC));
plot(testC,testQp,'color',rgb(i,:)./140,'LineWidth',2); hold on;
end
hl=legend('Stewberry','Orange','Banana','Green Apple','Kiwi','Purple Grape','Blueberry','Tamato','Purple Cabbage','Carrot','Pumpkin','Corn','Green Pepper','Aubergine','Pork','Lemon','Broccoli','Pepsi','Blue Sky','Summer Grass','Rose','Pine','Smurf','Lavender');
set(legend,'Location','NorthEastOutside');
set(hl,'Box','off');
set(gca,'XTick',[0:10:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
xlabel('C*','FontName','Times New Roman','FontSize',15);
ylabel('Qc*','FontName','Times New Roman','FontSize',15);

