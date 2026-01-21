load('david_CAT_HSpaper_1209.mat')
ct=[3000,4000,5000,6500,8000];
fig=figure();
set(fig,'Position', [100 100 600 600]);

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
b1=bb1;
% 
load('data_HS_david_1107.mat');
color=[255,0,0;255,162,0;255,255,0;106,208,80;21,55,213;213,0,213]./305;

plot([0,0],[-100,120],'Color',[0.3,0.3,0.3]);hold on;
plot([-100,100],[0,0],'Color',[0.3,0.3,0.3]);
rectangle('Position',[14,13,8,11],'Linestyle','none','Facecolor',[0.8,0.8,0.8]);
plot([-10,50], [-10,50],'color',[0.6,0.6,0.6]);
%=============================»­ÍÖÔ²===================================
for il=1:5
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
 par(il,1:2)=par(il,1:2).*1;
f1=['sqrt(',num2str(par(il,1)),'*(x-',num2str(par(il,4)),')^2+',num2str(par(il,2)),'*(y-',num2str(par(il,5)),')^2+',num2str(par(il,3)),'*(x-',num2str(par(il,4)),')','*(y-',num2str(par(il,5)),'))','=',num2str(par(il,6))];
h1=ezplot(f1,[-100,120]);set(h1,'linewidth',1.5,'Color',color(il,:));hold on;
plot(par(il,4),par(il,5),'.','Color',color(il,:),'MarkerFaceColor',color(il,:),'MarkerSize',25);hold on;
end
par1=par;

%=============================»­ÍÖÔ²===================================
for il=1:5
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
 par(il,1:2)=par(il,1:2).*1;
f1=['sqrt(',num2str(par(il,1)),'*(x-',num2str(par(il,4)),')^2+',num2str(par(il,2)),'*(y-',num2str(par(il,5)),')^2+',num2str(par(il,3)),'*(x-',num2str(par(il,4)),')','*(y-',num2str(par(il,5)),'))','=',num2str(par(il,6))];
h1=ezplot(f1,[-100,120]);set(h1,'linewidth',1,'linestyle','--','Color',color(il,:));hold on;
plot(par(il,4),par(il,5),'^','Color',color(il,:),'MarkerFaceColor',color(il,:),'MarkerSize',8);hold on;
end
par2=par;


%=============================»­ÍÖÔ²===================================
for il=1:5
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
  par(il,1:2)=par(il,1:2).*1;
f1=['sqrt(',num2str(par(il,1)),'*(x-',num2str(par(il,4)),')^2+',num2str(par(il,2)),'*(y-',num2str(par(il,5)),')^2+',num2str(par(il,3)),'*(x-',num2str(par(il,4)),')','*(y-',num2str(par(il,5)),'))','=',num2str(par(il,6))];
h1=ezplot(f1,[-100,120]);set(h1,'linewidth',2,'linestyle',':','Color',color(il,:));hold on;
plot(par(il,4),par(il,5),'s','Color',color(il,:),'MarkerFaceColor',color(il,:),'MarkerSize',8);hold on;
end
par3=par;


%=============================»­ÍÖÔ²===================================
for il=1:5
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
 par(il,1:2)=par(il,1:2).*1;
f1=['sqrt(',num2str(par(il,1)),'*(x-',num2str(par(il,4)),')^2+',num2str(par(il,2)),'*(y-',num2str(par(il,5)),')^2+',num2str(par(il,3)),'*(x-',num2str(par(il,4)),')','*(y-',num2str(par(il,5)),'))','=',num2str(par(il,6))];
h1=ezplot(f1,[-100,120]);set(h1,'linewidth',1,'linestyle','-.','Color',color(il,:));hold on;
plot(par(il,4),par(il,5),'d','Color',color(il,:),'MarkerFaceColor',color(il,:),'MarkerSize',8);hold on;
end
par4=par;

al=0:0.01:2*pi;
th=-28./180.*pi;
px=cos(al)*14.7;
py=sin(al)*26.9;
x=18.7+px*cos(th)-py*sin(th);
y=19.6+px*sin(th)+py*cos(th);
plot(x,y,'Color',[0.5,0.2,0.8],'LineWidth',3);hold on;
plot(18.7,19.6,'p','Color',[0.1,0.9,0.1],'MarkerFaceColor',[0.5,0.2,0.8],'MarkerSize',15);hold on;

axis([-10 50 -10 50]);hold on;grid on;
 set(gca,'XTick',[-10:10:50]);%ÉèÖÃÒªÏÔÊ¾×ø±ê¿Ì¶È
 set(gca,'YTick',[-10:10:50]);%ÉèÖÃÒªÏÔÊ¾×ø±ê¿Ì¶È
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title('');