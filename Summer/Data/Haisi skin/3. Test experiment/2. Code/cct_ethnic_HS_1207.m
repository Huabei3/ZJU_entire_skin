load('david_CAT_HSpaper_1107.mat')
ct=[3000,4000,5000,6500,8000];
fig=figure();
set(fig,'Position', [100 100 1200 800]);
plot([-10,50], [-10,50],'color',[0.7,0.7,0.7]);
axis([-5 40 -5 40]);hold on;grid on;
 set(gca,'XTick',[-10:5:50]);%设置要显示坐标刻度
 set(gca,'YTick',[-10:5:50]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
load('data_HS_david_1107.mat');
color=[255,0,0;255,162,0;225,225,0;106,208,80;21,55,213]./255;

for i=1:5
    for j=1:4
% dd(i)=exp(ct(i)./1850.952)./150.825;%skin
% dd(i)=0.723.*(1-1116./ct(i));%zhai
% dd(i)=0.23963.*0.723.*(1-1116./ct(i));%our
% dd(i)=0.762.*(1-2178.96./ct(i));%cherry
dd(i)=0.2914.*(1-2084./ct(i));
xyz=lab2xyz(aa(j*5-5+i,:),'user',[433.8 475.0 566.4]);
f2=ciecat02_d(xyz,f1(i,:)./f1(i,2).*314.7,f1(5,:),'CAT16',100,100,dd(i)); 
b1(j*5-5+i,:)=xyz2lab(f2,'user',[433.8 475.0 566.4]);
    end
end
e(1)=MCDM(b1(1:5,:));e(2)=MCDM(b1(6:10,:));
e(3)=MCDM(b1(11:15,:));e(4)=MCDM(b1(16:20,:));
mean(e);

 for il=1:5
subplot(2,3,il);
subplot('position', [0.03+0.2*il-0.2 0.12 0.16 0.8]); 
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
 par(il,7)=r;par(il,4:5)=b1(il,2:3);
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
 par(il,7)=r;par(il,4:5)=b1(il+5,2:3);
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
  par(il,7)=r;par(il,4:5)=b1(il+10,2:3);
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
 par(il,7)=r;par(il,4:5)=b1(il+15,2:3);
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
