load('david_CAT_HSpaper_1209.mat')
ct=[3000,4000,5000,6500,8000];
fig=figure();
set(fig,'Position', [100 20 550 900]);
plot([-10,50], [-10,50],'color',[0.7,0.7,0.7]);
axis([-5 40 -5 40]);hold on;grid on;
 set(gca,'XTick',[-10:5:50]);%设置要显示坐标刻度
 set(gca,'YTick',[-10:5:50]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
load('data_HS_david_1107.mat');
color=[255,0,0;255,162,0;225,225,0;106,208,80;21,55,213]./255;


load('position_1209.mat');
 for il=1:5
subplot(3,2,il);
% subplot('position', [0.03+0.2*il-0.2 0.12 0.16 0.8]); 
subplot('position', p(il,:)); 
plot([-10,50], [-10,50],'color',[0.7,0.7,0.7]);hold on;
  %=============================AF===================================   
 c1=min(b(1:25,2:3));c2=max(b(1:25,2:3));
 xdata=b(1:25,2:3);
 ydata=a1(1:25,il);
 f1=@(a,xdata)(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
 rmax=0;
 for t=1:100
     a0=[-rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,-0.1,c1,1],[0.1,0.1,0.1,c2,3],options);
     y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
     r=corr(y,ydata);
     if r >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(il,1:6)=afinal;
 a=afinal;
 y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3).*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
 r=corr(y,ydata);
 par(il,7)=r;par(il,5)=par(il,5)+3;
f1=['sqrt(',num2str(par(il,1)),'*(x-',num2str(par(il,4)),')^2+',num2str(par(il,2)),'*(y-',num2str(par(il,5)),')^2+',num2str(par(il,3)),'*(x-',num2str(par(il,4)),')','*(y-',num2str(par(il,5)),'))','=',num2str(par(il,6))];
h1=ezplot(f1,[-100,120]);set(h1,'linewidth',2,'Color',color(1,:));hold on;
plot(par(il,4),par(il,5),'.','Color',color(1,:),'MarkerFaceColor',color(1,:),'MarkerSize',25);hold on;
axis([-10 50 -10 50]);hold on;grid on;
 set(gca,'XTick',[-10:10:50]);%设置要显示坐标刻度
 set(gca,'YTick',[-10:10:50]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
par1=par;

%=============================UK===================================
 c1=min(b(26:50,2:3));c2=max(b(26:50,2:3));
 xdata=b(26:50,2:3);
 ydata=a1(26:50,il);
 f1=@(a,xdata)(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
 rmax=0;
 for t=1:100
     a0=[-rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,-0.1,c1,1],[0.1,0.1,0.1,c2,3],options);
     y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
     r=corr(y,ydata);
     if r >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(il,1:6)=afinal;
 a=afinal;
 y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3).*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
 r=corr(y,ydata);
 par(il,7)=r;par(il,5)=par(il,5)+3;
f1=['sqrt(',num2str(par(il,1)),'*(x-',num2str(par(il,4)),')^2+',num2str(par(il,2)),'*(y-',num2str(par(il,5)),')^2+',num2str(par(il,3)),'*(x-',num2str(par(il,4)),')','*(y-',num2str(par(il,5)),'))','=',num2str(par(il,6))];
h1=ezplot(f1,[-100,120]);set(h1,'linewidth',2,'Color',color(2,:));hold on;
plot(par(il,4),par(il,5),'.','Color',color(2,:),'MarkerFaceColor',color(2,:),'MarkerSize',25);hold on;
axis([-10 50 -10 50]);hold on;grid on;
 set(gca,'XTick',[-10:10:50]);%设置要显示坐标刻度
 set(gca,'YTick',[-10:10:50]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
par2=par;

%=============================CHN===================================
 c1=min(b(51:75,2:3));c2=max(b(51:75,2:3));
 xdata=b(51:75,2:3);
 ydata=a1(51:75,il);
 f1=@(a,xdata)(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
 rmax=0;
 for t=1:100
     a0=[-rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,-0.1,c1,1],[0.1,0.1,0.1,c2,3],options);
     y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
     r=corr(y,ydata);
     if r >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(il,1:6)=afinal;
 a=afinal;
 y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3).*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
 r=corr(y,ydata);
  par(il,7)=r;par(il,5)=par(il,5)+3;
f1=['sqrt(',num2str(par(il,1)),'*(x-',num2str(par(il,4)),')^2+',num2str(par(il,2)),'*(y-',num2str(par(il,5)),')^2+',num2str(par(il,3)),'*(x-',num2str(par(il,4)),')','*(y-',num2str(par(il,5)),'))','=',num2str(par(il,6))];
h1=ezplot(f1,[-100,120]);set(h1,'linewidth',2,'Color',color(4,:));hold on;
plot(par(il,4),par(il,5),'.','Color',color(4,:),'MarkerFaceColor',color(4,:),'MarkerSize',25);hold on;
axis([-10 50 -10 50]);hold on;grid on;
 set(gca,'XTick',[-10:10:50]);%设置要显示坐标刻度
 set(gca,'YTick',[-10:10:50]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
par3=par;

%=============================PK===================================
 c1=min(b(76:100,2:3));c2=max(b(76:100,2:3));
 xdata=b(76:100,2:3);
 ydata=a1(76:100,il);
 f1=@(a,xdata)(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
 rmax=0;
 for t=1:100
     a0=[-rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,-0.1,c1,1],[0.1,0.1,0.1,c2,3],options);
     y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
     r=corr(y,ydata);
     if r >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(il,1:6)=afinal;
 a=afinal;
 y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3).*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
 r=corr(y,ydata);
 par(il,7)=r;par(il,5)=par(il,5)+3;
f1=['sqrt(',num2str(par(il,1)),'*(x-',num2str(par(il,4)),')^2+',num2str(par(il,2)),'*(y-',num2str(par(il,5)),')^2+',num2str(par(il,3)),'*(x-',num2str(par(il,4)),')','*(y-',num2str(par(il,5)),'))','=',num2str(par(il,6))];
h1=ezplot(f1,[-100,120]);set(h1,'linewidth',2,'Color',color(5,:));hold on;
plot(par(il,4),par(il,5),'.','Color',color(5,:),'MarkerFaceColor',color(5,:),'MarkerSize',25);hold on;
axis([-10 50 -10 50]);hold on;grid on;
 set(gca,'XTick',[-10:10:50]);%设置要显示坐标刻度
 set(gca,'YTick',[-10:10:50]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title(strcat(num2str(ct(il)),'K'));
end
par4=par;
